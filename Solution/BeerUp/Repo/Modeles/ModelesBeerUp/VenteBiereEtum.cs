using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class VenteBiereEtum
    {
        public VenteBiereEtum()
        {
            TypeServiceVenteBieres = new HashSet<TypeServiceVenteBiere>();
        }

        public Guid VenteBiereEtaId { get; set; }
        public Guid EtaId { get; set; }
        public Guid BieId { get; set; }

        public virtual Biere Bie { get; set; }
        public virtual Etablissement Eta { get; set; }
        public virtual ICollection<TypeServiceVenteBiere> TypeServiceVenteBieres { get; set; }
    }
}
