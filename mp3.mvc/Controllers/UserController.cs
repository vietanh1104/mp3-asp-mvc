using App.Application.Contracts.Infrastructure;
using App.Common.Helpers;
using App.Domain.Entities;
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
        private readonly IUserRepository _userRepository;
        public UserController(ILogger<UserController> logger, INotyfService notyfService, IUserRepository userRepository)
        {
            _logger = logger;
            _notyfService = notyfService;
            _userRepository = userRepository;
        }
        private Guid getUserId()
        {
            var Idclaim = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.NameIdentifier);
            return Guid.Parse(Idclaim!.Value);
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
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            try
            {
                var user = await _userRepository.Login(model.username, TokenHelper.md5_hash(model.password));

                // create claims
                List<Claim> claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.Username!),
                    new Claim(ClaimTypes.NameIdentifier, user.Password!, ClaimValueTypes.String)
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
            catch(Exception ex)
            {
                _notyfService.Error("Username doesnot exist or password is incorrect.");
                _logger.LogError(ex.Message);
                return View();
            }
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
            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }

                var newUser = new User
                {
                    Username = model.username,
                    DisplayName = model.displayName,
                    Password = TokenHelper.md5_hash(model.password!),
                    Address = model.address,
                    Gender = model.gender,
                    Dob = model.dob,
                };

                await _userRepository.InsertOne(newUser);

                // create claims
                List<Claim> claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, model.username),
                    new Claim(ClaimTypes.NameIdentifier, newUser.Id.ToString(), ClaimValueTypes.String)
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
                return RedirectToAction("Index", "Home");
            }catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return RedirectToAction("Error", "Home");
            }

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
        public async Task<IActionResult> GetOwnerProfile()
        {
            var user = await _userRepository.GetByIdAsync(getUserId());
            return View(user);
        }
    }
}
