using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace App.Domain.Entities
{
    [Table("authors")]
    public class Author
    {
        [Key]
        public Guid Id { get; set; }
        public string? Name { get; set; }
    }
}
