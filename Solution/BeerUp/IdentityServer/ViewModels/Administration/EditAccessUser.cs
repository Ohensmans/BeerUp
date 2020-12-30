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
        }

        public List<Biere> lBieres { get; set; }
        public List<Etablissement> lEtablissements { get; set; }

        public string UserId { get; set; }
    }
}
