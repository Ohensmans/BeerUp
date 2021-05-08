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
        public async Task<ActionResult<Biere>> GetBiereSponsoriseeAsync(string needOne)
        {
            Biere biere;

            List<Biere> bieres = (List<Biere>)_context.Bieres.FromSqlRaw("GetBieresSponsorisees").ToList();

            if (bieres == null)
            {
                bool need;
                bool test = bool.TryParse(needOne, out need);

                //si il faut absolument une bière en sélectionne une random
                if(test && need)
                {
                    biere = (Biere) _context.Bieres.FromSqlRaw("GetRandomBiere");
                }
                //sinon renvoie un bière vide
                else 
                {
                    biere = new Biere();
                }
                
            }
            else
            {
                Random rnd = new Random();
                biere = bieres[rnd.Next(bieres.Count)];

                biere.BieNbVu++;
                _context.Entry(biere).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (Exception)
                {
                    return NotFound();
                }

            }

            return biere;
        }


    }
}
