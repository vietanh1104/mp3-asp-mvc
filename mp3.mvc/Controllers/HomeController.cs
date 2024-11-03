using App.Application.Contracts.Infrastructure;
using App.Common.Base;
using App.Domain.Entities;
using App.Infrastructure;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using mp3.mvc.Consts;
using mp3.mvc.Models;
using System.Diagnostics;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using System.Drawing.Printing;

namespace mp3.mvc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly INotyfService _notyfService;
        private readonly IMediaRepository _mediaRepository;
        private readonly DatabaseContext _databaseContext;


        public HomeController(ILogger<HomeController> logger, INotyfService notyfService, IMediaRepository mediaRepository,
            DatabaseContext databaseContext)
        {
            _logger = logger;
            _notyfService = notyfService;
            _mediaRepository = mediaRepository;
            _databaseContext = databaseContext;
        }
        //[Authorize]
        public async Task<IActionResult> Index()
        {
            ViewData["HomePage"] = "text-dark";
            ViewData["NewestList"] = await _databaseContext.Media
                .Include(p => p.Author)
                .Include(p => p.Category)
                .Include(p => p.MediaContent)
                .AsNoTracking()
                .ToListAsync();

            ViewData["TrendingList"] = await _mediaRepository.GetTrendingItemList();
            return View();
        }
        //[Authorize]
        public async Task<IActionResult> Search(int type = 0, string searchText= "", int page = 1, int pageSize = 8)
        {
            ViewData["ExplorePage"] = "text-dark";
            if(type == 0)
            {
                var query = _databaseContext.Media
                .Include(p => p.MediaContent)
                .Include(p => p.Author)
                .Include(p => p.Category)
                .AsQueryable();
                if (!string.IsNullOrWhiteSpace(searchText))
                {
                    query = query.Where(p => p.Name.ToLower().Contains(searchText.Trim().ToLower()));
                }
               

                var total = await query.CountAsync();

                var items = await query
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                ViewData["searchText"] = searchText;
                ViewBag.Data = new BasePagination<Media>(total, page, pageSize, items);
                return View();
            }
            else if(type == 1)
            {
                var query = _databaseContext.Authors.AsQueryable();

                if (!string.IsNullOrWhiteSpace(searchText))
                {
                    query = query.Where(p => p.Name.ToLower().Contains(searchText.Trim().ToLower()));
                }


                var total = await query.CountAsync();

                var items = await query
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(p => new AuthorSearchItemViewModel
                    {
                        Id = p.Id,
                        Name = p.Name,
                    })
                    .ToListAsync();

                foreach(var item in items)
                {
                    var views = await _databaseContext.MediaViewHistory
                        .Include(p => p.Media)
                        .Where(p => p.Media.AuthorId == item.Id)
                        .CountAsync();

                    var numberOfTrack = await _databaseContext.Media.Where(p => p.AuthorId == item.Id).CountAsync();    

                    item.Views = views + 123;
                    item.NumberOfTracks = numberOfTrack;
                }

                ViewData["searchText"] = searchText;
                ViewData["Type"] = type;
                ViewBag.Data = new BasePagination<AuthorSearchItemViewModel>(total, page, pageSize, items);
                return View();
            }
            else if (type == 2)
            {
                var query = _databaseContext.Categories.AsQueryable();

                if (!string.IsNullOrWhiteSpace(searchText))
                {
                    query = query.Where(p => p.Name.ToLower().Contains(searchText.Trim().ToLower()));
                }

                var total = await query.CountAsync();

                var items = await query
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(p => new CategorySearchItemViewModel
                    {
                        Id = p.Id,
                        Name = p.Name,
                    })
                    .ToListAsync();

                foreach (var item in items)
                {
                    var numberOfTrack = await _databaseContext.Media.Where(p => p.CategoryId == item.Id).CountAsync();
                    item.NumberOfTracks = numberOfTrack;
                }

                ViewData["searchText"] = searchText;
                ViewData["Type"] = type;
                ViewBag.Data = new BasePagination<CategorySearchItemViewModel>(total, page, pageSize, items);
                return View();
            }

            ViewData["searchText"] = searchText;
            ViewData["Type"] = type;
            ViewBag.Data = new BasePagination<int>(0, page, pageSize, new List<int>());
            return View() ;
        }

        [HttpPost]
        public IActionResult SearchAction(int type = 0, string searchText = "", int page = 1, int pageSize = 8)
        {
            return RedirectToAction("Search", new { type, searchText, page, pageSize});
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet]
        public async Task<IActionResult> ListMusic()
        {
        //    var listMusic = await _databaseContext.Media
        //        .Include(p => p.Author)
        //        .Include(p => p.Category)
        //        .Include(p => p.MediaContent)
        //        .AsNoTracking()
        //        .ToListAsync();

        //    if (listMusic == null || listMusic.Count == 0)
        //    {
        //        return NotFound("Không có bài hát nào.");
        //    }

        //    // Gửi danh sách nhạc qua ViewData
        //    ViewData["ListMusic"] = listMusic;

            var items = await _databaseContext.Authors
                .Select(p => new AuthorSearchItemViewModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    AvatarUrl = !string.IsNullOrWhiteSpace(p.AvatarUrl) ? p.AvatarUrl : ResourceConst.AuthorAvatarDefaultUrl
                })
                .ToListAsync();

            // gửi danh sách nghệ sĩ qua ViewData
            ViewData["ListAuthors"] = items;

            return View(items);
        }

        [HttpGet]
        public async Task<IActionResult> MusicDetails()
        {
            ViewData["TrendingList"] = await _mediaRepository.GetTrendingItemList();
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> MusicTab()
        {
            ViewData["TrendingList"] = await _mediaRepository.GetTrendingItemList();
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Podcasts()
        {
            ViewData["TrendingList"] = await _mediaRepository.GetTrendingItemList();
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> IntroMusic()
        {
            return View();
        }
    }
}