using App.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace App.Infrastructure
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext()
        {
        }

        public DatabaseContext(DbContextOptions<DatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Author> Authors { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<FavouriteCollection> FavouriteCollections { get; set; } = null!;
        public virtual DbSet<Media> Media { get; set; } = null!;
        public virtual DbSet<MediaContent> MediaContents { get; set; } = null!;
        public virtual DbSet<MediaInteraction> MediaInteractions { get; set; } = null!;
        public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; } = null!;
        public virtual DbSet<PurchaseOrderItem> PurchaseOrderItems{ get; set; } = null!;
        public virtual DbSet<Transaction> Transactions { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Transaction>()
               .HasKey(e => new { e.UserId, e.PurchaseOrderId });

            modelBuilder.Entity<FavouriteCollection>()
               .HasKey(e => new { e.UserId, e.MediaId });
        }

    }
}
