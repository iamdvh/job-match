using FPT_JOB.Data;
using FPT_JOB.Models;
using FPT_JOB.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace FPT_JOB.Controllers
{
    public class NotificationsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        public NotificationsController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Notifications
        [Authorize]
        public async Task<IActionResult> Index()
        {
            var currentUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var notifications = await _context.Notification.Where(n => n.ReceiverId == currentUserId).ToListAsync();
            ViewBag.UnreadNotificationCount = await GetUnreadNotificationCount();
            return View(notifications);
        }

        public async Task<IActionResult> MarkAsRead(int id)
        {
            var notification = await _context.Notification.FindAsync(id);
            if (notification != null)
            {
                notification.IsRead = true;
                _context.Notification.Update(notification);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }


        public async Task<int> GetUnreadNotificationCount()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var unreadCount = await _context.Notification.Where(n => n.ReceiverId == userId && !n.IsRead).CountAsync();
            return unreadCount;
        }
        [HttpPost]
        public async Task<IActionResult> UpdateIsRead(int id)
        {
            var notification = await _context.Notification.FindAsync(id);

            if (notification == null)
            {
                return NotFound();
            }

            notification.IsRead = true;
            await _context.SaveChangesAsync();

            return Redirect("/Jobs");
        }
        [HttpGet]
        public async Task<IActionResult> GetLatestNotification()
        {
            
            var latestNotification = _context.Notification.OrderByDescending(n => n.Id).FirstOrDefault();
            return Json(new { id = latestNotification.Id, message = latestNotification.Message });
        }

        [HttpGet]
        public async Task<IActionResult> GetIsRead()
        {
            var crrUser = await _userManager.GetUserAsync(User);
            var unreadCount = await _context.Notification.Where(n => n.ReceiverId.Equals(crrUser.Id)).CountAsync(n => !n.IsRead);
            return Json(new { unreadCount });
        }
    }
}

