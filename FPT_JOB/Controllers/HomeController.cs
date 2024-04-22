using FPT_JOB.Data;
using FPT_JOB.Models;
using FPT_JOB.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace FPT_JOB.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHubContext<NotificationService> _notificationService;

        public HomeController(ILogger<HomeController> logger, UserManager<ApplicationUser> userManage, ApplicationDbContext dbContext, IHubContext<NotificationService> notificationService)
        {
            _logger = logger;
            _userManager = userManage;
            _context = dbContext;
            _notificationService = notificationService;
        }

        public async Task<IActionResult> Index()
        {
            var crrId = await _userManager.GetUserAsync(User);
            var jobs = await _context.Job.OrderBy(j => Guid.NewGuid()).Take(3).Where(j => j.isApproved.Equals("Accepted")).ToListAsync();
           
            
            if (crrId == null)
            {
                // Xử lý nếu không tìm thấy người dùng hiện tại
                return View(jobs);
            }


            if (_context != null)
            {
                var userHome = await _userManager.GetUserAsync(User);
                ViewData["UserHome"] = userHome;
                var notifications = await _context.Notification
                    .Where(n => n.ReceiverId.Equals(crrId.Id))
                    .ToListAsync();

                ViewData["Notifications"] = notifications;
                var unreadCount = await _context.Notification.Where(n => n.ReceiverId.Equals(crrId.Id)).CountAsync(n => !n.IsRead);
                ViewBag.IsRead = unreadCount;
            }
            else
            {
                // Xử lý nếu _context không được khởi tạo hoặc null
                return NotFound();
            }
            return View(jobs);

        }


        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        [HttpPost]
        public async Task<IActionResult> UpdateAccount()
        {
            var crrUser = await _userManager.GetUserAsync(User);
            var censor = await _userManager.Users.Where(u => u.UserType.Equals(FPT_JOB.Enums.UserTypeEnum.Censor)).ToListAsync();
            foreach (var user in censor)
            {
                await CreateNotification(user.Id, "User with email '"+crrUser.Email+"' wants to upgrade account to Employer.");
            }
            await CreateNotification(crrUser.Id, "Your 'employer account upgrade' is pending approval.");
            return RedirectToAction(nameof(Index));
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
