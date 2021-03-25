using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class AchatBieresFacture
    {
        public int FacId { get; set; }
        public string BieNom { get; set; }
        public long BieNbVuAch { get; set; }
        public decimal BiePrix { get; set; }

        public Guid OrgId { get; set; }

        public Guid AchId { get; set; }

    }
}
