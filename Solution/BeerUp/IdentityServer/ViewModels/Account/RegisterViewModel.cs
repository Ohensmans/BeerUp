using Repo.Modeles.Identity;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Account
{
    public class RegisterViewModel : RegisterMobileVIewModel
    {
        public RegisterViewModel()
        {
            this.lOrgaNom = new List<string>();
        }

        public Organisation Organisation { get; set; }


        public List<string> lOrgaNom { get; set; }


        public bool OrgExiste { get; set; }

        public bool OrgRegister { get; set; }

        public string NomOrganisation { get; set; }

    }
}
