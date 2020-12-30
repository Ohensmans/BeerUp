using IdentityServer.Models;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class BiereService : IBiereService
    {

        private readonly string baseUrl;
        private readonly HttpClient client;

        public BiereService(IOptions<BaseUrl> url, HttpClient client)
        {
            this.baseUrl = url.Value.BeerUpApiEtab;
            this.client = client;
        }


        public async Task<List<Biere>> GetAllBieresAsync()
        {
            var httpResponse = await client.GetAsync(baseUrl);

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer les bières");
            }
            var content = await httpResponse.Content.ReadAsStringAsync();


            return JsonConvert.DeserializeObject<List<Biere>>(content);
        }


    }
}
