namespace App.Domain.Entities
{
    public class Transaction
    {
        public Guid UserId { get; set; }
        public User? User { get; set; }
        public Guid PurchaseOrderId { get; set; }
        public decimal Total { get; set; }
    }
}
