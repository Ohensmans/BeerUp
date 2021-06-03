using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class BiereSponsoriseeController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public BiereSponsoriseeController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/BiereSponsorisee/true
        [HttpGet("{needOne}")]
        public async Task<ActionResult<BiereDescr>> GetBiereSponsoriseeAsync(string needOne)
        {
            BiereDescr biereDescr;

            List<BiereDescr> bieres = (List<BiereDescr>) await _context.BieresDescr.FromSqlRaw("GetBieresSponsorisees").ToListAsync();

            if (bieres == null)
            {
                bool need;
                bool test = bool.TryParse(needOne, out need);

                //si il faut absolument une bière en sélectionne une random
                //à modifier avec bière du top 10
                if (test && need)
                {
                    biereDescr = (BiereDescr)  _context.Bieres.FromSqlRaw("GetRandomBiere");
                }
                //sinon renvoie un bière vide
                else 
                {
                    biereDescr = new BiereDescr();
                }
                
            }
            else
            {
                Random rnd = new Random();
                biereDescr = bieres[rnd.Next(bieres.Count)];
                bool addView = await AddViewToBeerAsync(biereDescr.BieId);

                if (addView)
                {
                    biereDescr.BieNbVu++;
                }
                

            }

            return biereDescr;
        }

        private async Task<bool> AddViewToBeerAsync(Guid id)
        {
            Biere biere = await _context.Bieres.FindAsync(id);
            if (biere != null)
            {
                biere.BieNbVu++;
                _context.Entry(biere).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                    return true;
                }
                catch (Exception)
                {
                    return false ;
                }
            }
            else
            {
                return false;
            }
        }


    }
}
