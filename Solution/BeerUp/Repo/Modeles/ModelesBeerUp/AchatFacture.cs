using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class AchatFacture
    {
        public int FacId { get; set; }
        public string BieNom { get; set; }
        public string EtaNom { get; set; }
        public long BieNbVuAch { get; set; }
        public long EtaNbVuAch { get; set; }
        public decimal BiePrix { get; set; }
        public decimal EtaPrix { get; set; }

        public Guid OrgId { get; set; }

        public Guid AchId { get; set; }

    }
}
