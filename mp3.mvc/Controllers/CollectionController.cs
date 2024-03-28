using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mp3.mvc.Base;
using mp3.mvc.Infrastructure.Entities;
using System.Security.Claims;

namespace mp3.mvc.Controllers
{
    public class CollectionController : Controller
    {
        List<Media> media = new List<Media>();
        [Authorize]
        public IActionResult Index(int page = 1, int pageSize = 4)
        {
            var id = HttpContext.User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.NameIdentifier);
            var items = MockData.MediaData.Skip((page - 1) * pageSize).Take(pageSize);
            int total = (MockData.MediaData.Count + pageSize - 1) / pageSize;
            int totalItems = MockData.MediaData.Count;

            var res = new BasePagination<Media>(total, totalItems, page, pageSize, items);
            return View(res);
        }
    }
}
