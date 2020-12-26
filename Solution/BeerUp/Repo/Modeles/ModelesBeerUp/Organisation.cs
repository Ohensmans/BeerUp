using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Organisation
    {
        public Organisation()
        {
            Etablissements = new HashSet<Etablissement>();
            FactureOrgaAdresses = new HashSet<FactureOrgaAdresse>();
        }

        public Guid OrgId { get; set; }
        public string OrgNom { get; set; }
        public string OrgTva { get; set; }
        public string OrgRue { get; set; }
        public string OrgNum { get; set; }
        public string OrgCp { get; set; }
        public string OrgVille { get; set; }
        public string OrgPays { get; set; }
        public string OrgEmail { get; set; }
        public string OrgWeb { get; set; }
        public string OrgPhoto { get; set; }

        public virtual ICollection<Etablissement> Etablissements { get; set; }
        public virtual ICollection<FactureOrgaAdresse> FactureOrgaAdresses { get; set; }
    }
}
