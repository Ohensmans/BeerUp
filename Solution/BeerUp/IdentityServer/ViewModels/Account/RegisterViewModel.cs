using Repo.Modeles.Identity;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Account
{
    public class RegisterViewModel
    {
        public RegisterViewModel()
        {
            this.lOrganisations = new List<Organisation>();
        }

        public Organisation Organisation { get; set; }

        public Utilisateur User { get; set; }
        public List<Organisation> lOrganisations { get; set; }

        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string ReturnUrl { get; set; }

        public bool OrgExiste { get; set; }

        public bool OrgRegister { get; set; }

        public string NomOrganisation { get; set; }

    }
}
