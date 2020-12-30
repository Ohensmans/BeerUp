using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Administration
{
    public class ListeRoleViewModel
    {
        public string returnUrl { get; set; }

        public IEnumerable<Role> lRoles { get; set; }
    }
}
