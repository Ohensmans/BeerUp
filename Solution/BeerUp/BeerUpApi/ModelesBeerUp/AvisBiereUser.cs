using System;
using System.Collections.Generic;

#nullable disable

namespace BeerUpApi.ModelesBeerUp
{
    public partial class AvisBiereUser
    {
        public Guid AviBieUserId { get; set; }
        public Guid AvisId { get; set; }
        public Guid BieId { get; set; }
        public Guid UserId { get; set; }
        public DateTime AviBieUserDateAvis { get; set; }
        public bool AviBieUserActif { get; set; }

        public virtual Avi Avis { get; set; }
        public virtual Biere Bie { get; set; }
    }
}
