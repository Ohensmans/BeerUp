using System.Collections.Generic;

namespace IdentityServer.ViewModels.Administration
{
    public class TableauBordUsersViewModel
    {
        public TableauBordUsersViewModel()
        {
            this.NbreUserAValider = 0;
        }

        public List<string> UserNames { get; set; }

        public List<string> RoleNames { get; set; }

        public string ReturnUrl { get; set; }

        public int NbreUserAValider { get; set; }
    }
}
