using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BieresController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public BieresController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/Bieres
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Biere>>> GetBieres()
        {
            return await _context.Bieres.ToListAsync();
        }

        // GET: api/Bieres/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Biere>> GetBiere(Guid id)
        {
            var biere = await _context.Bieres.FindAsync(id);

            if (biere == null)
            {
                return NotFound();
            }

            return biere;
        }

        // PUT: api/Bieres/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBiere(Guid id, Biere biere)
        {
            if (id != biere.BieId)
            {
                return BadRequest();
            }

            _context.Entry(biere).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BiereExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Bieres
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Biere>> PostBiere(Biere biere)
        {
            _context.Bieres.Add(biere);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (BiereExists(biere.BieId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetBiere", new { id = biere.BieId }, biere);
        }

        // DELETE: api/Bieres/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBiere(Guid id)
        {
            var biere = await _context.Bieres.FindAsync(id);
            if (biere == null)
            {
                return NotFound();
            }

            _context.Bieres.Remove(biere);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BiereExists(Guid id)
        {
            return _context.Bieres.Any(e => e.BieId == id);
        }
    }
}
