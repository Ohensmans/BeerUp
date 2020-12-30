using IdentityServer.Models;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class EtablissementService : IEtablissementService
    {

        private readonly string baseUrl;
        private readonly HttpClient client;

        public EtablissementService(IOptions<BaseUrl> url, HttpClient client)
        {
            this.baseUrl = url.Value.BeerUpApiEtab;
            this.client = client;
        }

        public async Task<List<Etablissement>> GetAllEtablissementsAsync()
        {
            var httpResponse = await client.GetAsync(baseUrl);

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer les établissements");
            }
            var content = await httpResponse.Content.ReadAsStringAsync();


            return JsonConvert.DeserializeObject<List<Etablissement>>(content);
        }

    }
}
