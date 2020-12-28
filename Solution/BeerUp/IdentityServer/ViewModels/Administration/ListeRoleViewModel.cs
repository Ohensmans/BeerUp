using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Administration
{
    public class ListeRoleViewModel
    {
        public string returnUrl { get; set; }

        public IEnumerable<Microsoft.AspNetCore.Identity.IdentityRole> lRoles { get; set; }
    }
}
