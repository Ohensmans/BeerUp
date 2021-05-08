using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class AvisMoyen
    {
        public Guid BieId { get; set; }
        public decimal AcidMoyen { get; set; }
        public decimal CafeMoyen { get; set; }
        public decimal CaraMoyen { get; set; }
        public decimal FruitMoyen { get; set; }
        public decimal HoubMoyen { get; set; }
        public decimal MaltMoyen { get; set; }
        public decimal SucrMoyen { get; set; }
        public decimal NoteMoyen { get; set; }

        public AvisMoyen(Guid bieId)
        {
            this.BieId = bieId;
            this.AcidMoyen = 0;
            this.CafeMoyen = 0;
            this.CaraMoyen = 0;
            this.FruitMoyen = 0;
            this.HoubMoyen = 0;
            this.MaltMoyen = 0;
            this.SucrMoyen = 0;
            this.NoteMoyen = 0;
        }

    }
}
