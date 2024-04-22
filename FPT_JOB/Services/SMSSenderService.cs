
using FPT_JOB.Settings;
using Microsoft.CodeAnalysis.Options;
using Microsoft.Extensions.Options;
using Microsoft.VisualBasic.FileIO;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace FPT_JOB.Services
{
    public class SMSSenderService : ISMSSenderService
    {
        private readonly TwilioSettings _twilioSettings;
        public SMSSenderService(IOptions<TwilioSettings> twilioSettings)
        {
            _twilioSettings = twilioSettings.Value;
        }

        public async Task SendSMSAsync(string toPhone, string message)
        {
            TwilioClient.Init(_twilioSettings.AccountSId, _twilioSettings.AuthToken);
            await MessageResource.CreateAsync(
                to: toPhone,
                from: _twilioSettings.FromPhoneNumber,
                body: message
            );
        }
    }
}
