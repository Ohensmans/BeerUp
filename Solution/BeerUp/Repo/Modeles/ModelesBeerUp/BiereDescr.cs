using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class BiereDescr
    {
        public Guid BieId { get; set; }
        public Guid EtaId { get; set; }
        public Guid TypBieId { get; set; }
        public string BieNom { get; set; }
        public string BieDesc { get; set; }
        public string BiePhoto { get; set; }
        public long BieNbVu { get; set; }
        public DateTime? BieDateCre { get; set; }
        public bool BieValide { get; set; }
        public bool BieActif { get; set; }
        public decimal BieDegreAlcool { get; set; }
        public Guid UserId { get; set; }
        public string EtaNom { get; set; }
        public string TypBieNom { get; set; }

        public decimal NoteMoyen { get; set; }

    }
}
