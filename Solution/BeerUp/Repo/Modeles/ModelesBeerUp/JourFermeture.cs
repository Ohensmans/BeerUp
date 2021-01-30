using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class JourFermeture
    {
        public Guid JouId { get; set; }

        public Guid EtaId { get; set; }

        public DateTime JouDate { get; set; }

        public virtual Etablissement Eta { get; set; }
    }
}
