using App.Application.Contracts.Infrastructure;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mp3.mvc.Models;
using System.Diagnostics;

namespace mp3.mvc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly INotyfService _notyfService;
        private readonly IMediaRepository _mediaRepository;

        public HomeController(ILogger<HomeController> logger, INotyfService notyfService, IMediaRepository mediaRepository)
        {
            _logger = logger;
            _notyfService = notyfService;
            _mediaRepository = mediaRepository;
        }
        [Authorize]
        public async Task<IActionResult> Index()
        {
            ViewData["TrendingList"] = await _mediaRepository.GetTrendingItemList();
            return View(MockData.MediaData);
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}