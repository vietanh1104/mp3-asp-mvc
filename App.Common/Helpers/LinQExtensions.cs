using Microsoft.EntityFrameworkCore;

namespace App.Common.Helpers
{
    public static class LinQExtensions
    { 
        public static async Task<T> GetByIdAsync<T>(this IQueryable<T> queryable, Guid id) 
            where T : class
        {
            return await queryable.FirstOrDefaultAsync(p => EF.Property<Guid>(p, "Id") == id)
                ?? throw new ArgumentException($"{nameof(T)} with id = {id} not found.");
        }

        public static async Task<T> GetByIdAsync<T>(this DbContext context, Guid id)
            where T : class
        {
            return await context.Set<T>().FirstOrDefaultAsync(p => EF.Property<Guid>(p, "Id") == id)
                ?? throw new ArgumentException($"{nameof(T)} with id = {id} not found.");
        }

        public static async Task<List<T>> GetByIdListAsync<T>(this IQueryable<T> queryable, List<Guid> idList)
            where T : class
        {
            return await queryable.Where(p => idList.Contains(EF.Property<Guid>(p, "Id"))).ToListAsync();
        }
        public static async Task<List<T>> GetByIdListAsync<T>(this DbContext context, List<Guid> idList)
           where T : class
        {
            return await context.Set<T>().Where(p => idList.Contains(EF.Property<Guid>(p, "Id"))).ToListAsync();
        }


    }
}
