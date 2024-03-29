using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace App.Domain.Entities
{
    [Table("transactions")]
    public class Transaction
    {
        [Key, Column("UserID", Order = 0)]
        public Guid UserId { get; set; }
        public User? User { get; set; }
        [Key, Column("PurchaseOrderId", Order = 1)]
        public Guid PurchaseOrderId { get; set; }
        public decimal Total { get; set; }
    }
}
