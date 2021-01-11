using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class TarifsVueBiesController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public TarifsVueBiesController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/TarifsVueBies
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TarifsVueBie>>> GetTarifsVueBies()
        {
            return await _context.TarifsVueBies.ToListAsync();
        }

        // GET: api/TarifsVueBies/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TarifsVueBie>> GetTarifsVueBie(Guid id)
        {
            var tarifsVueBie = await _context.TarifsVueBies.FindAsync(id);

            if (tarifsVueBie == null)
            {
                return NotFound();
            }

            return tarifsVueBie;
        }

        // PUT: api/TarifsVueBies/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTarifsVueBie(Guid id, TarifsVueBie tarifsVueBie)
        {
            if (id != tarifsVueBie.Id)
            {
                return BadRequest();
            }

            _context.Entry(tarifsVueBie).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TarifsVueBieExists(id))
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

        // POST: api/TarifsVueBies
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TarifsVueBie>> PostTarifsVueBie(TarifsVueBie tarifsVueBie)
        {
            tarifsVueBie.Id = Guid.NewGuid();
            _context.TarifsVueBies.Add(tarifsVueBie);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTarifsVueBie", new { id = tarifsVueBie.Id }, tarifsVueBie);
        }

        // DELETE: api/TarifsVueBies/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTarifsVueBie(Guid id)
        {
            var tarifsVueBie = await _context.TarifsVueBies.FindAsync(id);
            if (tarifsVueBie == null)
            {
                return NotFound();
            }

            _context.TarifsVueBies.Remove(tarifsVueBie);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TarifsVueBieExists(Guid id)
        {
            return _context.TarifsVueBies.Any(e => e.Id == id);
        }
    }
}
