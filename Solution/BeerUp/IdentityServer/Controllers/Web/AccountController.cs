using IdentityServer.ExternalApiCall.BeerUp;
using IdentityServer.ViewModels;
using IdentityServer.ViewModels.Account;
using IdentityServer4.Events;
using IdentityServer4.Extensions;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Repo.Modeles.Identity;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Controllers.Web
{
    public class AccountController : Controller
    {
        private readonly UserManager<Utilisateur> _userManager;
        private readonly SignInManager<Utilisateur> _signInManager;
        private readonly IIdentityServerInteractionService _interaction;
        private readonly IEventService _events;
        private readonly IOrganisationService organisationService;
        private readonly IAdresseFacturationService adresseService;
        private const string CLIENTWEB = "BeerUpWeb";
        private const string CLIENTMOBILE = "BeerUpMobile";

        //Adresse de retour sur le site
        private readonly string BeerUpWebUrl;
        //adresse de redirection après enregistrement
        private readonly string BeerUpWebUrlLogin;


        public AccountController(UserManager<Utilisateur> userManager, SignInManager<Utilisateur> signInManager, IIdentityServerInteractionService interaction, IEventService events,
            IOptions<Models.BaseUrl> url, IOrganisationService organisationService, IAdresseFacturationService adresseService)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _interaction = interaction;
            _events = events; 
            this.BeerUpWebUrl = url.Value.BeerUpWebUrl;
            this.BeerUpWebUrlLogin = url.Value.BeerUpWebUrlLogin;
            this.organisationService = organisationService;
            this.adresseService = adresseService;
        }

        [HttpGet]
        public IActionResult RegisterMobile(string returnUrl)
        {
            try
            {
                RegisterMobileVIewModel rvm = new RegisterMobileVIewModel();
                rvm.ReturnUrl = returnUrl;

                return View(rvm);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }


        [HttpPost]
        public async Task<IActionResult> RegisterMobile(RegisterMobileVIewModel model, string button)
        {
            try
            {
                if (button.Equals("register"))
                {
                    if (ModelState.IsValid)
                    {
                        var result = await _userManager.CreateAsync(model.User, model.Password);

                        if (result.Succeeded)
                        {
                                                                                                                  
                            var signInResult = await _signInManager.PasswordSignInAsync(model.User, model.Password, false, false);

                            string role = "User";
                            model.User.OrgId = Guid.Empty;
                            model.User.Valide = true;

                            result = await _userManager.UpdateAsync(model.User);

                            if (result.Succeeded)
                            {
                                result = await _userManager.AddToRoleAsync(model.User, role);
                                if (result.Succeeded)
                                {
                                    return Redirect(model.ReturnUrl);
                                }
                            }
                        }
                    }
                    return View(model);
                }
                else
                {
                    return Redirect(model.ReturnUrl);
                }
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }


        [HttpGet]
        public async Task<IActionResult> RegisterWeb(string returnUrl)
        {
            try
            {
                RegisterViewModel rvm = new RegisterViewModel();

                List<Organisation> lOrganisations = await organisationService.GetAllOrganisationsAsync();

                foreach(Organisation org in lOrganisations)
                {
                    rvm.lOrgaNom.Add(org.OrgNom);
                }

                var rUrl = returnUrl;
                if (returnUrl == null)
                    rUrl = this.BeerUpWebUrl;

                rvm.ReturnUrl = rUrl;

                return View(rvm);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }


        [HttpPost]
        public async Task<IActionResult> RegisterWeb(RegisterViewModel model, string button)
        {
            try
            {
                if (button.Equals("register"))
                {
                    if (ModelState.IsValid)
                    {
                        var result = await _userManager.CreateAsync(model.User, model.Password);
                       
                        if (result.Succeeded)
                        {
                            //doit logger l'utilisateur pour pouvoir créer une organisation
                            var signInResult = await _signInManager.PasswordSignInAsync(model.User, model.Password, false, false);

                            string role;
                           
                            if (model.OrgExiste)
                            {
                                List<Organisation> lOrganisations = await organisationService.GetAllOrganisationsAsync();
                                model.User.OrgId = lOrganisations.FirstOrDefault(x => x.OrgNom == model.NomOrganisation).OrgId;
                                role = "GroupUser";
                            }
                            else if (model.OrgRegister)
                            {
                                role = "GroupAdmin";
                                model.User.Valide = true;
                                model.User.OrgId = AddOrganisation(model.Organisation).Result;
                                
                            }
                            else
                            {
                                return View(model);
                            }

                            result = await _userManager.UpdateAsync(model.User);
                            
                            if (result.Succeeded)
                            {
                                result = await _userManager.AddToRoleAsync(model.User, role);
                                if (result.Succeeded)
                                {                                  
                                    return Redirect(BeerUpWebUrlLogin);
                                }
                            }
                        }
                    }
                    return View(model);
                }
                else
                {
                    return Redirect(model.ReturnUrl);
                }
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [Authorize]
        private async Task<Guid> AddOrganisation (Organisation organisation)
        {

           
            try
            {
                Organisation orga = await organisationService.CreateOrganisationAsync(organisation);

                AdressesFacturation adresse = new AdressesFacturation();
                adresse.AdrFacCp = orga.OrgCp;
                adresse.AdrFacNum = orga.OrgNum;
                adresse.AdrFacPays = orga.OrgPays;
                adresse.AdrFacRue = orga.OrgRue;
                adresse.AdrFacVil = orga.OrgVille;
                adresse.OrgId = orga.OrgId;
                adresse.AdrFacDateAjout = DateTime.Now;
                adresse.AdrFacId = Guid.NewGuid();

                var result = await adresseService.CreateAdresseAsync(adresse);

                return orga.OrgId;
            }
            catch (Exception)
            {
                throw;
            }
        }


        [HttpGet]
        public IActionResult Login(string returnUrl)
        {
            var rUrl = returnUrl;

            if (returnUrl == null)
                rUrl = this.BeerUpWebUrl;

            return View(new LoginInputViewModel { ReturnUrl = rUrl });
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginInputViewModel vm, string button)
        {
            try
            {
                // check if we are in the context of an authorization request
                var context = await _interaction.GetAuthorizationContextAsync(vm.ReturnUrl);

                bool BeerUpWeb = vm.ReturnUrl.Contains(CLIENTWEB);
                bool BeerUpMobile = vm.ReturnUrl.Contains(CLIENTMOBILE);

                if (button.Equals("register"))
                {
                    if (BeerUpWeb)
                    {
                        return RedirectToAction("RegisterWeb", "Account", new { returnUrl = vm.ReturnUrl });
                    }
                    else if (BeerUpMobile)
                    {
                        return RedirectToAction("RegisterMobile", "Account", new { returnUrl = vm.ReturnUrl });
                    }
                    else
                    {
                        return View(vm);
                    }
                }
                else if (button.Equals("login"))
                {
                    if (ModelState.IsValid)
                    {
                        var result = await _signInManager.PasswordSignInAsync(vm.Username, vm.Password, vm.RememberLogin, false);

                        if (result.Succeeded)
                        {
                            //voir pour event si nécessaire

                            return Redirect(vm.ReturnUrl);
                        }
                        else
                            ModelState.AddModelError(string.Empty, "User ou mot de passe invalide");
                    }
                    return View(BuildLoginInputModel(vm));
                }
               else
                {
                    return Redirect(vm.ReturnUrl);
                }
                /*else
                {
                    if (context != null)
                    {
                        // if the user cancels, send a result back into IdentityServer as if they 
                        // denied the consent (even if this client does not require consent).
                        // this will send back an access denied OIDC error response to the client.
                        await _interaction.GrantConsentAsync(context, ConsentResponse.Denied);

                        return Redirect(vm.ReturnUrl);
                    }
                    else
                        return Redirect("~/");
                }*/
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        private LoginInputViewModel BuildLoginInputModel(LoginInputViewModel model)
        {
            LoginInputViewModel vm = new LoginInputViewModel();
            vm.ReturnUrl = model.ReturnUrl;
            vm.Username = model.Username;
            vm.RememberLogin = model.RememberLogin;
            return vm;
        }

        [HttpGet]
        public async Task<IActionResult> Logout(string logoutId)
        {
            try
            {
                // get context information (client name, post logout redirect URI and iframe for federated signout)
                var logout = await _interaction.GetLogoutContextAsync(logoutId);
                var PostLogoutRedirectUri = logout?.PostLogoutRedirectUri;

                if (PostLogoutRedirectUri==null)
                {
                    PostLogoutRedirectUri = BeerUpWebUrlLogin;
                }

                if (User?.Identity.IsAuthenticated == true)
                {
                    // delete local authentication cookie
                    await _signInManager.SignOutAsync();

                    // raise the logout event
                    await _events.RaiseAsync(new UserLogoutSuccessEvent(User.GetSubjectId(), User.GetDisplayName()));
                }

                return Redirect(PostLogoutRedirectUri);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }
    }
}
