using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using FPT_JOB.Data;
using FPT_JOB.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using FPT_JOB.Enums;
using Microsoft.AspNetCore.Hosting;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Net;
using FPT_JOB.Services;
using Twilio.Rest.Notify.V1.Service;
using System.Drawing.Text;
using Microsoft.AspNetCore.SignalR;

namespace FPT_JOB.Controllers
{
    public class JobsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IWebHostEnvironment iWebHostEnvironment;
        private readonly IHubContext<NotificationService> _notificationService;
        public JobsController(ApplicationDbContext context, UserManager<ApplicationUser> userManager, IWebHostEnvironment IWHE, IHubContext<NotificationService> notificationService)
        {
            _context = context;
            _userManager = userManager;
            iWebHostEnvironment = IWHE;
            _notificationService = notificationService;
        }

        // GET: Jobs
        public async Task<IActionResult> Index()
        {
            var crUser = await _userManager.GetUserAsync(User);
            if (crUser == null)
            {
                return Redirect("/Identity/Account/Login");
            }
            var userID = crUser.Id;
            var userType = crUser.UserType;
            var unreadCount = await _context.Notification.Where(n => n.ReceiverId.Equals(crUser.Id)).CountAsync(n => !n.IsRead);
            ViewBag.IsRead = unreadCount;
            ViewBag.ID = userID;
            ViewBag.UserType = userType;
            if (_context != null)
            {
                var notifications = await _context.Notification
                    .Where(n => n.ReceiverId.Equals(crUser.Id))
                    .ToListAsync();

                ViewData["Notifications"] = notifications;
            }
            else
            {
                // Xử lý nếu _context không được khởi tạo hoặc null
                return NotFound();
            }
            if (crUser != null)
            {
                if (crUser.UserType == UserTypeEnum.Employer)
                {
                    // Hiển thị các công việc của Employer

                    var jobs = await _context.Job.Include(j=>j.User).Where(j => j.User.Id.Equals(userID)).ToListAsync();
                    return View(jobs);
                }else if(crUser.UserType == UserTypeEnum.Seeker)
                {
                    var all = await _context.Job.Include(j => j.User).Where(j => j.isApproved.Equals("Accepted")).ToListAsync();
                    return View(all);
                }
            }
            if (_context != null)
            {
                var notifications = await _context.Notification
                    .Where(n => n.ReceiverId.Equals(crUser.Id))
                    .ToListAsync();

                ViewData["Notifications"] = notifications;
            }
            else
            {
                // Xử lý nếu _context không được khởi tạo hoặc null
                return NotFound();
            }
            // Truyền thông tin người dùng và UserType vào ViewBag
            var allJobs = await _context.Job.Include(j => j.User).ToListAsync();
            return View(allJobs);
        }

        // GET: Jobs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Job == null)
            {
                return NotFound();
            }

            var job = await _context.Job
                .FirstOrDefaultAsync(m => m.Id == id);
            if (job == null)
            {
                return NotFound();
            }

