using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Services
{
    public static class EtabEstOuvert
    {
        public static async Task<bool> estOuvertAsync(Etablissement etab, BeerUpContext _context)
        {
            DateTime today = DateTime.Today;
            List<JourFermeture> lJours = await _context.JoursFermeture.Where(j => j.EtaId == etab.EtaId && j.JouDate == today).ToListAsync();
            List<Horaire> horaires = await _context.Horaires.Where(h => h.EtaId == etab.EtaId).ToListAsync();

            if (lJours.Count == 0 && horaires.Count>0)
            {
                TimeSpan now = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);

                DateTimeFormatInfo dateTimeFormats = new CultureInfo("fr-FR").DateTimeFormat;
                String jour = DateTime.Now.ToString("dddd", dateTimeFormats);
                
                horaires = horaires.Where(h=> h.HorJour.ToUpper() == jour.ToUpper() && h.HorDebut <= now && h.HorFin > now).ToList();

                if (horaires.Any())
                {
                    return true;
                }
            }
            return false;
        }
    }
}
