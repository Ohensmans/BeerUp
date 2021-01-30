using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Etablissement
    {
        public Etablissement()
        {
            AchatsVues = new HashSet<AchatsVue>();
            Bieres = new HashSet<Biere>();
            VenteBiereEta = new HashSet<VenteBiereEtum>();
        }

        public Guid EtaId { get; set; }
        public Guid OrgId { get; set; }
        public Guid TypEtaId { get; set; }
        public string EtaNom { get; set; }
        public string EtaTva { get; set; }
        public string EtaRue { get; set; }
        public string EtaNum { get; set; }
        public string EtaCp { get; set; }
        public string EtaVille { get; set; }
        public string EtaPays { get; set; }
        public string EtaEmail { get; set; }
        public string EtaWeb { get; set; }
        public string EtaPhoto { get; set; }
        public long? EtaNbVu { get; set; }
        public string EtaCoord { get; set; }
        public Boolean EtaActif { get; set; }

        public virtual Organisation Org { get; set; }
        public virtual TypesEtablissement TypEta { get; set; }
        public virtual ICollection<AchatsVue> AchatsVues { get; set; }
        public virtual ICollection<Biere> Bieres { get; set; }
        public virtual ICollection<VenteBiereEtum> VenteBiereEta { get; set; }
        public virtual ICollection<Horaire> Horaires { get; set; }

        public virtual ICollection<JourFermeture> JoursFermeture { get; set; }
    }
}
