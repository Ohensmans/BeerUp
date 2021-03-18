using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
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

        public string FacStatus { get; set; }

        public string FacMotif { get; set; }

        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
        public virtual ICollection<FactureOrgaAdresse> FactureOrgaAdresses { get; set; }
    }
}
