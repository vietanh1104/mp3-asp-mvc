using App.Common.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace App.Domain.Entities
{
    [Table("purchaseOrders")]
    public class PurchaseOrder : BaseEntity
    {
        public Guid UserId { get; set; }
        public User? User { get; set; }
        public DateTime ExpiredAt { get; set; }
    }
}
