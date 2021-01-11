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
    public class TarifsVueEtabsController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public TarifsVueEtabsController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/TarifsVueEtabs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TarifsVueEtab>>> GetTarifsVueEtabs()
        {
            return await _context.TarifsVueEtabs.ToListAsync();
        }

        // GET: api/TarifsVueEtabs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TarifsVueEtab>> GetTarifsVueEtab(Guid id)
        {
            var tarifsVueEtab = await _context.TarifsVueEtabs.FindAsync(id);

            if (tarifsVueEtab == null)
            {
                return NotFound();
            }

            return tarifsVueEtab;
        }

        // PUT: api/TarifsVueEtabs/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTarifsVueEtab(Guid id, TarifsVueEtab tarifsVueEtab)
        {
            if (id != tarifsVueEtab.Id)
            {
                return BadRequest();
            }

            _context.Entry(tarifsVueEtab).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TarifsVueEtabExists(id))
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

        // POST: api/TarifsVueEtabs
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TarifsVueEtab>> PostTarifsVueEtab(TarifsVueEtab tarifsVueEtab)
        {
            _context.TarifsVueEtabs.Add(tarifsVueEtab);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTarifsVueEtab", new { id = tarifsVueEtab.Id }, tarifsVueEtab);
        }

        // DELETE: api/TarifsVueEtabs/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTarifsVueEtab(Guid id)
        {
            var tarifsVueEtab = await _context.TarifsVueEtabs.FindAsync(id);
            if (tarifsVueEtab == null)
            {
                return NotFound();
            }

            _context.TarifsVueEtabs.Remove(tarifsVueEtab);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TarifsVueEtabExists(Guid id)
        {
            return _context.TarifsVueEtabs.Any(e => e.Id == id);
        }
    }
}
