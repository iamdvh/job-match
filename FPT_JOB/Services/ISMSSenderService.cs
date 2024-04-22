namespace FPT_JOB.Services
{
    public interface ISMSSenderService
    {
        Task SendSMSAsync(string toPhone, string message);
    }
}
