using System.ComponentModel.DataAnnotations.Schema;

namespace FPT_JOB.Models
{
    public class Job
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string RequiredQualifications { get; set; }

        public DateTime ApplicationDealine { get; set; }
        public string Address { get; set; }
        public string Company { get; set; }
        public string? JobPictute { get; set; }
        [NotMapped]
        public IFormFile? JobFile { get; set; }
        [ForeignKey("User")]
        public string? UserId { get; set; }
        public virtual ApplicationUser? User { get; set; }
        public virtual ICollection<Application>? Applications { get; set; }
        public string? isApproved { get; set; }
    }
}
