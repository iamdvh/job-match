using FPT_JOB.Enums;
using FPT_JOB.Models;
using Microsoft.AspNetCore.Identity;

namespace FPT_JOB.Data
{
    public static class ContextSeed
    {
        public static async Task SeedRolesAsync(IServiceProvider service)
        {
            //Seed Roles
            var userManager = service.GetService<UserManager<ApplicationUser>>();
            var roleManager = service.GetService<RoleManager<IdentityRole>>();
            await roleManager.CreateAsync(new IdentityRole(Enums.Role.Admin.ToString()));
            await roleManager.CreateAsync(new IdentityRole(Enums.Role.User.ToString()));

            //creating admin
            var user = new ApplicationUser
            {
                UserName = "admin@gmail.com",
                Email = "admin@gmail.com",
                FirstName = "Dao Van",
                LastName = "Hieu",
                EmailConfirmed = true,
                PhoneNumberConfirmed = true
            };
            var userIndDb = await userManager.FindByEmailAsync(user.Email);
            if(userIndDb == null)
            {
                await userManager.CreateAsync(user, "P@ssw0rd");
                await userManager.AddToRoleAsync(user, Role.Admin.ToString());

            }
        }

    }
}
