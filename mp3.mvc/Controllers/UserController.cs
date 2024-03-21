using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using mp3.mvc.Models.UserModels;

namespace mp3.mvc.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger<UserController> _logger;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginForm form)
        {
            //success
            Response.Cookies.Append("authorize", "vanhcan");
            return RedirectToAction("index", "home");
        }
        public IActionResult Logout()
        {
            //success
            Response.Cookies.Delete("authorize");
            return RedirectToAction("index", "home");
        }
        public IActionResult SetLanguage()
        {
            Response.Cookies.Append(
                CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture("vn-VN")),
                new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) }
            );

            return RedirectToAction("index", "home"); ;
        }
    }
}
