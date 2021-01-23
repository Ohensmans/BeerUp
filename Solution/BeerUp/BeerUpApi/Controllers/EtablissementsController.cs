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
    public class EtablissementsController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public EtablissementsController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/Etablissements
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Etablissement>>> GetEtablissements(string? orgId)
        {
            if (orgId != null)
            {
                var param = new SqlParameter("@OrgId", orgId);
                return _context.Etablissements.FromSqlRaw("GetEtablissementsOrganistion @OrgId", param).ToList();
            }
            else
            return await _context.Etablissements.ToListAsync();
        }

        // GET: api/Etablissements/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Etablissement>> GetEtablissement(Guid id)
        {
            var etablissement = await _context.Etablissements.FindAsync(id);

            if (etablissement == null)
            {
                return NotFound();
            }
            return etablissement;
        }

        // PUT: api/Etablissements/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEtablissement(Guid id, Etablissement etablissement)
        {
            if (id != etablissement.EtaId)
            {
                return BadRequest();
            }

            _context.Entry(etablissement).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EtablissementExists(id))
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

        // POST: api/Etablissements
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Etablissement>> PostEtablissement(Etablissement etablissement)
        {
            _context.Etablissements.Add(etablissement);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEtablissement", new { id = etablissement.EtaId }, etablissement);
        }

        // DELETE: api/Etablissements/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEtablissement(Guid id)
        {
            var etablissement = await _context.Etablissements.FindAsync(id);
            if (etablissement == null)
            {
                return NotFound();
            }

            _context.Etablissements.Remove(etablissement);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EtablissementExists(Guid id)
        {
            return _context.Etablissements.Any(e => e.EtaId == id);
        }
    }
}
