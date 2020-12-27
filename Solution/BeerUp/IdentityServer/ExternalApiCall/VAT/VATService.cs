using IdentityServer.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.VAT
{
    public class VATService : IVATService
    {
        private readonly string baseUrl;
        private readonly string baseKey;
        private readonly HttpClient _client;


        public VATService(IOptions<BaseUrl> url, IOptions<BaseKey> key, HttpClient client)
        {
            _client = client;
            this.baseKey = key.Value.VATApi;
            this.baseUrl = url.Value.VatUrl;
        }

        public async Task<VATResponseModele> GetVATResponse(String VAT)
        {
            string vatRequest = "&vat_number=" + VAT;
            var httpResponse = await _client.GetAsync(this.baseUrl + this.baseKey + vatRequest);

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Cannot retrieve VAT statuts");
            }

            var content = await httpResponse.Content.ReadAsStringAsync();
            var VATResponseItem = JsonConvert.DeserializeObject<VATResponseModele>(content);

            return VATResponseItem;
        }
    }
}
