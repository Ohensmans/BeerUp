using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturesController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public FacturesController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/Factures
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Facture>>> GetFacture()
        {
            List<Facture> lFacture = await _context.Factures.ToListAsync();
            lFacture = lFacture.OrderBy(b => b.FacId).ToList();
            return lFacture;

        }

        // GET: api/Factures/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Facture>> GetFacture(int id)
        {
            var fact = await _context.Factures.FindAsync(id);

            if (fact == null)
            {
                return NotFound();
            }

            return fact;
        }

 
        // POST: api/Factures
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Facture>> PostFacture(Facture fact)
        {
            _context.Factures.Add(fact);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (FactureExists(fact.FacId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetFacture", new { id = fact.FacId }, fact);
        }

        private bool FactureExists(int id)
        {
            return _context.Factures.Any(f => f.FacId == id);
        }
    }
}
