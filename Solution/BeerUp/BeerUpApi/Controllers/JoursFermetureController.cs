using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
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
    public class JoursFermetureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public JoursFermetureController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/JoursFermeture
        [HttpGet]
        public async Task<ActionResult<IEnumerable<JourFermeture>>> GetJourFermeture()
        {
            return await _context.JoursFermeture.ToListAsync();
        }

        // GET: api/JoursFermeture/5
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<JourFermeture>> GetJourFermeture(Guid id)
        {
            var param = new SqlParameter("@EtaId", id);
            List<JourFermeture> jours = (List<JourFermeture>)_context.JoursFermeture.FromSqlRaw("GetJoursFermetureEtab @EtaId", param).ToList();

            if (jours == null)
            {
                jours = new List<JourFermeture>();
            }

            return jours;
        }

        // PUT: api/JoursFermeture/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutJourFermeture(Guid id, JourFermeture jour)
        {
            if (id != jour.JouId)
            {
                return BadRequest();
            }

            _context.Entry(jour).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!JourFermetureExists(id))
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

        // POST: api/JoursFermeture
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<JourFermeture>> PostJourFermeture(JourFermeture jour)
        {
            _context.JoursFermeture.Add(jour);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetJourFermeture", new { id = jour.JouId }, jour);
        }

        // DELETE: api/JoursFermeture/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteJourFermeture(Guid id)
        {
            var jour = await _context.JoursFermeture.FindAsync(id);
            if (jour == null)
            {
                return NotFound();
            }

            _context.JoursFermeture.Remove(jour);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool JourFermetureExists(Guid id)
        {
            return _context.JoursFermeture.Any(e => e.JouId == id);
        }
    }
}
