using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class TypesService
    {
        public TypesService()
        {
            TypeServiceVenteBieres = new HashSet<TypeServiceVenteBiere>();
        }

        public Guid TypServId { get; set; }
        public string TypSerLibelle { get; set; }

        public virtual ICollection<TypeServiceVenteBiere> TypeServiceVenteBieres { get; set; }
    }
}
