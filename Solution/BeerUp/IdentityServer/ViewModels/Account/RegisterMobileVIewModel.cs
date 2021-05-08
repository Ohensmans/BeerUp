using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Account
{
    public class RegisterMobileVIewModel
    {
        public Utilisateur User { get; set; }


        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string ReturnUrl { get; set; }


    }
}
