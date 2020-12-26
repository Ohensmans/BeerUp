using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class TarifsVueBie
    {
        public TarifsVueBie()
        {
            AchatsVues = new HashSet<AchatsVue>();
        }

        public Guid TarifsVueBieId { get; set; }
        public long TarifsVueBieNbVue { get; set; }
        public decimal TarifsVueBiePrix { get; set; }
        public DateTime TarifsVueBieDateCre { get; set; }
        public int TarifsVueBieActif { get; set; }

        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
    }
}
