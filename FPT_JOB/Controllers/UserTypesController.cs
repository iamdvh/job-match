using FPT_JOB.Data;
using FPT_JOB.Models;
using FPT_JOB.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace FPT_JOB.Controllers
{
    [Authorize(Roles = "Admin")]
    public class UserTypesController : Controller
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;
        private readonly IHubContext<NotificationService> _notificationService;
        public UserTypesController(UserManager<ApplicationUser> userManager, ApplicationDbContext context, IHubContext<NotificationService> notificationService)
        {
            _userManager = userManager;
            _context = context;
            _notificationService = notificationService;
        }
        public async Task<IActionResult> Index()
        {
            var users = await _userManager.Users.ToListAsync();
            var userId = await _userManager.GetUserAsync(User);
            var userTypes = new List<UserTypes>();
            var notifications = await _context.Notification
                    .Where(n => n.ReceiverId.Equals(userId.Id))
                    .ToListAsync();
            var unreadCount = await _context.Notification.Where(n => n.ReceiverId.Equals(userId.Id)).CountAsync(n => !n.IsRead);
            ViewBag.IsRead = unreadCount;
            ViewData["Notifications"] = notifications;
            foreach (ApplicationUser user in users)
            {
                var thisViewModel = new UserTypes();
                thisViewModel.UserId = user.Id;
                thisViewModel.Email = user.Email;
                thisViewModel.FirstName = user.FirstName;
                thisViewModel.LastName = user.LastName;
                thisViewModel.Type = user.UserType;
                userTypes.Add(thisViewModel);
            }
            return View(userTypes);
        }
        public async Task<IActionResult> Manage(string userId)
        {
            if (userId == null)
            {
                return NotFound();
            }

            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
            {
                return NotFound();
            }

            var model = new UserTypes
            {
                UserId = user.Id,
                Email = user.Email,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Type = user.UserType // Chuyển UserType sang UserTypeEnum
            };
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Manage(UserTypes model)
        {
            if (ModelState.IsValid)
            {

                var user = await _userManager.FindByIdAsync(model.UserId);
                if (user == null)
                {
                    return NotFound();
                }

                // Cập nhật loại người dùng
                user.UserType = model.Type;
                await _userManager.UpdateAsync(user);
                var receiverId = await _userManager.Users.FirstOrDefaultAsync(u => u.Email.Equals(user.Email));
                await CreateNotification(receiverId.Id, "Your account upgrade request has been approved.");
                return RedirectToAction("Index");
            }

            // Log ModelState.IsValid
            Console.WriteLine("ModelState.IsValid: " + ModelState.IsValid);

                return View(model);
        }
        private async Task CreateNotification(string receiverId, string message)
        {
            var noti = new Notification
            {
                ReceiverId = receiverId,
                Message = message
            };
            _context.Notification.Add(noti);
            await _context.SaveChangesAsync();
            await _notificationService.Clients.User(receiverId).SendAsync("ReceiveNotification", message);
        }
    }
}
