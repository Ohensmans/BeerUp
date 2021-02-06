using BeerUpApi.External_Api_Call;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi
{
    public static class Configuration
    {
        public static void UseServicesMap(this IServiceCollection services)
        {
            services.AddHttpClient<IMapService, MapService>();
        }


    }
}
