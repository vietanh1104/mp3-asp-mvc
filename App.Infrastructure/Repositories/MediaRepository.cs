using App.Application.Contracts.Infrastructure;
using App.Common.Base;
using App.Common.Helpers;
using App.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace App.Infrastructure.Repositories
{
    public class MediaRepository : BaseRepository<Media, DatabaseContext>, IMediaRepository
    {
        private readonly ILogger<MediaRepository> _logger;
        private readonly DatabaseContext _context;
        public MediaRepository(DatabaseContext context, ILogger<MediaRepository> logger) : base(context, logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<BasePagination<Media>> GetPurchasedItemList(Guid userId, int page = 1, int pageSize = 8)
        {
            try
            {
                var query = (from m in _context.Media
                            join pi in _context.PurchaseOrderItems on m.Id equals pi.MediaId
                            join p in _context.PurchaseOrders on pi.PurchaseOrderId equals p.Id
                            where p.ExpiredAt < DateTime.Now && userId == p.UserId
                            select m).Distinct();
                
                var totalItems = query.Count();
                var items = await query.GetPagination(page, pageSize).ToListAsync();
                return new BasePagination<Media>(totalItems, page, pageSize, items);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
