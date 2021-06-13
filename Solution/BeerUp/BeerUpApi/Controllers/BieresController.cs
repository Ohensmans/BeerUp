using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BeerUpApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
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
            List<Biere> lBiere = await _context.Bieres.ToListAsync();
            lBiere = lBiere.OrderBy(b => b.BieNom).ToList();
            return lBiere;

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
        [Authorize(Policy = "hasBiereAccess")]
        public async Task<IActionResult> PutBiere(Guid id, Biere biere)
        {
            if (id != biere.BieId)
            {
                return BadRequest();
            }

            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || await AuthGuard.biereIsInUserOrgAsync(id, _context, HttpContext.User.Claims.ToList()))
            {

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
            return Forbid();
        }

        // POST: api/Bieres
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Biere>> PostBiere(Biere biere)
        {
            biere.UserId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());

            if (AuthGuard.isMobileUser(HttpContext.User.Claims.ToList())|| !AuthGuard.hasBiereAccess(HttpContext.User.Claims.ToList()))
            {
                DateTime today = DateTime.Today;
                List<Biere> lbieres = await _context.Bieres.Where(b => b.BieDateCre.HasValue && b.BieDateCre.Value.Date == today.Date&& b.UserId == biere.UserId).ToListAsync();
                if (lbieres.Count > 4)
                {
                    return StatusCode(429);
                }
            }

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
        [Authorize(Policy = "hasBiereAccess")]
        public async Task<IActionResult> DeleteBiere(Guid id)
        {
            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || await AuthGuard.biereIsInUserOrgAsync(id, _context, HttpContext.User.Claims.ToList()))
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
            return Forbid();
        }

        private bool BiereExists(Guid id)
        {
            return _context.Bieres.Any(e => e.BieId == id);
        }
    }
}
