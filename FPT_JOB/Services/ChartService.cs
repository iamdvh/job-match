using Microsoft.AspNetCore.SignalR;
using FPT_JOB.Models;
namespace FPT_JOB.Services
{
    public class ChartService:Hub
    {
        public async Task SendMessage(Message message)
        {
            await Clients.All.SendAsync("receiveMessage", message);
        }

    }
}
