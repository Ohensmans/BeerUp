using BeerUpApi.ParamAccess;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Repo.Modeles.POC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace BeerUpApi.External_Api_Call
{
    public class MapService : IMapService
    {
        private readonly string baseUrl;
        private readonly HttpClient _client;
        private readonly string baseKey;
        private readonly string baseParam;

        public MapService(IOptions<BaseUrl> url, IOptions<BaseKey> key, IOptions<BaseParam> param, HttpClient client)
        {
            _client = client;
            this.baseUrl = url.Value.MapQuest;
            this.baseKey = key.Value.MapQuest;
            this.baseParam = param.Value.MapQuest;
        }

        public async Task<Coordonne> GetCoordinates(string adresse)
        {
            var key = "key=" + baseKey;
            var location = "&location=" + adresse;

            var content = baseUrl + key + location + baseParam;

            var httpResponse = await _client.GetAsync(content);

            if (!httpResponse.IsSuccessStatusCode)
            {
                throw new Exception("Impossible de récupérer les coordonnées");
            }

            var response = await httpResponse.Content.ReadAsStringAsync();

            var oMycustomclassname = JsonConvert.DeserializeObject<dynamic>(response);

            Coordonne coord = new Coordonne();
            coord.Latitude = oMycustomclassname.results[0].locations[0].displayLatLng.lat;
            coord.Longitude = oMycustomclassname.results[0].locations[0].displayLatLng.lng;

            return coord;
        }
    }
}
