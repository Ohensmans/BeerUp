using IdentityServer.ViewModels;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using System.Threading.Tasks;

namespace IdentityServer.Controllers.Web
{
    public class HomeController : Controller
    {
        private readonly IIdentityServerInteractionService _interaction;
        private readonly IWebHostEnvironment _environment;

        //Adresse de retour sur le site
        private readonly string BeerUpWebUrl;

        public HomeController(IIdentityServerInteractionService interaction, IWebHostEnvironment environment, IOptions<Models.BaseUrl> url)
        {
            _interaction = interaction;
            _environment = environment;
            this.BeerUpWebUrl = url.Value.BeerUpWebUrl;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Back()
        {
            return Redirect(BeerUpWebUrl);
        }

        public async Task<IActionResult> Error(string errorId)
        {
            var vm = new ErrorViewModel();

            // retrieve error details from identityserver
            var message = await _interaction.GetErrorContextAsync(errorId);
            if (message != null)
            {
                vm.Error = message;

                if (!_environment.IsDevelopment())
                {
                    // only show in development
                    message.ErrorDescription = null;
                }
            }

            return View("Error", vm);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Error(ErrorViewModel vm)
        {
            return View("Error", vm);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult AccessDenied()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public async Task<IActionResult> Privacy()
        {
            var idToken = await HttpContext.GetTokenAsync("access_token");

            return View();
        }
    }
}
