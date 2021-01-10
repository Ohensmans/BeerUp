using IdentityModel.Client;
using IdentityServer.Models;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class OrganisationService : IOrganisationService
    {
        private readonly string baseUrl;
        private readonly HttpClient client;

        public OrganisationService(IOptions<BaseUrl> url, HttpClient client)
        {
            this.baseUrl = url.Value.BeerUpApiOrga;
            this.client = client;
        }

        public async Task<Organisation> CreateOrganisationAsync(Organisation organisation)
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
            var content = JsonConvert.SerializeObject(organisation);
            var httpResponse = await client.PostAsync(baseUrl, new StringContent(content, Encoding.Default, "application/json"));

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de créer l'organisation");
            }

            var createdTask = JsonConvert.DeserializeObject<Organisation>(await httpResponse.Content.ReadAsStringAsync());
            return createdTask;

        }

        public async Task DeleteOrganisationAsync(Guid id, string idToken)
        {
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", idToken);

            var httpResponse = await client.DeleteAsync($"{baseUrl}{id}");
            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de supprimer l'organisation");
            }
        }

        public async Task<List<Organisation>> GetAllOrganisationsAsync()
        {
            var httpResponse = await client.GetAsync(baseUrl);

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer les organisations");
            }
            var content = await httpResponse.Content.ReadAsStringAsync();


            return JsonConvert.DeserializeObject<List<Organisation>>(content);
        }

        public async Task<Organisation> GetOrganisationAsync(Guid id)
        {
            var httpResponse = await client.GetAsync($"{baseUrl}{id}");

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer l'organisation");
            }
            var content = await httpResponse.Content.ReadAsStringAsync();
            var organisation = JsonConvert.DeserializeObject<Organisation>(content);

            return organisation;
        }

        public async Task<Organisation> UpdateOrganisationAsync(Organisation organisation, string idToken)
        {
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", idToken);

            var content = JsonConvert.SerializeObject(organisation);

            var httpResponse = await client.PutAsync($"{baseUrl}{organisation.OrgId}", new StringContent(content, Encoding.Default, "application/json"));

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de modifier l'organisation");
            }

            var createdTask = JsonConvert.DeserializeObject<Organisation>(await httpResponse.Content.ReadAsStringAsync());
            return createdTask;
        }
    }
}