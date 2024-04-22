using FPT_JOB.Data;
using FPT_JOB.Enums;
using FPT_JOB.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
namespace FPT_JOB.Services
{
    public class NotificationService:Hub
    {
        public async Task SendNotification(string receiverID, string message)
        {
            await Clients.User(receiverID).SendAsync("ReceiveNotification", message);
        }
    }
       
}
