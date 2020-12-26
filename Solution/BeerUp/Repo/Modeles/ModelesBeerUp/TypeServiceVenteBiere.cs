using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class TypeServiceVenteBiere
    {
        public Guid VenteBiereEtaId { get; set; }
        public Guid TypServiceId { get; set; }

        public virtual TypesService TypService { get; set; }
        public virtual VenteBiereEtum VenteBiereEta { get; set; }
    }
}
