using App.Common.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace App.Domain.Entities
{
    [Table("purchaseOrderItems")]
    public class PurchaseOrderItem : BaseEntity
    {
        public Guid MediaId { get; set; }
        public Media? Media { get; set; }
        public Guid PurchaseOrderId { get; set; }
        public decimal? Price { get; set; }
    }
}
