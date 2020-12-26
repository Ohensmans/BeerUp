using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Avis
    {
        public Avis()
        {
            AvisBiereUsers = new HashSet<AvisBiereUser>();
        }

        public Guid AvisId { get; set; }
        public int AvisAcid { get; set; }
        public int AvisCafe { get; set; }
        public int AvisCara { get; set; }
        public int AvisFruit { get; set; }
        public int AvisHoub { get; set; }
        public int AvisMalt { get; set; }
        public int AvisSucr { get; set; }
        public int AvisNoteGlob { get; set; }
        public DateTime AvisDateAvis { get; set; }

        public virtual ICollection<AvisBiereUser> AvisBiereUsers { get; set; }
    }
}
