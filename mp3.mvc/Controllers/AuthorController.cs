﻿using App.Application.Contracts.Infrastructure;
using App.Common.Base;
using App.Common.Helpers;
using App.Domain.Entities;
using App.Infrastructure;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mp3.mvc.Models;

namespace mp3.mvc.Controllers
{
    [Authorize]
    public class AuthorController : Controller
    {
        private readonly ILogger<AuthorController> _logger;
        private readonly INotyfService _notyfService;
        private readonly IMediaRepository _mediaRepository;
        private readonly DatabaseContext _databaseContext;

        public AuthorController(ILogger<AuthorController> logger, INotyfService notyfService, IMediaRepository mediaRepository,
            DatabaseContext databaseContext)
        {
            _logger = logger;
            _notyfService = notyfService;
            _mediaRepository = mediaRepository;
            _databaseContext = databaseContext;
        }

        public async Task<IActionResult> Index(string searchText = "", int page = 1, int pageSize = 10)
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

            foreach (var item in items)
            {
                var views = await _databaseContext.MediaViewHistory
                    .Include(p => p.Media)
                    .Where(p => p.Media.AuthorId == item.Id)
                    .CountAsync();

                var numberOfTrack = await _databaseContext.Media.Where(p => p.AuthorId == item.Id).CountAsync();

                item.Views = views;
                item.NumberOfTracks = numberOfTrack;
            }

            ViewData["searchAuthor"] = searchText;
            ViewBag.AuthorData = new BasePagination<AuthorSearchItemViewModel>(total, page, pageSize, items);
            return View();
        }

        public async Task<IActionResult> GetDetail(Guid id)
        {
            var authors = await _databaseContext.Authors.Where(p => p.Id == id).AsNoTracking().FirstOrDefaultAsync();

            var views = await _databaseContext.MediaViewHistory
                     .Include(p => p.Media)
                     .Where(p => p.Media.AuthorId == id)
                 .CountAsync();


            ViewBag.Author = authors;
            

            var tracks = await _databaseContext.Media
                .Include(p => p.MediaContent)
                .Include(p => p.Category)
                .Where(p => p.AuthorId == id)
                .OrderByDescending(p => p.CreatedAt)
                .AsNoTracking()
                .ToListAsync();
            ViewBag.Tracks = tracks;
            ViewData["Views"] = views + 123 * tracks.Count;
            return View();
        }

        public async Task<IActionResult> Update(Guid id)
        {
            var authors = await _databaseContext.Authors.Where(p => p.Id == id).AsNoTracking().FirstOrDefaultAsync();

            return View(authors);
        }

        [HttpPost]
        public async Task<IActionResult> Update(Author author)
        {
            var authorEntity = await _databaseContext.Authors.Where(p => p.Id == author.Id).FirstOrDefaultAsync();
            authorEntity.Name = author.Name;
            var changeCount = await _databaseContext.SaveChangesAsync();

            if(changeCount > 0)
            {
                _notyfService.Success("Cập nhật thành công", 2);
                return RedirectToAction(nameof(GetDetail), new { id = author.Id });
            }
            _notyfService.Success("Cập nhật thất bại", 2);
            return RedirectToAction(nameof(Update), new { id = author.Id });
        }

        public async Task<IActionResult> Delete(Guid id)
        {
            var author = await _databaseContext.Authors.Where(p => p.Id == id).AsNoTracking().FirstOrDefaultAsync();

            return View(author);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteConfirmation(Guid id)
        {
            var authors = await _databaseContext.Authors.Where(p => p.Id == id).FirstOrDefaultAsync();

            _databaseContext.Remove(authors);

            var changeCount = await _databaseContext.SaveChangesAsync();

            if (changeCount > 0)
            {
                _notyfService.Success("Xóa thành công", 2);
                return RedirectToAction(nameof(Index));
            }
            _notyfService.Error("Xóa thất bại", 2);
            return RedirectToAction(nameof(Delete), new { id = authors.Id });
        }
        public async Task<IActionResult> Add()
        {
            var author = new Author();
            author.Name = "";

            return View(author);
        }


        [HttpPost]
        public async Task<IActionResult> Add(Author request)
        {

            await _databaseContext.AddAsync(request);

            var changeCount = await _databaseContext.SaveChangesAsync();

            if (changeCount > 0)
            {
                _notyfService.Success("Thêm thành công", 2);
                return RedirectToAction(nameof(Index));
            }
            _notyfService.Error("Thêm thất bại", 2);
            return RedirectToAction(nameof(GetDetail), new { id = request.Id });
        }
    }
}
