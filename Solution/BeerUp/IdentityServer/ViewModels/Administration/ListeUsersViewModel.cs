using Repo.Modeles.Identity;
using System.Collections.Generic;


namespace IdentityServer.ViewModels.Administration
{
    public class ListeUsersViewModel
    {
        public ListeUsersViewModel()
        {
            this.lUser = lUser = new List<Utilisateur>(); ;
            this.lRoles = lRoles = new List<string>() ;
        }

        public string returnUrl { get; set; }

        public List<Utilisateur> lUser { get; set; }

        public List<string> lRoles { get; set; }
    }
}
