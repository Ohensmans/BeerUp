using Microsoft.AspNetCore.Identity;
using System;


namespace Repo.Modeles.Identity
{

    public class Utilisateur : IdentityUser
    {
        public Guid OrgId { get; set; }

        public bool Valide { get; set; }

    }
   
}
