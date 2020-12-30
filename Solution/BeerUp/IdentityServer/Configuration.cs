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

        public static void UseServicesBiere(this IServiceCollection services)
        {
            services.AddHttpClient<IBiereService, BiereService>();
        }

        public static void UseServicesEtablissement(this IServiceCollection services)
        {
            services.AddHttpClient<IEtablissementService, EtablissementService>();
        }

        public static void UseServicesBieresOrga(this IServiceCollection services)
        {
            services.AddHttpClient<IBieresOrgaService, BieresOrgaService>();
        }

        public static void UseServicesEtabsOrga(this IServiceCollection services)
        {
            services.AddHttpClient<IEtabsOrgaService, EtabsOrgaService>();
        }
    }
}
