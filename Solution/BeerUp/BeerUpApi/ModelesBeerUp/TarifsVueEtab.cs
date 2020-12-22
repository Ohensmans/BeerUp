using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class TarifsVueEtab
    {
        public TarifsVueEtab()
        {
            AchatsVues = new HashSet<AchatsVue>();
        }

        public Guid TarifsVueEtabId { get; set; }
        public long TarifsVueEtabNbVue { get; set; }
        public decimal TarifsVueEtabPrix { get; set; }
        public DateTime TarifsVueEtabDateCre { get; set; }
        public bool TarifsVueEtabActif { get; set; }

        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
    }
}
