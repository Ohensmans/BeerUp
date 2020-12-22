using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class TypesEtablissement
    {
        public TypesEtablissement()
        {
            Etablissements = new HashSet<Etablissement>();
        }

        public Guid TypEtaId { get; set; }
        public string TypEtaNom { get; set; }

        public virtual ICollection<Etablissement> Etablissements { get; set; }
    }
}
