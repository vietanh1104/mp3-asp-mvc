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

        public HomeController(ILogger<HomeController> logger, IStringLocalizer<HomeController> localizer)
        {
            _localizer = localizer;
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewData["Greeting"] =_localizer["Greeting"] ;
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}