            return View(job);
        }


        // GET: Jobs/Create
        public async Task<IActionResult> Create()
        {
            var crUser = await _userManager.GetUserAsync(User);
            if (crUser == null)
            {
                return Redirect("/Identity/Account/Login");

            }
            if (crUser.UserType != UserTypeEnum.Employer)
            {

                return RedirectToAction(nameof(Index));
            }
            
            return View();
        }
        
        // POST: Jobs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Job model)
        {
            if (ModelState.IsValid)
            {
                var crUser = await _userManager.GetUserAsync(User);
                string uniqueFileName = UploadFile(model.JobFile);
                Job app = new Job
                {
                    Title = model.Title,
                    Description = model.Description,
                    RequiredQualifications = model.RequiredQualifications,
                    ApplicationDealine = model.ApplicationDealine,
                    Address = model.Address,
                    Company = model.Company,
                    UserId = crUser.Id,
                    User = crUser,
                    JobPictute = uniqueFileName,
                };
                var censor = await _userManager.Users.Where(u => u.UserType.Equals(FPT_JOB.Enums.UserTypeEnum.Censor)).ToListAsync();
                foreach (var user in censor)
                {
                    await CreateNotification(user.Id, "A new job '"+app.Title+"' is pending for approval.");
                }
                _context.Add(app);
                _context.SaveChanges();
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View();
        }
        private string UploadFile(IFormFile model)
        {
            string uniqueFileName = null;
            string upLoadFolder = Path.Combine(iWebHostEnvironment.WebRootPath, "Uploads");
            uniqueFileName = Guid.NewGuid().ToString() + "_" + model.FileName;
            string filePath = Path.Combine(upLoadFolder, uniqueFileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                model.CopyTo(fileStream);
            }
            return uniqueFileName;
        }

        // GET: Jobs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Job == null)
            {
                return NotFound();
            }

            var job = await _context.Job.FindAsync(id);
            if (job == null)
            {
                return NotFound();
            }
            var crUser = await _userManager.GetUserAsync(User);
            if(crUser == null)
            {
                return Redirect("Identity/Account/Login");

            }
            if (crUser.UserType != UserTypeEnum.Employer)
            {

                return RedirectToAction("Index", "Jobs");
            }

            return View(job);
        }

        // POST: Jobs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Job job)
        {
            if (id != job.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var existingJob = await _context.Job.FindAsync(id);
                    if (job.JobFile != null)
                    {
                        // Xóa tập tin ảnh cũ nếu có
                        if (!string.IsNullOrEmpty(existingJob.JobPictute))
                        {
                            string oldFilePath = Path.Combine(iWebHostEnvironment.WebRootPath, "Uploads", existingJob.JobPictute);
                            if (System.IO.File.Exists(oldFilePath))
                            {
                                System.IO.File.Delete(oldFilePath);
                            }
                        }

                        // Tạo tên tập tin độc đáo
                        string uniqueFileName = UploadFile(job.JobFile);

                        // Lưu tên tập tin mới vào cơ sở dữ liệu
                        existingJob.JobPictute = uniqueFileName;
                    }
                    var crUser = await _userManager.GetUserAsync(User);
                    existingJob.Title = job.Title;
                    existingJob.Description = job.Description;
                    existingJob.RequiredQualifications = job.RequiredQualifications;
                    existingJob.ApplicationDealine = job.ApplicationDealine;
                    existingJob.Address = job.Address;
                    existingJob.Company = job.Company;
                    existingJob.User = crUser;
                    existingJob.UserId = crUser.Id;
                    _context.Update(existingJob);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!JobExists(job.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }
                return View(job);
        }

        // GET: Jobs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Job == null)
            {
                return NotFound();
            }

            var job = await _context.Job
                .FirstOrDefaultAsync(m => m.Id == id);
            if (job == null)
            {
                return NotFound();
            }
            var crUser = await _userManager.GetUserAsync(User); 
            if (crUser == null)
            {
                return Redirect("Identity/Account/Login");

            }
            if (crUser.UserType != UserTypeEnum.Employer)
            {
                return RedirectToAction("Index", "Jobs");
            }

            return View(job);
        }

        // POST: Jobs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Job == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Job'  is null.");
            }
            var job = await _context.Job.FindAsync(id);
            if (job != null)
            {
                _context.Job.Remove(job);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool JobExists(int id)
        {
          return (_context.Job?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        [HttpGet]
        public async Task<IActionResult> Search(string searchString)
        {
            var crrUser = await _userManager.GetUserAsync(User);
            var userType = crrUser.UserType;
            ViewBag.UserType = userType;
            if (crrUser.UserType == FPT_JOB.Enums.UserTypeEnum.Employer)
            {
                var jobs = await _context.Job.Where(j => j.Title.Contains(searchString) && j.User.Id.Equals(crrUser.Id)).ToListAsync();
                return View("Index", jobs);
            }
            if (crrUser.UserType == FPT_JOB.Enums.UserTypeEnum.Censor)
            {
                var jobs = await _context.Job.Where(j => j.Title.Contains(searchString)).ToListAsync();
                return View("Index", jobs);
            }
            else
            {
                var jobs = await _context.Job.Where(j => j.Title.Contains(searchString) && j.isApproved.Equals("Accepted")).ToListAsync();
                // Trả về view Index với danh sách công việc đã tìm được
                return View("Index", jobs);
            }
        }
        [HttpPost]
        public async Task<IActionResult> Accept(int id)
        {
            var job = await _context.Job.FindAsync(id);
            if (job != null)
            {
                job.isApproved = "Accepted";
                _context.Update(job);
                await _context.SaveChangesAsync();
            }
            var receiverId = job.UserId;
            await CreateNotification(receiverId, "Your '" + job.Title + "' job has been approved.");
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public async Task<IActionResult> Reject(int id)
        {
            var job = await _context.Job.FindAsync(id);
            if (job != null)
            {
                job.isApproved = "Rejected";
                _context.Update(job);
                await _context.SaveChangesAsync();
            }
            var receiverId = job.UserId;
            await CreateNotification(receiverId, "Your '" + job.Title + "' job has been rejected.");
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
