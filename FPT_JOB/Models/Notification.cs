﻿namespace FPT_JOB.Models
{
    public class Notification
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public string? ReceiverId { get; set; }
        public virtual ApplicationUser? Receiver { get; set; }
        public bool IsRead { get; set; } = false;
    }
}
