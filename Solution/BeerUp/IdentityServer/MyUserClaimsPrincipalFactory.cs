using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentityServer
{
    public class MyUserClaimsPrincipalFactory : UserClaimsPrincipalFactory<Utilisateur, IdentityRole>
    {
        public MyUserClaimsPrincipalFactory(UserManager<Utilisateur> userManager, RoleManager<IdentityRole> roleManager, IOptions<IdentityOptions> optionsAccessor)
            : base(userManager, roleManager, optionsAccessor)
        {
        }

        protected override async Task<ClaimsIdentity> GenerateClaimsAsync(Utilisateur user)
        {
            var identity = await base.GenerateClaimsAsync(user);
            identity.AddClaim(new Claim("OrgId", user.OrgId.ToString() ?? ""));
            return identity;
        }
    }
}
