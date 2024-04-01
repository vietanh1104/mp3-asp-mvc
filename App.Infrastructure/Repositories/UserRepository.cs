using App.Application.Contracts.Infrastructure;
using App.Common.Base;
using App.Domain.Entities;
using Microsoft.Extensions.Logging;

namespace App.Infrastructure.Repositories
{
    public class UserRepository : BaseRepository<User, DatabaseContext>, IUserRepository
    {
        private readonly ILogger<UserRepository> _logger;
        private readonly DatabaseContext _context;
        public UserRepository(DatabaseContext context, ILogger<UserRepository> logger) : base(context, logger)
        {
            _context = context;
            _logger = logger;
        }
    }
}
