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
    public class AdressesFacturationController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AdressesFacturationController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/AdressesFacturation/5
        [HttpGet("{id}")]
        public ActionResult<AdressesFacturation> GetAdresse(int id)
        {

            var param = new SqlParameter("@FacId", id);
            AdressesFacturation adresse = (AdressesFacturation)_context.AdressesFacturations.FromSqlRaw("GetAdresseFact @FacId", param);

            if (adresse == null)
            {
                return NotFound();
            }

            return adresse;
        }

        // POST: api/AdresseFacturation
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Biere>> PostAdresse(AdressesFacturation adresse)
        {
            _context.AdressesFacturations.Add(adresse);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (AdresseExists(adresse.AdrFacId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetAdresse", new { id = adresse.AdrFacId }, adresse);
        }

        private bool AdresseExists(Guid id)
        {
            return _context.AdressesFacturations.Any(a => a.AdrFacId == id);
        }
    }
}

