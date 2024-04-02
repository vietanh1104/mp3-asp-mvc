using App.Common.Base;
using App.Domain.Entities;

namespace App.Application.Contracts.Infrastructure
{
    public interface IMediaRepository
    {
        Task<Media> GetByIdAsync(Guid id);
        Task<Media> InsertOne(Media entity);
        Task<List<Media>> InsertMany(List<Media> entities);
        Task<BasePagination<Media>> GetPurchasedItemList(Guid userId, int page = 1, int pageSize = 8);
    }
}
