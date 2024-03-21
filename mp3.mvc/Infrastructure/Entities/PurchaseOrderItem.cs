using mp3.mvc.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace mp3.mvc.Infrastructure.Entities
{
    [Table("purchaseOrderItems")]
    public class PurchaseOrderItem : BaseEntity
    {
        public Guid MediaId { get; set; }
        public Media? Media { get; set; }
        public Guid PurchaseOrderId { get; set; }
        public PurchaseOrder? PurchaseOrder { get; set; }
        public decimal? Price { get; set; }
    }
}
