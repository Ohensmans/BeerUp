using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
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
    public class HorairesController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public HorairesController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/Horaires
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Horaire>>> GetHoraire()
        {
            return await _context.Horaires.ToListAsync();
        }

        // GET: api/Horaires/5
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<Horaire>> GetHoraire(Guid id)
        {
            var param = new SqlParameter("@EtaId", id);
            List<Horaire> horaires = (List<Horaire>)_context.Horaires.FromSqlRaw("GetHorairesEtab @EtaId", param).ToList();

            if (horaires == null)
            {
                horaires = new List<Horaire>();
            }

            return horaires;
        }

        // PUT: api/Horaires/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHoraire(Guid id, Horaire horaire)
        {
            if (id != horaire.HorId)
            {
                return BadRequest();
            }

            _context.Entry(horaire).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HoraireExists(id))
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

        // POST: api/Horaires
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Horaire>> PostHoraire(Horaire horaire)
        {
            _context.Horaires.Add(horaire);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetHoraire", new { id = horaire.HorId }, horaire);
        }

        // DELETE: api/Horaires/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHoraire(Guid id)
        {
            var horaire = await _context.Horaires.FindAsync(id);
            if (horaire == null)
            {
                return NotFound();
            }

            _context.Horaires.Remove(horaire);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool HoraireExists(Guid id)
        {
            return _context.Horaires.Any(e => e.HorId == id);
        }
    }
}
