using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Biere
    {
        public Biere()
        {
            AchatsVues = new HashSet<AchatsVue>();
            AvisBiereUsers = new HashSet<AvisBiereUser>();
            LibrairieUserBieres = new HashSet<LibrairieUserBiere>();
            VenteBiereEta = new HashSet<VenteBiereEtum>();
        }

        public Guid BieId { get; set; }
        public Guid EtaId { get; set; }
        public Guid TypBieId { get; set; }
        public string BieNom { get; set; }
        public string BieDesc { get; set; }
        public string BiePhoto { get; set; }
        public long BieNbVu { get; set; }
        public DateTime BieDateCre { get; set; }
        public bool BieValide { get; set; }
        public bool BieActif { get; set; }
        public Guid UserId { get; set; }

        public virtual Etablissement Eta { get; set; }
        public virtual TypesBiere TypBie { get; set; }
        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
        public virtual ICollection<AvisBiereUser> AvisBiereUsers { get; set; }
        public virtual ICollection<LibrairieUserBiere> LibrairieUserBieres { get; set; }
        public virtual ICollection<VenteBiereEtum> VenteBiereEta { get; set; }
    }
}
