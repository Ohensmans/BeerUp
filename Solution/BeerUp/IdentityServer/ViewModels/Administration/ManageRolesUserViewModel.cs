using System;
using System.Collections.Generic;

namespace IdentityServer.ViewModels.Administration
{
    public class ManageRolesUserViewModel
    {
        public ManageRolesUserViewModel()
        {
            this.lRoles = new List<RolesUserViewModel>();
        }

        public  List<RolesUserViewModel> lRoles { get; set; }

        public string userId { get; set; }
    }
}
