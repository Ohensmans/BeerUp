using IdentityServer.Models;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class BieresOrgaService : IBieresOrgaService
    {
        private readonly string baseUrl;
        private readonly HttpClient client;

        public BieresOrgaService(IOptions<BaseUrl> url, HttpClient client)
        {
            this.baseUrl = url.Value.BeerUpApiBieresOrga;
            this.client = client;
        }

        public async Task<List<Biere>> GetAllBieresOrgaAsync(Guid id)
        {
            var httpResponse = await client.GetAsync($"{baseUrl}{id}");

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer les bières");
            }
            var content = await httpResponse.Content.ReadAsStringAsync();
            var bieres = JsonConvert.DeserializeObject<List<Biere>>(content);

            return bieres;
        }
    }
}
