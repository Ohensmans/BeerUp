using IdentityModel.Client;
using IdentityServer.ViewModels;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace IdentityServer.Controllers.Web
{
    public class HomeController : Controller
    {
        private readonly IIdentityServerInteractionService _interaction;
        private readonly IWebHostEnvironment _environment;

        //Adresse de retour sur le site
        private readonly string BeerUpWebUrl;
        private readonly string BeerUpWebUrlVuesBiere;
        private readonly string BeerUpWebUrlVuesEtablissement;
        private readonly string BeerUpWebUrlEtablissements;
        private readonly string BeerUpWebUrlBieres;
        private readonly string BeerUpWebUrlAchatVues;
        private readonly string BeerUpWebUrlFactures;
        private readonly string BeerUpWebUrlTarifsBiere;
        private readonly string BeerUpWebUrlTarifsEtab;
        private readonly string BeerUpWebUrlContact;

        public HomeController(IIdentityServerInteractionService interaction, IWebHostEnvironment environment, IOptions<Models.BaseUrl> url)
        {
            _interaction = interaction;
            _environment = environment;
            this.BeerUpWebUrl = url.Value.BeerUpWebUrl;
            this.BeerUpWebUrlVuesBiere = url.Value.BeerUpWebUrlVuesBiere;
            this.BeerUpWebUrlBieres = url.Value.BeerUpWebUrlBieres;
            this.BeerUpWebUrlEtablissements = url.Value.BeerUpWebUrlEtablissements;
            this.BeerUpWebUrlVuesEtablissement = url.Value.BeerUpWebUrlVuesEtablissement;
            this.BeerUpWebUrlAchatVues = url.Value.BeerUpWebUrlAchatVues;
            this.BeerUpWebUrlFactures = url.Value.BeerUpWebUrlFactures;
            this.BeerUpWebUrlTarifsBiere = url.Value.BeerUpWebUrlTarifsBiere;
            this.BeerUpWebUrlTarifsEtab = url.Value.BeerUpWebUrlTarifsEtab;
            this.BeerUpWebUrlContact = url.Value.BeerUpWebUrlContact;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Back()
        {
            return Redirect(BeerUpWebUrl);
        }

        public IActionResult VuesBiere()
        {
            return Redirect(BeerUpWebUrlVuesBiere);
        }
        public IActionResult VuesEtablissement()
        {
            return Redirect(BeerUpWebUrlVuesEtablissement);
        }

        public IActionResult AchatVues()
        {
            return Redirect(BeerUpWebUrlAchatVues);
        }

        public IActionResult Factures()
        {
            return Redirect(BeerUpWebUrlFactures);
        }

        public IActionResult TarifsBiere()
        {
            return Redirect(BeerUpWebUrlTarifsBiere);
        }

        public IActionResult TarifsEtab()
        {
            return Redirect(BeerUpWebUrlTarifsEtab);
        }


        public IActionResult Contact()
        {
            return Redirect(BeerUpWebUrlContact);
        }



        public IActionResult Etablissements()
        {
            return Redirect(BeerUpWebUrlEtablissements);
        }
        public IActionResult Bieres()
        {
            return Redirect(BeerUpWebUrlBieres);
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
            
            var client = new HttpClient();

            var response = await client.RequestClientCredentialsTokenAsync(new ClientCredentialsTokenRequest
            {
                Address = "http://192.168.179.194:5000/connect/token",

                ClientId = "IdentityBeerUp",
                ClientSecret = "secret",
                Scope = "ApiBeerUp.all"
            });
            var custom = response.Json.TryGetString("access_token");
            var user = User;
            

            string idToken = await HttpContext.GetTokenAsync("id_token");

            return View();
        }
    }
}
