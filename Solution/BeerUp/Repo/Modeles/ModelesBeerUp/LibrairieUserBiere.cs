using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class LibrairieUserBiere
    {
        public LibrairieUserBiere(Guid bieId, Guid userId)
        {
            this.BieId = bieId;
            this.UserId = userId;
        }

        public Guid BieId { get; set; }
        public Guid UserId { get; set; }

        public virtual Biere Bie { get; set; }
    }
}
