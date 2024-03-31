using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using mp3.mvc.Models;
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
                new Claim(ClaimTypes.Name, model.username),
                new Claim(ClaimTypes.NameIdentifier, new Guid().ToString(), ClaimValueTypes.String)
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
                        IsPersistent = model.isRememeberMe, // for 'remember me' feature
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
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            // create claims
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, model.username),
                new Claim(ClaimTypes.NameIdentifier, new Guid().ToString(), ClaimValueTypes.String)
            };

            // create identity
            ClaimsIdentity identity = new ClaimsIdentity(claims, "cookie");

            // create principal
            ClaimsPrincipal principal = new ClaimsPrincipal(identity);

            // sign-in
            await HttpContext.SignInAsync(
                    scheme: "CookieSecurityScheme",
                    principal: principal);
            _logger.LogDebug($"User with username: {model.username} logined.");
            _notyfService.Success("Register successfully.");
            return View();
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
        [Authorize]
        public IActionResult GetOwnerProfile()
        {
            var id = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.NameIdentifier);
            return View(MockData.UserData[0]);
        }

        public Task<Guid> GetRandom()
        {
            return Task.FromResult(Guid.NewGuid());
        }
    }
}
