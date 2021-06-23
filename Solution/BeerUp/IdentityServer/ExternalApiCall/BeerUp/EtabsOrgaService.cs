using IdentityServer.Models;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class EtabsOrgaService : IEtabsOrgaService
    {
        private readonly string baseUrl;
        private readonly HttpClient client;

        public EtabsOrgaService(IOptions<BaseUrl> url, HttpClient client)
        {
            this.baseUrl = url.Value.BeerUpApiEtabsOrga;
            this.client = client;
        }

        public async Task<List<Etablissement>> GetAllEtablissementsOrgaAsync(Guid id, string token)
        {
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var httpResponse = await client.GetAsync($"{baseUrl}{id},{false}");

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer les bières");
            }
            var content = await httpResponse.Content.ReadAsStringAsync();
            var etabs = JsonConvert.DeserializeObject<List<Etablissement>>(content);

            return etabs;
        }
    }
}
