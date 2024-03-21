using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using mp3.mvc.Models.UserModels;
using System.Security.Claims;
namespace mp3.mvc.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger<UserController> _logger;
        private readonly INotyfService _notyfService;
        public UserController(ILogger<UserController> logger, INotyfService notyfService)
        {
            _logger = logger;
            _notyfService = notyfService;
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
        private bool IsAuthenticated(string username, string password)
        {
            return (username == "cva" && password == "a");
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (!IsAuthenticated(model.username, model.password))
                return View();

            // create claims
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, model.username)
            };

            // create identity
            ClaimsIdentity identity = new ClaimsIdentity(claims, "cookie");

            // create principal
            ClaimsPrincipal principal = new ClaimsPrincipal(identity);

            // sign-in
            await HttpContext.SignInAsync(
                    scheme: "CookieSecurityScheme",
                    principal: principal,
                    properties: new AuthenticationProperties
                    {
                        //IsPersistent = true, // for 'remember me' feature
                        ExpiresUtc = DateTime.UtcNow.AddMinutes(1)
                    });
            _logger.LogDebug($"User with username: {model.username} logined.");
            _notyfService.Success("Login successfully.");

            return Redirect(model.RequestPath ?? "/home");
        }
        public async Task<IActionResult> Logout(string requestPath)
        {
            await HttpContext.SignOutAsync(
                    scheme: "CookieSecurityScheme");

            return RedirectToAction("Login");
        }
        public IActionResult SetLanguage()
        {
            Response.Cookies.Append(
                CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture("vn-VN")),
                new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) }
            );

            return RedirectToAction("index", "home");
        }
    }
}
