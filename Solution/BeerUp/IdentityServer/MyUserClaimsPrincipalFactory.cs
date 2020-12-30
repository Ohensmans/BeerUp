using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Repo.Modeles.Identity;


namespace IdentityServer
{
    public class MyUserClaimsPrincipalFactory : UserClaimsPrincipalFactory<Utilisateur, Role>
    {
        public MyUserClaimsPrincipalFactory(UserManager<Utilisateur> userManager, RoleManager<Role> roleManager, IOptions<IdentityOptions> optionsAccessor)
            : base(userManager, roleManager, optionsAccessor)
        {
        }

        /*protected override async Task<ClaimsIdentity> GenerateClaimsAsync(Utilisateur user)
        {
            var identity = await base.GenerateClaimsAsync(user);
            identity.AddClaim(new Claim("OrgId", user.OrgId.ToString() ?? ""));
            return identity;
        }*/
    }
}
