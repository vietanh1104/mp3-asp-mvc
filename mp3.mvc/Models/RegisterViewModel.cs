using System.ComponentModel.DataAnnotations;

namespace mp3.mvc.Models
{
    public class RegisterViewModel
    {
        [StringLength(20)]
        [Required(ErrorMessage = "{0} is required.")]
        public string username { get; set; } = "";
        [StringLength(50)]
        [Required(ErrorMessage = "{0} is required.")]
        public string displayName { get; set; } = "";
        public int gender { get; set; } = 0;
        public DateTime dob { get; set; }
        [Required(ErrorMessage = "{0} is required.")]
        [StringLength(200)]
        public string address { get; set; } = "";
        [Required(ErrorMessage = "{0} is required.")]
        [StringLength(200)]
        [MinLength(6, ErrorMessage = "{0} is at least 6 characters.")]
        public string? password { get; set; }
        [Required(ErrorMessage = "{0} is required.")]
        [StringLength(200)]
        [Compare("password", ErrorMessage = "Repeated password doesn't match, Type again !")]
        public string repeatedPassword { get; set; }
    }
}
