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
        public override async Task<Media> GetByIdAsync(Guid id)
        {
            return await _context.Media.Include(p => p.MediaContent)
                .Include(p => p.Author)
                .Include(p => p.Category).FirstOrDefaultAsync(p => EF.Property<Guid>(p, "Id") == id)
                ?? throw new ArgumentException($"Cannot find media with id = {id}");
        }

        public async Task<BasePagination<Media>> GetAvailableItemList(Guid userId, string orderBy = "name", bool isAsc = true, int page = 1, int pageSize = 8)
        {
            try
            {
                var query = (from m in _context.Media
                             join pi in _context.PurchaseOrderItems on m.Id equals pi.MediaId into pi_m_jointable
                             from pi in pi_m_jointable.DefaultIfEmpty()
                             join p in _context.PurchaseOrders on pi.PurchaseOrderId equals p.Id into p_pim_jointable
                             from p in p_pim_jointable.DefaultIfEmpty()
                             where (p.ExpiredAt < DateTime.Now && userId == p.UserId) || m.Price == 0
                             select m).Distinct();

                var totalItems = query.Count();
                var items = await query.Include(p => p.MediaContent).GetPagination(page, pageSize, orderBy, isAsc).ToListAsync();
                return new BasePagination<Media>(totalItems, page, pageSize, items);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<BasePagination<Media>> GetFavouriteItemList(Guid userId, string orderBy = "name", bool isAsc = true, int page = 1, int pageSize = 8)
        {
            try
            {
                var query = (from m in _context.Media
                             join pi in _context.PurchaseOrderItems on m.Id equals pi.MediaId into pi_m_jointable
                             from pi in pi_m_jointable.DefaultIfEmpty()
                             join p in _context.PurchaseOrders on pi.PurchaseOrderId equals p.Id into p_pim_jointable
                             from p in p_pim_jointable.DefaultIfEmpty()
                             where p.ExpiredAt < DateTime.Now && userId == p.UserId
                             select m).Distinct();

                var totalItems = query.Count();
                var items = await query.Include(p => p.MediaContent).GetPagination(page, pageSize).ToListAsync();
                return new BasePagination<Media>(totalItems, page, pageSize, items);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<BasePagination<Media>> GetPurchasedItemList(Guid userId, string orderBy = "name", bool isAsc = true, int page = 1, int pageSize = 8)
        {
            try
            {
                var query = _context.Media
                    .GroupJoin(_context.PurchaseOrderItems, m => m.Id, pi => pi.MediaId, (m, pi_jointable) => new { m, pi_jointable })
                    .SelectMany(x => x.pi_jointable.DefaultIfEmpty(), (x, pi) => new { x.m, pi })
                    .GroupJoin(_context.PurchaseOrders, x => x.pi.PurchaseOrderId, po => po.Id, (x, po_jointable) => new { x.m, x.pi, po_jointable })
                    .SelectMany(x => x.po_jointable.DefaultIfEmpty(), (x, po) => new { x.m, x.pi, po })
                    .Where(x => x.po.ExpiredAt < DateTime.Now)
                    .Select(x => x.m);

                var totalItems = query.Count();
                var items = await query.Include(p => p.MediaContent).Include(p => p.Author).GetPagination(page, pageSize).ToListAsync();
                return new BasePagination<Media>(totalItems, page, pageSize, items);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<List<Media>> GetTrendingItemList(bool isAsc = true, int page = 1, int pageSize = 8)
        {
            try
            {
                var query = _context.MediaViewHistory
                    .GroupBy(p => p.MediaId)
                    .OrderByDescending(p => p.Count())
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(g => _context.Media.Include(p => p.MediaContent).FirstOrDefault(m => m.Id == g.Key));

                return await query.ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
