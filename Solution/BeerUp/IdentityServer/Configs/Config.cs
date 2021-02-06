using IdentityServer4;
using IdentityServer4.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer
{
    public static class Config
    {
        public static IEnumerable<IdentityResource> Ids =>
             new List<IdentityResource>
            {
                new IdentityResources.OpenId(),
                new IdentityResources.Profile(),
                new IdentityResources.Email(),
                new IdentityResource
                {
                    Name = "role",
                    UserClaims = new[] {"role"},
                    DisplayName = "User Role"
                },
                new IdentityResource
                {
                    Name = "orgId",
                    UserClaims = new[] {"OrgId"},
                    DisplayName = "User Organisation Id"
                },
                new IdentityResource
                {
                    Name = "valide",
                    UserClaims = new[] {"valide"},
                    DisplayName = "Valide"
                }



            };


        public static IEnumerable<ApiScope> ApiScopes => new List<ApiScope>
        {
        new ApiScope(name: "read",   displayName: "Read data"),
        new ApiScope(name: "write",  displayName: "Write data"),
        new ApiScope(name: "delete", displayName: "Delete data"),
        new ApiScope(name: "ApiBeerUp.all",    displayName: "All access")
        };

        public static IEnumerable<ApiResource> Apis =>
        new List<ApiResource>
        {
            new ApiResource("ApiBeerUp", "Api BeerUp")
            {
                Scopes = {"ApiBeerUp.all"}
            },
        };

        public static IEnumerable<Client> Clients =>
        new List<Client>
        {
            // interactive ASP.NET Core MVC client
            new Client
            {
                ClientId = "BeerUpApi",
                ClientName = "BeerUpApi",
                ClientSecrets = { new Secret("secret".Sha256()) },
                RequireConsent = false,
                RequirePkce = true,

                AllowedGrantTypes = GrantTypes.Code,

                // where to redirect to after login
                RedirectUris = { "http://localhost:5002/signin-oidc" },

                // where to redirect to after logout
                PostLogoutRedirectUris = { "http://localhost:5002/signout-callback-oidc" },


                AlwaysIncludeUserClaimsInIdToken = true,

                AllowedScopes = new List<string>
                {
                    IdentityServerConstants.StandardScopes.OpenId,
                    IdentityServerConstants.StandardScopes.Profile,
                    "ApiBeerUp.all",
                    "role",
                    "orgId"

                },
                AllowOfflineAccess = true
            },
                new Client
            {
                ClientId = "BeerUpWeb",
                ClientName = "BeerUpWeb",
                RequireConsent = false,
                RequireClientSecret = false,
                RequirePkce = true,

                AllowedGrantTypes = GrantTypes.Code,

                // where to redirect to after login
                RedirectUris = { "http://localhost:4200/auth-callback" },

                // where to redirect to after logout
                PostLogoutRedirectUris = { "http://localhost:4200/" },

                AllowedCorsOrigins =     { "http://localhost:4200" },

                AllowAccessTokensViaBrowser = true,
                AccessTokenLifetime = 3600,

                AlwaysIncludeUserClaimsInIdToken = true,

                AllowedScopes = new List<string>
                {
                    IdentityServerConstants.StandardScopes.OpenId,
                    IdentityServerConstants.StandardScopes.Profile,
                    "ApiBeerUp.all",
                    "role",
                    "orgId",
                    "Valide"
                },

            },
                new Client
            {
                ClientId = "IdentityBeerUp",
                ClientName = "IdentityBeerUp",
                ClientSecrets = { new Secret("secret".Sha256()) },
                RequireConsent = false,
                RequirePkce = true,

                AllowAccessTokensViaBrowser = true,
                AllowedGrantTypes = GrantTypes.HybridAndClientCredentials,

                // where to redirect to after login
                RedirectUris = { "http://localhost:5000/signin-oidc" },

                // where to redirect to after logout
                PostLogoutRedirectUris = { "http://localhost:5000/signout-callback-oidc" },


                AlwaysIncludeUserClaimsInIdToken = true,

                AllowedScopes = new List<string>
                {
                    IdentityServerConstants.StandardScopes.OpenId,
                    IdentityServerConstants.StandardScopes.Profile,
                    "ApiBeerUp.all",
                    "role",
                    "orgId",
                    "Valide"

                },
                AllowOfflineAccess = true
            }

        };
    }
}

