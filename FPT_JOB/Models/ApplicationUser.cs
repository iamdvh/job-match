using FPT_JOB.Enums;
using Microsoft.AspNetCore.Identity;
using Microsoft.SqlServer.Server;

namespace FPT_JOB.Models
{
    public class ApplicationUser:IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int UsernameChangeLimit { get; set; } = 10;
        public string? ProfilePicture { get; set; }
        public UserTypeEnum UserType { get; set; }
        public virtual ICollection<Job>? Jobs { get; set; }
        public virtual ICollection<Application>? Application { get; set; }
        public virtual ICollection<Notification>? Notification { get; set; }
        public virtual ICollection<Message>? Messages { get; set; }
    }
}
