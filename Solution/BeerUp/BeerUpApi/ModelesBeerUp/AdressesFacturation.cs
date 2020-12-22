using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class AdressesFacturation
    {
        public AdressesFacturation()
        {
            FactureOrgaAdresses = new HashSet<FactureOrgaAdresse>();
        }

        public Guid AdrFacId { get; set; }
        public string AdrFacRue { get; set; }
        public string AdrFacNum { get; set; }
        public string AdrFacCp { get; set; }
        public string AdrFacVil { get; set; }
        public string AdrFacPays { get; set; }
        public DateTime? AdrFacDateAjout { get; set; }

        public virtual ICollection<FactureOrgaAdresse> FactureOrgaAdresses { get; set; }
    }
}
