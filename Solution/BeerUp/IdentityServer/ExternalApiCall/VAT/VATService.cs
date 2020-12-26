using IdentityServer.Models;
using Microsoft.Extensions.Configuration;
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

        private readonly HttpClient _client;

        public IConfiguration Configuration { get; }


        public VATService(IConfiguration configuration, HttpClient client)
        {
            _client = client;
            this.Configuration = configuration;
        }

        public async Task<VATResponseModele> GetVATResponse(String VAT)
        {
            string VatUrl = this.Configuration.GetSection("VatUrl").Value;
            string vatKey = this.Configuration.GetSection("VatKey").Value;

            string vatRequest = "&vat_number=" + VAT;
            var httpResponse = await _client.GetAsync(VatUrl + vatKey + vatRequest);

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
