using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Administration
{
    public class EditRoleViewModel
    {
        public EditRoleViewModel()
        {
            Users = new List<string>();
        }

        public string Id { get; set; }

        public string RoleName { get; set; }

        public string RoleDescription { get; set; }

        public List<string> Users { get; set; }

        public string returnUrl { get; set; }
    }
}
