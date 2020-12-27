using IdentityServer.ViewModels;
using IdentityServer.ViewModels.Administration;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Repo.Modeles.Identity;
using System;
using System.Linq;

namespace IdentityServer.Controllers.Web
{
    [Authorize(Roles = "Administrateur, GroupAdmin")]
    public class AdministrationUsers : Controller
    {

        private readonly RoleManager<IdentityRole> roleManager;
        private readonly UserManager<Utilisateur> userManager;
        private readonly string BeerUpWebUrl;

        public AdministrationUsers(RoleManager<IdentityRole> roleManager, UserManager<Utilisateur> userManager, IOptions<Models.BaseUrl> url)
        {
            this.roleManager = roleManager;
            this.userManager = userManager;
            BeerUpWebUrl = url.Value.BeerUpWebUrl;
        }

        [HttpGet]
        public IActionResult Index(string returnUrl)
        {
            try
            {
                if (returnUrl == null)
                    returnUrl = BeerUpWebUrl;

                TableauBordUsersViewModel vm = new TableauBordUsersViewModel();

                vm.ReturnUrl = returnUrl;
                

                var userId = User.Claims.FirstOrDefault(x => x.Type.ToString() == "sub").Value;
                var userOrgId = userManager.Users.FirstOrDefault(u => u.Id == userId).OrgId;

                if(User.IsInRole("GroupAdmin"))
                {
                    vm.UserNames = userManager.Users.Where(u => u.OrgId == userOrgId).Select(u => u.UserName).ToList();
                    vm.RoleNames = roleManager.Roles.Where(r => r.Name!="Administrateur").Select(r => r.Name).ToList();
                    vm.NbreUserAValider = userManager.Users.Where(u => u.OrgId == userOrgId).Count();
                }
                else if (User.IsInRole("Administrateur"))
                {
                    vm.UserNames = userManager.Users.Select(u => u.UserName).ToList();
                    vm.RoleNames = roleManager.Roles.Select(r => r.Name).ToList();
                }
                else
                {
                    return View("AccesDenied");
                }

                return View(vm);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }
    }
}
