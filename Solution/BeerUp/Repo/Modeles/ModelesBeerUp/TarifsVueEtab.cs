using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class TarifsVueEtab
    {
        public TarifsVueEtab()
        {
            AchatsVues = new HashSet<AchatsVue>();
        }

        public Guid Id { get; set; }
        public long NbVue { get; set; }
        public decimal Prix { get; set; }
        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }
        public bool Actif { get; set; }

        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
    }
}
