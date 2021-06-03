using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class EtablDescr : Etablissement
    {
        public bool estOuvert { get; set; }
        public decimal distance { get; set; }

        public string nomTypeEta { get; set; }

        public void Convert(Etablissement etab)
        {
            this.EtaId = etab.EtaId;
            this.OrgId = etab.OrgId;
            this.TypEtaId = etab.TypEtaId;
            this.EtaNom = etab.EtaNom;
            this.EtaTva = etab.EtaTva;
            this.EtaRue = etab.EtaRue;
            this.EtaNum = etab.EtaNum;
            this.EtaCp = etab.EtaCp;
            this.EtaVille = etab.EtaVille;
            this.EtaPays = etab.EtaPays;
            this.EtaEmail = etab.EtaEmail;
            this.EtaWeb = etab.EtaWeb;
            this.EtaPhoto = etab.EtaPhoto;
            this.EtaNbVu = etab.EtaNbVu;
            this.EtaCoordLong = etab.EtaCoordLong;
            this.EtaCoordLat = etab.EtaCoordLat;
            this.EtaActif = etab.EtaActif;
        }
    }
}
