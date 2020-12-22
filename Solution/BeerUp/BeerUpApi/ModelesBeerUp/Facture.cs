using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class Facture
    {
        public Facture()
        {
            AchatsVues = new HashSet<AchatsVue>();
            FactureOrgaAdresses = new HashSet<FactureOrgaAdresse>();
        }

        public int FacId { get; set; }
        public DateTime FacDate { get; set; }

        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
        public virtual ICollection<FactureOrgaAdresse> FactureOrgaAdresses { get; set; }
    }
}
