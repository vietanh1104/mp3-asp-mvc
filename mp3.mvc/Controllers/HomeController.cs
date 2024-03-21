using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Localization;
using mp3.mvc.Models;
using System.Diagnostics;

namespace mp3.mvc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IStringLocalizer<HomeController> _localizer;
        private readonly INotyfService _notyfService;
        public HomeController(ILogger<HomeController> logger, IStringLocalizer<HomeController> localizer, INotyfService notyfService)
        {
            _localizer = localizer;
            _logger = logger;
            _notyfService = notyfService;
        }
        [Authorize]
        public IActionResult Index()
        {
            return View(MockData.MediaData[0]);
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}