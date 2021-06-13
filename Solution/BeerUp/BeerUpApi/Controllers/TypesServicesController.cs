using Microsoft.AspNetCore.Authorization;
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
    [Authorize(Policy = "isRegistred")]
    public class TypesServicesController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public TypesServicesController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/TypesServices
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypesService>>> GetTypeServices()
        {
            return await _context.TypesServices.OrderBy(t => t.TypSerLibelle).ToListAsync();
        }

        // GET: api/TypesServices/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TypesService>> GetTypeServices(Guid id)
        {
            var tservice = await _context.TypesServices.FindAsync(id);

            if (tservice == null)
            {
                return NotFound();
            }

            return tservice;
        }

        // PUT: api/TypesServices/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Policy = "isAdmin")]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTypeServices(Guid id, TypesService tservice)
        {
            if (id != tservice.TypServId)
            {
                return BadRequest();
            }

            _context.Entry(tservice).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypeServiceExists(id))
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

        // POST: api/TypesServices
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Policy = "isAdmin")]
        [HttpPost]
        public async Task<ActionResult<TypesService>> PostTypeServices(TypesService tservice)
        {
            _context.TypesServices.Add(tservice);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TypeServiceExists(tservice.TypServId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTypeService", new { id = tservice.TypServId }, tservice);
        }

        // DELETE: api/TypesServices/5
        [Authorize(Policy = "isAdmin")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTypesServices(Guid id)
        {
            var tservice = await _context.TypesServices.FindAsync(id);
            if (tservice == null)
            {
                return NotFound();
            }

            _context.TypesServices.Remove(tservice);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TypeServiceExists(Guid id)
        {
            return _context.TypesServices.Any(e => e.TypServId == id);
        }
    }
}
