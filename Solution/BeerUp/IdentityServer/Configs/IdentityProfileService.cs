using IdentityServer4.Models;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Identity;
using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentityServer.Configs
{
    public class IdentityProfileService : IProfileService
    {

        private readonly IUserClaimsPrincipalFactory<Utilisateur> _claimsFactory;
        private readonly UserManager<Utilisateur> _userManager;

        public IdentityProfileService(IUserClaimsPrincipalFactory<Utilisateur> claimsFactory, UserManager<Utilisateur> userManager)
        {
            _claimsFactory = claimsFactory;
            _userManager = userManager;
        }

        public async Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            var sub = context.Subject.FindFirst("sub").Value;
            var user = await _userManager.FindByIdAsync(sub);
            if (user == null)
            {
                throw new ArgumentException("");
            }

            var principal = await _claimsFactory.CreateAsync(user);
            var claims = principal.Claims.ToList();
            claims.Add(new Claim("OrgId", user.OrgId.ToString() ?? ""));
            claims.Add(new Claim("Valide", user.Valide.ToString() ?? ""));

            //claims.Add(new System.Security.Claims.Claim("OrgId", user.OrgId));
            //Add more claims like this
            //claims.Add(new System.Security.Claims.Claim("MyProfileID", user.Id));

            context.IssuedClaims = claims;
        }

        public async Task IsActiveAsync(IsActiveContext context)
        {
            var sub = context.Subject.FindFirst("sub").Value;
            var user = await _userManager.FindByIdAsync(sub);
            context.IsActive = user != null;
        }
    }

}
