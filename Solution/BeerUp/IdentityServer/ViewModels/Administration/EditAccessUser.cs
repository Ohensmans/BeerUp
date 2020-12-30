using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ViewModels.Administration
{
    public class EditAccessUser
    {
        public EditAccessUser()
        {
            this.lBieres = new List<Biere>();
            this.lEtablissements = new List<Etablissement>();
            this.lAccesBiere = new List<bool>();
            this.lAccesEtab = new List<bool>();
        }

        public List<Biere> lBieres { get; set; }
        public List<bool> lAccesBiere { get; set; }
        public List<Etablissement> lEtablissements { get; set; }
        public List<bool> lAccesEtab { get; set; }

        public string UserId { get; set; }

        public string NomRole { get; set; }
        public string NomUser { get; set; }
    }
}
