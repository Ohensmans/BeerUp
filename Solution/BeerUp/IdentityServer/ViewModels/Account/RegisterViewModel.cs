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
        public Utilisateur User { get; set; }
        public Organisation Organisation { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string ReturnUrl { get; set; }

    }
}
