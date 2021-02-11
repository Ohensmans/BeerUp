using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class VenteBiereEtum
    {

        public Guid VenteBiereEtaId { get; set; }
        public Guid EtaId { get; set; }
        public Guid BieId { get; set; }

        public Guid TypServId { get; set; }

        public virtual Biere Bie { get; set; }
        public virtual Etablissement Eta { get; set; }
        public virtual TypesService TypServ { get; set; }
    }
}
