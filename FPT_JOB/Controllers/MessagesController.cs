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

namespace FPT_JOB.Controllers
{
    public class MessagesController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public MessagesController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Messages
        public async Task<IActionResult> Index()
        {
            var crrUser = await _userManager.GetUserAsync(User);
            ViewBag.UserEmail = crrUser.Email;
            var messages = await _context.Message.ToListAsync();

            return View(messages);
        }

       
        // GET: Messages/Create
        public async Task<IActionResult> Create(Message message)
        {
            if (ModelState.IsValid)
            {
                var crrUser = await _userManager.GetUserAsync(User);
                message.Email = crrUser.Email;
                message.UserId = crrUser.Id;
                await _context.Message.AddAsync(message);
                await _context.SaveChangesAsync();
                return Ok();
            }
            return RedirectToAction(nameof(Index));
        }

    }
}
