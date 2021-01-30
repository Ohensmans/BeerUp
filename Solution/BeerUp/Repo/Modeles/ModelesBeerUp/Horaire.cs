using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Horaire
    {

        public Guid HorId { get; set; }

        public Guid EtaId { get; set; }

        public string HorJour { get; set; }

        public TimeSpan HorDebut { get; set; }

        public TimeSpan HorFin { get; set; }

        public virtual Etablissement Eta { get; set; }
    }
}
