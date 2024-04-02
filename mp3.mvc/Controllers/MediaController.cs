using App.Application.Contracts.Infrastructure;
using App.Common.Base;
using App.Domain.Entities;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace mp3.mvc.Controllers
{
    public class MediaController : Controller
    {
        private readonly ILogger<MediaController> _logger;
        private readonly INotyfService _notyfService;
        private readonly IMediaRepository _mediaRepository;
        private readonly IAuthorRepository _authorRepository;

        public MediaController(ILogger<MediaController> logger, INotyfService notyfService, IMediaRepository mediaRepository,
            IAuthorRepository authorRepository)
        {
            _logger = logger;
            _notyfService = notyfService;
            _mediaRepository = mediaRepository;
            _authorRepository = authorRepository;
        }
        private Guid getUserId()
        {
            var Idclaim = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.NameIdentifier);
            return Guid.Parse(Idclaim!.Value);
        }
        [Authorize]
        public IActionResult Index(int page = 1, int pageSize = 10)
        {
            var model = _mediaRepository.GetPurchasedItemList(getUserId());
            return View(model);
        }
        [Authorize]
        public IActionResult Collection(int page = 1, int pageSize = 10)
        {
            var model = _mediaRepository.GetPurchasedItemList(getUserId());
            return View(model);
        }
        public IActionResult Play(Guid id)
        {
            var music = _mediaRepository.GetByIdAsync(id);
            return View(music);
        }
        public async Task<BasePagination<Author>> Test(Guid categoryId, string name = "", string orderBy = "name", bool isAsc = false, int page = 1, int pageSize = 10)
        {
            var res = await _authorRepository.SearchAuthor(categoryId, name, orderBy, isAsc, page, pageSize);
            return res;
        }
    }
}
