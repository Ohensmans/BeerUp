using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Models
{
    public class BaseUrl
    {
        public string BeerUpWebUrl { get; set; }

        public string BeerUpApiOrga { get; set; }

        public string BeerUpApiBiere { get; set; }

        public string BeerUpApiEtab { get; set; }


        public string BeerUpApiBieresOrga{ get; set; }

        public string BeerUpApiEtabsOrga { get; set; }

        public string VatUrl { get; set; }
    }
}
