using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace mp3.mvc.Infrastructure.Entities
{
    [Table("categories")]
    public class Category 
    {
        [Key]
        public Guid Id { get; set; }
        public string? Name { get; set; }
    }
}
