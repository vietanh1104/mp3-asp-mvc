using App.Application.Contracts.Infrastructure;
using App.Domain.Entities;
using App.Infrastructure;
using App.Infrastructure.Repositories;
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
        private readonly IMediaViewHistoryRepository _mediaViewHistoryRepository;
        private readonly IAuthorRepository _authorRepository;
        private readonly DatabaseContext _databaseContext;

        public MediaController(ILogger<MediaController> logger, INotyfService notyfService, IMediaRepository mediaRepository,
            IMediaViewHistoryRepository mediaViewHistoryRepository,
            IAuthorRepository authorRepository, 
            DatabaseContext databaseContext)
        {
            _logger = logger;
            _notyfService = notyfService;
            _mediaRepository = mediaRepository;
            _authorRepository = authorRepository;
            _databaseContext = databaseContext;
            _mediaViewHistoryRepository = mediaViewHistoryRepository;
        }
        private Guid getUserId()
        {
            var Idclaim = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.NameIdentifier);
            return Guid.Parse(Idclaim!.Value);
        }

        [Authorize]
        public async Task<IActionResult> Index(int page = 1, int pageSize = 10)
        {
            var model = await _mediaRepository.GetPurchasedItemList(getUserId());
            return View(model);
        }
        [Authorize]
        public async Task<IActionResult> Collection(int page = 1, int pageSize = 10)
        {
            ViewData["CollectionPage"] = "text-dark";

            var model = await _mediaRepository.GetAvailableItemList(getUserId(), page: page, pageSize: pageSize);
            return View(model);
        }
        public async Task<IActionResult> Play(Guid id)
        {
            var music = await _mediaRepository.GetByIdAsync(id);
            // add view to history
            var newView = new MediaViewHistory();
            newView.MediaId = id;
            if (User == null || User.Identity == null || User.Identity.IsAuthenticated)
            {
               
                newView.UserId = MockData.UserData[0].Id;
            }
            else
            {
                newView.UserId = getUserId();
            }
            await _mediaViewHistoryRepository.InsertOne(newView);
            return View(music);
        }
    }
}
