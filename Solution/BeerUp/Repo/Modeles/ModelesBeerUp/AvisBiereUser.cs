using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class AvisBiereUser
    {
        public Guid AviBieUserId { get; set; }
        public Guid AvisId { get; set; }
        public Guid BieId { get; set; }
        public Guid UserId { get; set; }
        public DateTime AviBieUserDateAvis { get; set; }
        public bool AviBieUserActif { get; set; }

        public virtual Avis Avis { get; set; }
        public virtual Biere Bie { get; set; }
    }
}
