using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using Repo.Modeles.POC;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class SearchEtabsController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public SearchEtabsController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/SearchEtabs/aaa
        [HttpGet("{text}")]
        public async Task<ActionResult<List<EtablDescr>>> SearchEtabsAsync(string text)
        {
            if (text != null && text != "")
            {
                var param = new SqlParameter("@text", text);
                List<Etablissement> etabs = (List<Etablissement>)_context.Etablissements.FromSqlRaw("SearchEtab @text", param).ToList();

                if (etabs == null)
                {
                    return NotFound();

                }
                else
                {
                    List<EtablDescr> lEtabDescr = new List<EtablDescr>();

                    foreach(Etablissement etab in etabs)
                    {
                        EtablDescr eta = new EtablDescr();
                        eta.Convert(etab);
                        eta.estOuvert = await estOuvertAsync(etab);

                        TypesEtablissement type = await _context.TypesEtablissements.FirstOrDefaultAsync(t => t.TypEtaId == eta.TypEtaId);
                        if (type != null)
                        {
                            eta.nomTypeEta = type.TypEtaNom;
                        }

                        lEtabDescr.Add(eta);
                    }

                    return lEtabDescr;
                }
            }
            else
            {
                return NotFound();
            }
        }

        private async Task<bool> estOuvertAsync (Etablissement etab)
        {
            DateTime today = DateTime.Today;
            List<JourFermeture> lJours = await _context.JoursFermeture.Where(j => j.EtaId == etab.EtaId && j.JouDate == today).ToListAsync();

            if(lJours.Count == 0)
            {
                TimeSpan now = new TimeSpan(DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);

                DateTimeFormatInfo dateTimeFormats = new CultureInfo("fr-FR").DateTimeFormat;
                String jour = DateTime.Now.ToString("dddd", dateTimeFormats);

                List<Horaire> horaires = await _context.Horaires.Where(h => h.EtaId == etab.EtaId && h.HorJour.ToUpper() == jour.ToUpper() && h.HorDebut<=now && h.HorFin>now).ToListAsync();

                if (horaires.Any())
                {
                    return true;
                }
            }
            return false;
        }
    }
}
