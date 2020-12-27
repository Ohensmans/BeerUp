using IdentityServer.ExternalApiCall.BeerUp;
using IdentityServer.ExternalApiCall.VAT;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer
{
    public static class Configuration
    {
        public static void UseServicesVAT(this IServiceCollection services)
        {
            services.AddHttpClient<IVATService, VATService>();
        }

        public static void UseServicesOrganisation(this IServiceCollection services)
        {
            services.AddHttpClient<IOrganisationService, OrganisationService>();
        }
    }
}
