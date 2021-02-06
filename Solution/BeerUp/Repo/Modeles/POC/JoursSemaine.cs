using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.POC
{
    public class JoursSemaine
    {
        public JoursSemaine()
        {
            List<string> _jours = new List<string>();
            _jours.Add("Lundi");
            _jours.Add("Mardi");
            _jours.Add("Mercredi");
            _jours.Add("Jeudi");
            _jours.Add("Vendredi");
            _jours.Add("Samedi");
            _jours.Add("Dimanche");
            lJours = _jours;
        }
        public List<string> lJours { get; set; }
    }
}

