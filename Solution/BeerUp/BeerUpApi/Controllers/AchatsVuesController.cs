using BeerUpApi.Services;
using Microsoft.AspNetCore.Authentication;
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
    [Authorize]
    [ApiController]
    public class AchatsVuesController : ControllerBase
    {
        private readonly BeerUpContext _context;


        public AchatsVuesController(BeerUpContext context)
        {
            _context = context;
        }

        //// GET: api/AchatsVues
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<AchatsVue>>> GetAchatsVue()
        //{
        //    List<AchatsVue> lAchat = await _context.AchatsVues.ToListAsync();

        //    return lAchat;

        //}

        //// GET: api/AchatsVues/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<AchatsVue>> GetAchatsVues(Guid id)
        //{
        //    var achat = await _context.AchatsVues.FindAsync(id);

        //    if (achat == null)
        //    {
        //        return NotFound();
        //    }

        //    return achat;
        //}


        // POST: api/AchatsVues
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [Authorize(Policy = "hasAchatAccess")]
        public async Task<ActionResult<Biere>> PostAchatsVue(AchatsVue achat)
        {           

            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) 
                || (achat.EtaId!=null && await AuthGuard.etabIsInUserOrgAsync(achat.EtaId, _context, HttpContext.User.Claims.ToList())) 
               || (achat.BieId!=null && await AuthGuard.biereIsInUserOrgAsync(achat.BieId,_context, HttpContext.User.Claims.ToList())))
            {


                _context.AchatsVues.Add(achat);
                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateException)
                {
                    if (AchatExists(achat.AchId))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }

                return CreatedAtAction("GetAchatsVue", new { id = achat.AchId }, achat);
            }
            return Forbid();

        }


        private bool AchatExists(Guid id)
        {
            return _context.AchatsVues.Any(a => a.AchId == id);
        }
    }
}
