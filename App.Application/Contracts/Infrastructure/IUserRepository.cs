using App.Domain.Entities;

namespace App.Application.Contracts.Infrastructure
{
    public interface IUserRepository
    {
       Task<User> GetByIdAsync(Guid id);
    }
}
