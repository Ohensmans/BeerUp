using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class FactureOrgaAdresse
    {
        public Guid OrgId { get; set; }
        public int FacId { get; set; }
        public Guid AdrFacId { get; set; }

        public virtual AdressesFacturation AdrFac { get; set; }
        public virtual Facture Fac { get; set; }
        public virtual Organisation Org { get; set; }
    }
}
