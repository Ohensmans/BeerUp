using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Models
{
    public class VATResponseModele
    {
        public bool Valid { get; set; }
        public string Database { get; set; }
        public bool Format_valid { get; set; }
        public string Query { get; set; }
        public string country_code { get; set; }
        public string vat_number { get; set; }
        public string company_name { get; set; }
        public string company_address { get; set; }
    }
}
