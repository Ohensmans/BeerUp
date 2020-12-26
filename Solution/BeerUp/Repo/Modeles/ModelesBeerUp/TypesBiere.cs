using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class TypesBiere
    {
        public TypesBiere()
        {
            Bieres = new HashSet<Biere>();
        }

        public Guid TypBieId { get; set; }
        public string TypBieNom { get; set; }

        public virtual ICollection<Biere> Bieres { get; set; }
    }
}
