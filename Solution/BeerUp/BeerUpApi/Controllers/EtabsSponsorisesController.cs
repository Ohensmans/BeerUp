using BeerUpApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class EtabsSponsorisesController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public EtabsSponsorisesController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/EtabsSponsorises/
        [HttpGet]
        public async Task<ActionResult<EtablDescr>> GetEtabsSponsorisesAsync()
        {
            List<Etablissement> etabs = (List<Etablissement>)await _context.Etablissements.FromSqlRaw("GetEtabsSponsorises").ToListAsync();
            EtablDescr EtabSponso = new EtablDescr();

            if (etabs == null)
            {
                return EtabSponso;
            }
            else
            {
                List<EtablDescr> lEtabsDes = new List<EtablDescr>();
                foreach(Etablissement etab in etabs)
                {
                    EtablDescr etabDe = new EtablDescr();
                    etabDe.Convert(etab);
                    etabDe.estOuvert = await EtabEstOuvert.estOuvertAsync(etab, _context);
                    

                    TypesEtablissement type = await _context.TypesEtablissements.FirstOrDefaultAsync(t => t.TypEtaId == etabDe.TypEtaId);
                    if (type != null)
                    {
                        etabDe.nomTypeEta = type.TypEtaNom;
                    }

                    lEtabsDes.Add(etabDe);
                }

                Random rnd = new Random();
                EtabSponso = lEtabsDes[rnd.Next(lEtabsDes.Count)];


                bool addView = await AddViewToEtabAsync(EtabSponso.EtaId);

                if (addView)
                {
                    EtabSponso.EtaNbVu++;
                }

            }

            return EtabSponso;
        }

        private async Task<bool> AddViewToEtabAsync(Guid id)
        {
            Etablissement etab = await _context.Etablissements.FindAsync(id);
            if (etab != null)
            {
                etab.EtaNbVu++;
                _context.Entry(etab).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

       


    }
}

