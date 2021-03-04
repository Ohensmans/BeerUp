using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class AvisBiereUser
    {
        public Guid AviBieUserId { get; set; }
        public Guid BieId { get; set; }
        public Guid UserId { get; set; }
        public DateTime? AviBieUserDateAvis { get; set; }
        public bool AviBieUserActif { get; set; }
        public int AvisAcid { get; set; }
        public int AvisCafe { get; set; }
        public int AvisCara { get; set; }
        public int AvisFruit { get; set; }
        public int AvisHoub { get; set; }
        public int AvisMalt { get; set; }
        public int AvisSucr { get; set; }
        public int AvisNoteGlob { get; set; }

        public virtual Biere Bie { get; set; }
    }
}
