using App.Common.Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace App.Domain.Entities
{
    [Table("media_interactions")]
    public class MediaInteraction : BaseEntity
    {
        public Guid UserId { get; set; }
        public Guid MediaId { get; set; }
        public bool IsAnonymous { get; set; }
        public string? Comment { get; set; }

    }
}
