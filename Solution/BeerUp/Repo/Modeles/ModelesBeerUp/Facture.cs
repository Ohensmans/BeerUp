using System;
using System.Collections.Generic;

#nullable disable

namespace Repo.Modeles.ModelesBeerUp
{
    public partial class Facture
    {

        public int FacId { get; set; }
        public DateTime FacDate { get; set; }

        public string FacMotif { get; set; }

        public Guid TransId { get; set; }

        public Guid AdrFacId { get; set; }

        public virtual Transaction Trans { get; set; }
        public virtual AdressesFacturation Adresse { get; set; }


    }
}
