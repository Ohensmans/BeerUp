using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Administration
{
    public class RolesUserViewModel
    {
        public string RoleId { get; set; }

        public string RoleName { get; set; }

        public bool isEditable { get; set; }

        public bool isSelected { get; set; }

        public bool isFullAcces { get; set; }

        public bool isPartialAccess { get; set; }
    }
}
