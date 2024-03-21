using mp3.mvc.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace mp3.mvc.Infrastructure.Entities
{
    [Table("mediaContent")]
    public class MediaContent : BaseEntity
    {
        public int Type { get; set; }
        public string? Value { get; set; }
        public Guid MediaId { get; set; }
        public Media? Media { get; set; }
    }
}
