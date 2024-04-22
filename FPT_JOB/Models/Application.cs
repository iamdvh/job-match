using System.ComponentModel.DataAnnotations.Schema;

namespace FPT_JOB.Models
{
    public class Application
    {
        public int Id { get; set; }
        [ForeignKey("Job")]
        public int JobId { get; set; }
        [ForeignKey("User")]
        public string UserID { get; set; }
        public virtual Job? Job { get; set; }
        public virtual ApplicationUser? User { get; set; }
        public string? CVPicture { get; set; }
        [NotMapped]
        public IFormFile? CVFile { get; set; }
        public string? Status { get; set; }

    }
}
