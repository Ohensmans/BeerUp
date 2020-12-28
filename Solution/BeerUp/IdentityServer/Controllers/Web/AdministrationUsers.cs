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

                if (vm.returnUrl == null)
                    vm.returnUrl = BeerUpWebUrl;


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

        
        public async Task<IActionResult> DeleteUser(string userId, string returnUrl)
        {
            try
            {
                var user = await userManager.FindByIdAsync(userId);
                var claims = User.Claims;

                if (user == null)
                {
                    ErrorViewModel vme = new ErrorViewModel("L'utilisateur avec l'id :" + userId + " n'a pas pu être trouvé");
                    return View("Error", vme);
                }

                else
                {
                    var result = await userManager.DeleteAsync(user);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("ListeUsers", new { returnUrl = returnUrl });
                    }
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }

                    return View("ListeUsers", new { returnUrl = returnUrl });
                }
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }

        
        public async Task<IActionResult> ValidateUser(string userId, string returnUrl)
        {
            try
            {
                var user = await userManager.FindByIdAsync(userId);

                if (user == null)
                {
                    ErrorViewModel vme = new ErrorViewModel("L'utilisateur avec l'id :" + userId + " n'a pas pu être trouvé");
                    return View("Error", vme);
                }
                else
                {
                    user.Valide = !user.Valide;
                    var result = await userManager.UpdateAsync(user);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("ListeUsers", new { returnUrl = returnUrl });
                    }
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }

                    return View("ListeUsers", new { returnUrl = returnUrl });
                }
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }

        [Authorize(Roles ="Administrateur")]
        [HttpGet]
        public IActionResult CreateRole(string returnUrl)
        {
            try
            {
                CreateRoleViewModel vm = new CreateRoleViewModel();
                vm.ReturnUrl = returnUrl;

                return View(vm);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public async Task<IActionResult> CreateRole(CreateRoleViewModel model, string button)
        {
            try
            {
                if (button == "create")
                {
                    if (ModelState.IsValid)
                    {
                        IdentityRole identityRole = new IdentityRole
                        {
                            Name = model.RoleName
                        };

                        IdentityResult result = await roleManager.CreateAsync(identityRole);

                        if (result.Succeeded)
                        {
                            return RedirectToAction("ListeRoles", "AdministrationUsers", new { returnUrl = model.ReturnUrl });
                        }

                        foreach (IdentityError error in result.Errors)
                        {
                            ModelState.AddModelError("", error.Description);
                        }
                    }
                    return View(model);
                }
                return RedirectToAction("ListeRoles", "AdministrationUsers", new { returnUrl = model.ReturnUrl });
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [HttpGet]
        public async Task<IActionResult> EditRole(string id, string returnUrl)
        {
            try
            {
                var role = await roleManager.FindByIdAsync(id);

                if (role == null)
                {
                    ViewBag.ErrorMessage = $"Le Rôle avec l'Id {id} n'a pas pu être trouvé";
                    return View("Error");
                }

                var model = new EditRoleViewModel
                {
                    Id = role.Id,
                    RoleName = role.Name,
                    returnUrl = returnUrl
                };

                var userId = User.Claims.FirstOrDefault(x => x.Type.ToString() == "sub").Value;
                Guid userOrgId = userManager.Users.FirstOrDefault(u => u.Id == userId).OrgId;

                foreach (var user in userManager.Users.ToList())
                {
                    if (await userManager.IsInRoleAsync(user, role.Name))
                    {
                        if (User.IsInRole("Administrateur") || user.OrgId == userOrgId)
                            model.Users.Add(user.UserName);                       
                    }
                }

                return View(model);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [HttpPost]
        public async Task<IActionResult> EditRole(EditRoleViewModel model)
        {
            try
            {
                var role = await roleManager.FindByIdAsync(model.Id);
                if (role == null)
                {
                    ViewBag.ErrorMessage = $"Le Rôle avec l'Id {model.Id} n'a pas pu être trouvé";
                    return View("Error");
                }
                else
                {
                    role.Name = model.RoleName;
                    var result = await roleManager.UpdateAsync(role);

                    if (result.Succeeded)
                    {
                        return RedirectToAction("ListeRoles", new { returnUrl = model.returnUrl });
                    }

                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                    return View(model);
                }
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }


        [HttpGet]
        public IActionResult ListeRoles(string returnUrl)
        {
            try
            {
                ListeRoleViewModel vm = new ListeRoleViewModel();
                vm.returnUrl = returnUrl;
                if (User.IsInRole("Administrateur"))
                    vm.lRoles = roleManager.Roles;
                else
                    vm.lRoles = roleManager.Roles.Where(x => x.Name != "Administrateur"&& x.Name!="User");

                
                return View(vm);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [HttpPost]
        public async Task<IActionResult> DeleteRole(string roleId, string returnUrl)
        {
            try
            {
                var role = await roleManager.FindByIdAsync(roleId);

                if (role == null)
                {
                    ErrorViewModel vme = new ErrorViewModel("Le role avec l'id :" + roleId + " n'a pas pu être trouvé");
                    return View("Error", vme);
                }
                else
                {
                    var usersInRole = await userManager.GetUsersInRoleAsync(role.Name);

                    if (usersInRole.Count == 0)
                    {

                        var result = await roleManager.DeleteAsync(role);
                        if (result.Succeeded)
                        {
                            return RedirectToAction("ListeRoles", new { returnUrl = returnUrl });
                        }
                        foreach (var error in result.Errors)
                        {
                            ModelState.AddModelError("", error.Description);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Il y a encore des utilisateurs qui ont ce rôle, il faut d'abord les retirer");
                    }

                    return View("ListeRoles", new { returnUrl = returnUrl });
                }
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }

        }

        [HttpGet]
        public async Task<IActionResult> EditUsersInRole(string roleId, string returnUrl)
        {
            try
            {
                ViewBag.roleId = roleId;
                ViewBag.roleName = roleManager.Roles.FirstOrDefault(x => x.Id == roleId).Name;
                ViewBag.returnUrl = returnUrl;

                var role = await roleManager.FindByIdAsync(roleId);
                if (role == null)
                {
                    ViewBag.ErrorMessage = $"Le Rôle avec l'Id {roleId} n'a pas pu être trouvé";
                    return View("Error");
                }
                var model = new List<UserRoleViewModel>();

                var userId = User.Claims.FirstOrDefault(x => x.Type.ToString() == "sub").Value;
                Guid userOrgId = userManager.Users.FirstOrDefault(u => u.Id == userId).OrgId;

                foreach (var user in userManager.Users.ToList())
                {
                    if (User.IsInRole("Administrateur") || user.OrgId == userOrgId)
                    {
                        var userRoleViewModel = new UserRoleViewModel
                        {
                            UserId = user.Id,
                            UserName = user.UserName
                        };
                        if (await userManager.IsInRoleAsync(user, role.Name))
                        {
                            userRoleViewModel.isSelected = true;
                        }
                        else
                        {
                            userRoleViewModel.isSelected = false;
                        }
                        model.Add(userRoleViewModel);
                    }
                }

                return View(model);
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [HttpPost]
        public async Task<IActionResult> EditUsersInRole(List<UserRoleViewModel> model, string roleId, string returnUrl)
        {
            try
            {
                var role = await roleManager.FindByIdAsync(roleId);

                if (role == null)
                {
                    ViewBag.ErrorMessage = $"Le Rôle avec l'Id {roleId} n'a pas pu être trouvé";
                    return View("Error");
                }

                for (int i = 0; i < model.Count; i++)
                {
                    var user = await userManager.FindByIdAsync(model[i].UserId);
                    IdentityResult result = null;

                    if (model[i].isSelected && !(await userManager.IsInRoleAsync(user, role.Name)))
                    {
                        result = await userManager.AddToRoleAsync(user, role.Name);
                    }
                    else if (!model[i].isSelected && await userManager.IsInRoleAsync(user, role.Name))
                    {
                        result = await userManager.RemoveFromRoleAsync(user, role.Name);
                    }
                    else
                    {
                        continue;
                    }

                    if (result.Succeeded)
                    {
                        if (i < (model.Count - 1))
                            continue;
                        else
                            return RedirectToAction("EditRole", new { Id = roleId, ReturnUrl = returnUrl });
                    }
                }

                return RedirectToAction("EditRole", new { Id = roleId, ReturnUrl = returnUrl });
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        [HttpGet]
        public async Task<IActionResult> ManageUserRoles(string userId, string returnUrl)
        {
            try
            {
                ViewBag.userId = userId;
                ViewBag.returnUrl = returnUrl;

                var user = await userManager.FindByIdAsync(userId);

                var currentUserId = User.Claims.FirstOrDefault(x => x.Type.ToString() == "sub").Value;
                Guid currentUserOrgId = userManager.Users.FirstOrDefault(u => u.Id == currentUserId).OrgId;

                if (user !=null && (User.IsInRole("Administrateur") || user.OrgId== currentUserOrgId))
                {
                    var model = await getListUserRoles(user);

                    return View(model);
                }
                else
                {
                    ErrorViewModel vme = new ErrorViewModel("L'utilisateur avec l'id :" + userId + " n'a pas pu être trouvé");
                    return View("Error", vme);
                }

            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }

        public async Task<List<RolesUserViewModel>> getListUserRoles(Utilisateur user)
        {
            try
            {
                List<RolesUserViewModel> lRoles = new List<RolesUserViewModel>();

                List<IdentityRole> lAllRoles = roleManager.Roles.ToList();

                foreach (var role in lAllRoles)
                {
                    if (User.IsInRole("Administrateur") || (role.Name != "Administrateur"&& role.Name != "User"))
                    {
                        var rolesUserViewModel = new RolesUserViewModel
                        {
                            RoleId = role.Id,
                            RoleName = role.Name
                        };
                        rolesUserViewModel.isSelected = await userManager.IsInRoleAsync(user, role.Name);

                        lRoles.Add(rolesUserViewModel);
                    }
                }
                return lRoles;
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost]
        public async Task<IActionResult> ManageUserRoles(List<RolesUserViewModel> model, string userId, string returnUrl)
        {
            try
            {
                var user = await userManager.FindByIdAsync(userId);

                if (user == null)
                {
                    ErrorViewModel vme = new ErrorViewModel("L'utilisateur avec l'id :" + userId + " n'a pas pu être trouvé");
                    return View("Error", vme);
                }

                var roles = await userManager.GetRolesAsync(user);
                var result = await userManager.RemoveFromRolesAsync(user, roles);

                if (!result.Succeeded)
                {
                    ModelState.AddModelError("", "Ne peut pas retirer l'utilisaeur des rôles existants");
                    return View(model);
                }

                result = await userManager.AddToRolesAsync(user, model.Where(x => x.isSelected).Select(y => y.RoleName));

                if (!result.Succeeded)
                {
                    ModelState.AddModelError("", "Ne peut pas ajouter l'utilisaeur à ces rôles");
                    return View(model);
                }

                return RedirectToAction("EditUser", new { userId, returnUrl });
            }
            catch (Exception ex)
            {
                ErrorViewModel vme = new ErrorViewModel(ex.Message);
                return View("Error", vme);
            }
        }


    }
}
