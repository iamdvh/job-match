using System.ComponentModel.DataAnnotations.Schema;

namespace FPT_JOB.Models
{
    public class Message
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Text { get; set; }
        public DateTime When { get; set; }
        [ForeignKey("User")]
        public string? UserId { get; set; }
        public virtual ApplicationUser? User { get; set; }
    }
}
