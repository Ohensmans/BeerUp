using IdentityServer.ViewModels;
using IdentityServer.ViewModels.Administration;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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
                TableauBordUsersViewModel vm = new TableauBordUsersViewModel();

                vm.ReturnUrl = returnUrl;

                if (returnUrl == null)
                    returnUrl = BeerUpWebUrl;

                List<Utilisateur> util = userManager.Users.ToList();

                var userId = User.Claims.FirstOrDefault(x => x.Type.ToString() == "sub").Value;
                Guid userOrgId = userManager.Users.FirstOrDefault(u => u.Id == userId).OrgId;

                if(User.IsInRole("GroupAdmin"))
                {
                    vm.NbreUserAValider = userManager.Users.Where(u => u.OrgId == userOrgId && !u.Valide).Count();
                }

                vm.UserNames = GetListeUsers(userOrgId);
                vm.RoleNames = GetListeRoles(userOrgId);


                return View(vm);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        private List<string> GetListeUsers(Guid userOrgId)
        {
            try
            {

                if (User.IsInRole("GroupAdmin"))
                {
                    return userManager.Users.Where(u => u.OrgId == userOrgId).Select(u => u.UserName).ToList();
                }
                else
                {
                    return userManager.Users.Select(u => u.UserName).ToList();
                }
            }
            catch (Exception )
            {
                throw;
            }
        }

        private List<string> GetListeRoles(Guid userOrgId)
        {
            try
            {
                if (User.IsInRole("GroupAdmin"))
                {
                    return roleManager.Roles.Where(r => r.Name != "Administrateur").Select(r => r.Name).ToList();
                }
                else
                {
                    return roleManager.Roles.Select(r => r.Name).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        [HttpPost]
        public IActionResult Index(TableauBordUsersViewModel vm)
        {
            try
            {
                if (vm.ReturnUrl == null)
                    vm.ReturnUrl = BeerUpWebUrl;

                return Redirect(vm.ReturnUrl);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [HttpGet]
        public async Task<IActionResult> ListeUsers(string returnUrl)
        {
            try
            {
                ListeUsersViewModel vm = new ListeUsersViewModel();
                
                vm.returnUrl = returnUrl;


                var userId = User.Claims.FirstOrDefault(x => x.Type.ToString() == "sub").Value;
                Guid userOrgId = userManager.Users.FirstOrDefault(u => u.Id == userId).OrgId;

                if (User.IsInRole("Administrateur"))
                    vm.lUser = userManager.Users.ToList();
                else
                    vm.lUser = userManager.Users.Where(u => u.OrgId == userOrgId).ToList();



                foreach (Utilisateur user in vm.lUser)
                {
                    List<string> lRolesUser = (List<string>)await userManager.GetRolesAsync(user);

                    string roles = "";

                    foreach (string role in lRolesUser)
                    {
                        roles = role + "; ";
                    }

                    vm.lRoles.Add(roles);
                }

                if (vm.lUser.Count != vm.lRoles.Count)
                {
                    ErrorViewModel vme = new ErrorViewModel("Incohérence dans le nombre d'utilisateurs");
                    return View("Error", vme);
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
