using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace mp3.mvc.Infrastructure.Entities
{
    [Table("authors")]
    public class Author
    {
        [Key]
        public Guid Id { get; set; }
        public string? Name { get; set; }    
    }
}
