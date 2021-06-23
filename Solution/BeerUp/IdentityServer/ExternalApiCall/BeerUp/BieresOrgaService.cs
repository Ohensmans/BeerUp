﻿using IdentityServer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Principal;
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

        public async Task<List<Biere>> GetAllBieresOrgaAsync(Guid id, string token)
        {

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var httpResponse = await client.GetAsync($"{baseUrl}{id},{false}");

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
