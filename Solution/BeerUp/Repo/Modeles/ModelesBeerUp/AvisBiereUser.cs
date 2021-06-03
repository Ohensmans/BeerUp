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
        public Guid OrgId { get; set; }
        public DateTime? AviBieUserDateAvis { get; set; }
        public bool AviBieUserActif { get; set; }
        public decimal AvisAcid { get; set; }

        public decimal AvisAmer { get; set; }
        public decimal AvisCafe { get; set; }
        public decimal AvisCara { get; set; }
        public decimal AvisFruit { get; set; }
        public decimal AvisHoub { get; set; }
        public decimal AvisMalt { get; set; }
        public decimal AvisSucr { get; set; }
        public decimal AvisNoteGlob { get; set; }

        public virtual Biere Bie { get; set; }

        public void Convert(AvisMoyen avis, Guid userId)
        {
            this.AviBieUserId = Guid.NewGuid();
            this.OrgId = Guid.Empty;
            this.BieId = avis.BieId;
            this.UserId = userId;
            this.AviBieUserDateAvis = DateTime.Now;
            this.AviBieUserActif = true;
            this.AvisAcid = avis.AcidMoyen;
            this.AvisAmer = avis.AmerMoyen;
            this.AvisCafe = avis.CafeMoyen;
            this.AvisCara = avis.CaraMoyen;
            this.AvisFruit = avis.FruitMoyen;
            this.AvisHoub = avis.HoubMoyen;
            this.AvisMalt = avis.MaltMoyen;
            this.AvisSucr = avis.SucrMoyen;
            this.AvisNoteGlob = avis.NoteMoyen;

        }
    }
}
