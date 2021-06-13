using BeerUpApi.Services;
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
    [Authorize(Policy = "isRegistred")]
    [ApiController]
    public class VentesBieresEtaController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public VentesBieresEtaController(BeerUpContext context)
        {
            _context = context;
        }

        //// GET: api/VentesBieresEta
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<VenteBiereEtum>>> GetVentesBieresEta()
        //{
        //    return await _context.VenteBiereEta.ToListAsync();
        //}

        // GET: api/VentesBieresEta/5
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<VenteBiereEtum>> GetVenteBieresEta(Guid id)
        {
            var param = new SqlParameter("@EtaId", id);
            List<VenteBiereEtum> vente = (List<VenteBiereEtum>)_context.VenteBiereEta.FromSqlRaw("GetVenteBieresParEtab @EtaId", param).ToList();

            if (vente == null)
            {
                vente = new List<VenteBiereEtum>();
            }

            return vente;
        }

        // PUT: api/VentesBieresEta/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Policy = "hasEtabAccess")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVenteBieresEta(Guid id, VenteBiereEtum vente)
        {
            if (id != vente.VenteBiereEtaId)
            {
                return BadRequest();
            }

            if (!AuthGuard.isAdmin(HttpContext.User.Claims.ToList())) { 
                if(!await AuthGuard.etabIsInUserOrgAsync(vente.EtaId, _context, HttpContext.User.Claims.ToList()))
                {
                    return Forbid();
                }
            }

            _context.Entry(vente).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VenteBieresEtaeExists(id))
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

        // POST: api/VentesBieresEta
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Policy = "hasEtabAccess")]
        [HttpPost]
        public async Task<ActionResult<VenteBiereEtum>> PostVenteBieresEta(VenteBiereEtum vente)
        {
            if (!AuthGuard.isAdmin(HttpContext.User.Claims.ToList()))
            {
                if (!await AuthGuard.etabIsInUserOrgAsync(vente.EtaId, _context, HttpContext.User.Claims.ToList()))
                {
                    return Forbid();
                }
            }

            _context.VenteBiereEta.Add(vente);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (VenteBieresEtaeExists(vente.VenteBiereEtaId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetVenteBieresEta", new { id = vente.VenteBiereEtaId }, vente);
        }

        // DELETE: api/TypesServices/5
        [Authorize(Policy = "hasEtabAccess")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTypesServices(Guid id)
        {
            var vente = await _context.VenteBiereEta.FindAsync(id);
            if (vente == null)
            {
                return NotFound();
            }

            if (!AuthGuard.isAdmin(HttpContext.User.Claims.ToList()))
            {
                if (!await AuthGuard.etabIsInUserOrgAsync(vente.EtaId, _context, HttpContext.User.Claims.ToList()))
                {
                    return Forbid();
                }
            }

            _context.VenteBiereEta.Remove(vente);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool VenteBieresEtaeExists(Guid id)
        {
            return _context.VenteBiereEta.Any(e => e.VenteBiereEtaId == id);
        }
    }
}

