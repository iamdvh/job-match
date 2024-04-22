using FPT_JOB.Enums;

namespace FPT_JOB.Models
{
    public class UserTypes
    {
        public string UserId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Email { get; set; }
        public UserTypeEnum Type { get; set; }
    }
}
