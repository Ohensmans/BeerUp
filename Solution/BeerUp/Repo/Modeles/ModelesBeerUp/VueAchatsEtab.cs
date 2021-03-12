using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class VueAchatsEtab
    {
        public Guid Id { get; set; }

        public string Nom { get; set; }

        public long NbVu { get; set; }

        public long NbVuesAch { get; set; }
    }
}
