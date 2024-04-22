using FPT_JOB.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace FPT_JOB.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<FPT_JOB.Models.Job> Job { get; set; } = default!;
        public DbSet<FPT_JOB.Models.Application> Application { get; set; } = default!;
        public DbSet<FPT_JOB.Models.Notification> Notification { get; set; } = default!;
        public DbSet<FPT_JOB.Models.Message> Message { get; set; } = default!;
    }
}
