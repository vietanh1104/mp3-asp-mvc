using App.Application.Contracts.Infrastructure;
using App.Common.Base;
using App.Domain.Entities;
using App.Infrastructure;
using App.Infrastructure.Repositories;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using mp3.mvc.Models;
using System.Drawing.Printing;
using System.Security.Claims;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace mp3.mvc.Controllers
{
    public class MediaController : Controller
    {
        private readonly ILogger<MediaController> _logger;
        private readonly INotyfService _notyfService;
        private readonly IMediaRepository _mediaRepository;
        private readonly IMediaViewHistoryRepository _mediaViewHistoryRepository;
        private readonly IAuthorRepository _authorRepository;
        private readonly DatabaseContext _databaseContext;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public MediaController(ILogger<MediaController> logger, INotyfService notyfService, IMediaRepository mediaRepository,
            IMediaViewHistoryRepository mediaViewHistoryRepository,
            IAuthorRepository authorRepository, 
            DatabaseContext databaseContext, IWebHostEnvironment webHostEnvironment)
        {
            _logger = logger;
            _notyfService = notyfService;
            _mediaRepository = mediaRepository;
            _authorRepository = authorRepository;
            _databaseContext = databaseContext;
            _mediaViewHistoryRepository = mediaViewHistoryRepository;
            _webHostEnvironment = webHostEnvironment;
        }
        private Guid getUserId()
        {
            var Idclaim = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.NameIdentifier);
            return Guid.Parse(Idclaim!.Value);
        }

        [Authorize]
        public async Task<IActionResult> Index(int page = 1, int pageSize = 10)
        {
            var model = await _mediaRepository.GetPurchasedItemList(getUserId());
            return View(model);
        }

        [Authorize]
        public async Task<IActionResult> Manage(string searchText= "", int page = 1, int pageSize = 10)
        {
            var query =  _databaseContext.Media
                .Include(p => p.Category)
                .Include(p => p.Author)
                .Include(p => p.MediaContent).AsQueryable();

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                query = query.Where(p => p.Name.ToLower().Contains(searchText.Trim().ToLower()));
            }


            var total = await query.CountAsync();

            var items = await query
                .OrderByDescending(p => p.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewData["searchText"] = searchText;
            ViewBag.Data = new BasePagination<Media>(total, page, pageSize, items);

            return View();
        }

        [Authorize]
        public async Task<IActionResult> Collection(int page = 1, int pageSize = 10)
        {
            ViewData["CollectionPage"] = "text-dark";

            var model = await _mediaRepository.GetAvailableItemList(getUserId(), page: page, pageSize: pageSize);
            return View(model);
        }
        public async Task<IActionResult> Play(Guid id)
        {
            var music = await _mediaRepository.GetByIdAsync(id);
            // add view to history
            var newView = new MediaViewHistory();
            newView.MediaId = id;
            if (User == null && User.Identity == null && User.Identity.IsAuthenticated)
            {
               
                newView.UserId = MockData.UserData[0].Id;
            }
            else
            {
                newView.UserId = getUserId();
            }

            var isSpam = await _databaseContext.MediaViewHistory
                .AnyAsync(p => p.UserId == newView.UserId && p.MediaId == newView.MediaId && p.CreatedAt >= DateTime.Now.AddMinutes(-30));
            if (!isSpam)
            {
                await _mediaViewHistoryRepository.InsertOne(newView);
            }
           
            return View(music);
        }

        public async Task<IActionResult> Delete(Guid id)
        {
            var media = await _databaseContext.Media
                .Include(p => p.Author)
                .Include(p => p.Category)
                .Include(p => p.MediaContent)
                .Where(p => p.Id == id).AsNoTracking().FirstOrDefaultAsync();

            return View(media);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteConfirmation(Guid id)
        {
            var mediaContent = await _databaseContext.MediaContents.Where(p => p.MediaId == id).ToListAsync();
            _databaseContext.RemoveRange(mediaContent);

            var mediaHistory = await _databaseContext.MediaViewHistory.Where(p => p.MediaId == id).ToListAsync();
            _databaseContext.RemoveRange(mediaHistory);

            var medias = await _databaseContext.Media.Where(p => p.Id == id).FirstOrDefaultAsync();
            _databaseContext.Remove(medias);

            var changeCount = await _databaseContext.SaveChangesAsync();

            if (changeCount > 0)
            {
                _notyfService.Success("Xóa thành công", 2);
                return RedirectToAction(nameof(Manage));
            }
            _notyfService.Error("Xóa thất bại", 2);
            return RedirectToAction(nameof(Delete), new { id = medias.Id });
        }
        public async Task<IActionResult> Add()
        {
            var media = new MediaAddViewModel();
            ViewBag.CategoryData = await _databaseContext.Categories
                .Select(p => new CategorySearchItemViewModel
                {
                    Id = p.Id,
                    Name = p.Name,
                })
                .ToListAsync();

            ViewBag.AuthorData = await _databaseContext.Authors
                .Select(p => new AuthorSearchItemViewModel
                {
                    Id = p.Id,
                    Name = p.Name,
                })
                .ToListAsync();
            return View(media);
        }


        [HttpPost]
        public async Task<IActionResult> Add(MediaAddViewModel request)
        {
            var id = Guid.NewGuid();
            var filePath = $"/media/audio/{id}.mp3";
            var mediaEntity = new Media
            {
                Id = id,
                Name = request.Name,
                Description = request.Description,
                AuthorId = request.AuthorId,
                UserId = getUserId(),
                CategoryId = request.CategoryId,
                ContentUrl = filePath
            };
            // Handle file uploads
            if (request.ContentFile != null)
            {
                using (var stream = new FileStream("wwwroot" + filePath, FileMode.Create))
                {
                    await request.ContentFile.CopyToAsync(stream);
                }
            }

            await _databaseContext.AddAsync(mediaEntity);
            foreach(var item in request.Avatar)
            {
                var mediaContentId = Guid.NewGuid();
                var fileContentPath = $"/images/media/{mediaContentId}.jpg";
                var mediaContent = new MediaContent
                {
                    Id = mediaContentId,
                    MediaId = id,
                    Value = fileContentPath
                };

                await _databaseContext.AddAsync(mediaContent);

                using (var stream = new FileStream("wwwroot"+fileContentPath, FileMode.Create))
                {
                    await item.CopyToAsync(stream);
                }
            }

            var changeCount = await _databaseContext.SaveChangesAsync();

            if (changeCount > 0)
            {
                _notyfService.Success("Thêm thành công", 2);
                return RedirectToAction(nameof(Manage));
            }
            _notyfService.Error("Thêm thất bại", 2);
            return RedirectToAction(nameof(Manage));
        }

        public async Task<IActionResult> Update(Guid id)
        {
            var mediaEntity = await _databaseContext.Media
                .Include(p => p.Category)
                .Include(p => p.Author)
                .Include(p => p.MediaContent).Where(p => p.Id == id).AsNoTracking().FirstOrDefaultAsync();

            var mediaModel = new MediaUpdateViewModel
            {
                Id = mediaEntity.Id,
                Name = mediaEntity.Name,
                Description = mediaEntity.Description,
                AuthorId = mediaEntity.AuthorId,
                CategoryId = mediaEntity.CategoryId
            };
            ViewBag.CategoryData = await _databaseContext.Categories
                .Select(p => new CategorySearchItemViewModel
                {
                    Id = p.Id,
                    Name = p.Name,
                })
                .ToListAsync();

            ViewBag.AuthorData = await _databaseContext.Authors
                .Select(p => new AuthorSearchItemViewModel
                {
                    Id = p.Id,
                    Name = p.Name,
                })
                .ToListAsync();

            return View(mediaModel);
        }

        [HttpPost]
        public async Task<IActionResult> Update(MediaUpdateViewModel request)
        {
            var mediaEntity = await _databaseContext.Media.Where(p => p.Id == request.Id).FirstOrDefaultAsync();
            mediaEntity.Name = request.Name;
            mediaEntity.Description = request.Description;
            mediaEntity.AuthorId = request.AuthorId;
            mediaEntity.CategoryId = request.CategoryId;

            if(request.ContentFile != null)
            {
                System.IO.File.Delete("wwwroot" + mediaEntity.ContentUrl);
                var filePath = $"/media/audio/{mediaEntity.Id}.mp3";
                using (var stream = new FileStream("wwwroot" + filePath, FileMode.Create))
                {
                    await request.ContentFile.CopyToAsync(stream);
                }
            }

            _databaseContext.Update(mediaEntity);

            if(request.Avatar != null && request.Avatar.Any())
            {
                var mediaContents = await _databaseContext.MediaContents.Where(p => p.MediaId == request.Id).ToListAsync();
                _databaseContext.Remove(mediaContents);

                foreach(var item in request.Avatar)
                {
                    var mediaContentId = Guid.NewGuid();
                    var fileContentPath = $"/images/media/{mediaContentId}.jpg";

                    var mediaContent = new MediaContent
                    {
                        Id = mediaContentId,
                        MediaId = mediaEntity.Id,
                        Value = fileContentPath
                    };

                    await _databaseContext.AddAsync(mediaContent);

                    using (var stream = new FileStream("wwwroot" + fileContentPath, FileMode.Create))
                    {
                        await item.CopyToAsync(stream);
                    }
                }

            }

            var changeCount = await _databaseContext.SaveChangesAsync();

            if (changeCount > 0)
            {
                _notyfService.Success("Cập nhật thành công", 2);
                return RedirectToAction(nameof(Manage));
            }
            _notyfService.Success("Cập nhật thất bại", 2);
            return RedirectToAction(nameof(Update), new { id = request.Id });
        }

        public async Task<IActionResult> History(int page = 1, int pageSize = 10)
        {
            var userId = getUserId();
            var query = _databaseContext.MediaViewHistory
                .Where(p => p.UserId == userId)
                .Include(p => p.Media).ThenInclude(p => p.Category)
                .Include(p => p.Media).ThenInclude(p => p.Author)
                .Include(p => p.Media).ThenInclude(p => p.MediaContent)
                .Select(p => p.Media)
                .AsQueryable();

            var total = await query.CountAsync();

            var items = await query
                .OrderByDescending(p => p.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.Data = new BasePagination<Media>(total, page, pageSize, items);

            return View();
        }
    }
}
