using mp3.mvc.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace mp3.mvc.Infrastructure.Entities
{
    [Table("purchaseOrders")]
    public class PurchaseOrder : BaseEntity
    {
        public Guid UserId { get; set; }
        public User? User { get; set; }
        public DateTime ExpiredAt { get; set; }
    }
}
