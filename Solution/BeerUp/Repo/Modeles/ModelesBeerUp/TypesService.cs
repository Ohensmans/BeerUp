using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class TypesService
    {
        public TypesService()
        {
            VenteBiereEta = new HashSet<VenteBiereEtum>();
        }

        public Guid TypServId { get; set; }
        public string TypSerLibelle { get; set; }

        public virtual ICollection<VenteBiereEtum> VenteBiereEta { get; set; }
    }
}
