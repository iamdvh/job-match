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
using FPT_JOB.Enums;

namespace FPT_JOB.Controllers
{
    public class ApplicationsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment iWebHostEnvironment;
        private readonly UserManager<ApplicationUser> _userManager;

        public ApplicationsController(ApplicationDbContext context, IWebHostEnvironment IWHE, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            iWebHostEnvironment = IWHE;
            _userManager = userManager;
        }

        // GET: Applications
        public async Task<IActionResult> Index()
        {
            var crUser = await _userManager.GetUserAsync(User);

            if (crUser != null)
            {
                var userType = crUser.UserType;
                ViewBag.UserType = userType;
                if (crUser.UserType == UserTypeEnum.Seeker)
                {
                    var application = await _context.Application.Where(a => a.UserID.Equals(crUser.Id)).Include(a => a.Job).Include(a => a.User).ToListAsync();

                    return View(application);
                }
                if (crUser.UserType == UserTypeEnum.Censor)
                {
                    var application = await _context.Application.Include(a => a.Job).Include(a => a.User).ToListAsync();
                    return View(application);
                }
                if (_context != null)
                {
                    var userHome = await _userManager.GetUserAsync(User);
                    ViewData["UserHome"] = userHome;
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
                var jobs = await _context.Job.Where(j => j.User.Id.Equals(crUser.Id)).Select(job => job.Id).ToListAsync();
                var app = await _context.Application.Include(app => app.Job).Include(a => a.User).Where(a => jobs.Contains(a.JobId)).ToListAsync();
                return View(app);

            }
            else
            {
                return Redirect("Identity/Account/Login");
            }

        }

        // GET: Applications/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Application == null)
            {
                return NotFound();
            }

            var application = await _context.Application
                .FirstOrDefaultAsync(m => m.Id == id);
            if (application == null)
            {
                return NotFound();
            }

            return View(application);
        }

        // GET: Applications/Create
        public async Task<IActionResult> Create(int jobId, string userId)
        {
            var check = await _context.Application.Where(a => jobId == a.JobId && userId.Equals(a.UserID)).ToListAsync();

            if (check.Count == 0)
            {
                ViewBag.JobId = jobId;
                ViewBag.UserId = userId;
                return View();
            }
            return Redirect("/Jobs");
        }

        // POST: Applications/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Application model)
        {
            if (ModelState.IsValid)
            {
                string uniqueFileName = UploadFile(model.CVFile);
                Application app = new Application
                {
                    JobId = model.JobId, // Thiết lập JobId từ model
                    UserID = model.UserID, // Thiết lập UserID từ model
                    CVPicture = uniqueFileName,
                };
                _context.Add(app);
                _context.SaveChanges();
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

        // GET: Applications/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Application == null)
            {
                return NotFound();
            }

            var application = await _context.Application.FindAsync(id);
            if (application == null)
            {
                return NotFound();
            }
            return View(application);
        }

        // POST: Applications/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,CVPicture")] Application application)
        {
            if (id != application.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(application);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ApplicationExists(application.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(application);
        }

        // GET: Applications/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Application == null)
            {
                return NotFound();
            }

            var application = await _context.Application
                .FirstOrDefaultAsync(m => m.Id == id);
            if (application == null)
            {
                return NotFound();
            }

            return View(application);
        }

        // POST: Applications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Application == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Application'  is null.");
            }
            var application = await _context.Application.FindAsync(id);
            if (application != null)
            {
                _context.Application.Remove(application);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ApplicationExists(int id)
        {
            return (_context.Application?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        [HttpPost]
        public async Task<IActionResult> Accept(int id)
        {
            var application = await _context.Application.FindAsync(id);
            if (application != null)
            {
                var job = await _context.Job.FindAsync(application.JobId);
                var user = await _context.Users.FindAsync(application.UserID);
                application.Status = "Accepted";
                application.User = user;
                application.Job = job;
                _context.Update(application);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public async Task<IActionResult> Reject(int id)
        {
            var application = await _context.Application.FindAsync(id);
            if (application != null)
            {
                application.Status = "Rejected";
                var job = await _context.Job.FindAsync(application.JobId);
                var user = await _context.Users.FindAsync(application.UserID);
                application.User = user;
                application.Job = job;
                _context.Update(application);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
