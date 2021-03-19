using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class AchatsVue
    {
        public Guid AchId { get; set; }
        public Guid? EtaId { get; set; }
        public Guid TransId { get; set; }
        public Guid? TarifsVueEtabId { get; set; }
        public Guid? TarifsVueBieId { get; set; }
        public Guid? BieId { get; set; }

        public virtual Biere Bie { get; set; }
        public virtual Etablissement Eta { get; set; }
        public virtual Transaction Trans { get; set; }
        public virtual TarifsVueBie TarifsVueBie { get; set; }
        public virtual TarifsVueEtab TarifsVueEtab { get; set; }
    }
}
