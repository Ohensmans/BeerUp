using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Models
{
    public class BaseUrl
    {
        public string BeerUpWebUrl { get; set; }

        public string BeerUpWebUrlEtablissements { get; set; }
        public string BeerUpWebUrlBieres { get; set; }

        public string BeerUpWebUrlVuesBiere { get; set; }
        public string BeerUpWebUrlVuesEtablissement { get; set; }
        public string BeerUpWebUrlAchatVues { get; set; }
        public string BeerUpWebUrlFactures { get; set; }
        public string BeerUpWebUrlTarifsBiere { get; set; }
        public string BeerUpWebUrlTarifsEtab { get; set; }

        public string BeerUpWebUrlContact { get; set; }



        public string BeerUpApiAdresses { get; set; }

        public string BeerUpApiOrga { get; set; }

        public string BeerUpApiBiere { get; set; }

        public string BeerUpApiEtab { get; set; }


        public string BeerUpApiBieresOrga{ get; set; }

        public string BeerUpApiEtabsOrga { get; set; }

        public string VatUrl { get; set; }
    }
}
