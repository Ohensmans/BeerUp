using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class LibrairieUserBiere
    {
        public Guid BieId { get; set; }
        public Guid UserId { get; set; }

        public virtual Biere Bie { get; set; }
    }
}
