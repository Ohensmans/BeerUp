using IdentityModel.Client;
using IdentityServer.Models;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class AdresseFacturationService : IAdresseFacturationService
    {
        private readonly string baseUrl;
        private readonly HttpClient client;

        public AdresseFacturationService(IOptions<BaseUrl> url, HttpClient client)
        {
            this.baseUrl = url.Value.BeerUpApiAdresses;
            this.client = client;
        }

        public async Task<AdressesFacturation> CreateAdresseAsync(AdressesFacturation adresse)
        {
            var client = new HttpClient();

            var response = await client.RequestClientCredentialsTokenAsync(new ClientCredentialsTokenRequest
            {
                Address = "http://localhost:5000/connect/token",

                ClientId = "IdentityBeerUp",
                ClientSecret = "secret",
                Scope = "ApiBeerUp.all"
            });
            if (response.IsError)
                throw new Exception(response.Error);

            var token = response.AccessToken;

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var content = JsonConvert.SerializeObject(adresse);
            var httpResponse = await client.PostAsync(baseUrl, new StringContent(content, Encoding.Default, "application/json"));

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de créer l'adresse de facturation");
            }

            var createdTask = JsonConvert.DeserializeObject<AdressesFacturation>(await httpResponse.Content.ReadAsStringAsync());
            return createdTask;

        }

    }
}
