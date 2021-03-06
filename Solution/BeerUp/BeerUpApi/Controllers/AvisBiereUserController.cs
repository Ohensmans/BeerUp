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
    public class AvisBiereUserController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AvisBiereUserController(BeerUpContext context)
        {
           
            _context = context;
        }

        // GET api/<AvisBiereUserController>/5,5
        //return the last avis from the user for a beer
        [HttpGet("{orgId},{bieId}")]
        [HttpGet("{orgId, bieId}")]
        public ActionResult<AvisBiereUser> GetAvis(Guid orgId, Guid bieId)
        {
            var paramOne = new SqlParameter("@OrgaId", orgId);
            var paramTwo = new SqlParameter("@BieId", bieId);
            List<AvisBiereUser> avis = (List<AvisBiereUser>)_context.AvisBiereUser.FromSqlRaw("GetDernierAvisBiereOrga @OrgaId, @BieId", paramOne, paramTwo).ToList();

            if (avis == null || avis.Count==0)
            {
               return new AvisBiereUser();
            }

            return avis.First() ;
        }


        // POST: api/AvisBiereUserController
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AvisBiereUser>> PostAvis(AvisBiereUser avis)
        {
            _context.AvisBiereUser.Add(avis);
            try
            {
                await _context.SaveChangesAsync();
                await DesactivateOlderAvisAsync(avis.OrgId, avis.BieId);
            }
            catch (DbUpdateException)
            {
                if (AvisExists(avis.AviBieUserId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }
            catch (Exception)
            {
                throw;
            }

            return CreatedAtAction("GetAvis", new { orgId = avis.OrgId, bieId = avis.BieId }, avis);
        }

        private async Task DesactivateOlderAvisAsync (Guid orgaId, Guid biereId)
        {
            var paramOne = new SqlParameter("@OrgaId", orgaId);
            var paramTwo = new SqlParameter("@BieId", biereId);
            List<AvisBiereUser> lAvis = (List<AvisBiereUser>)_context.AvisBiereUser.FromSqlRaw("GetAvisBiereOrgaToDesactivate @OrgaId, @BieId", parameters: new[] { paramOne, paramTwo }).ToList();

            if (lAvis.Any())
            {
                foreach (AvisBiereUser avis in lAvis)
                {
                    avis.AviBieUserActif = false;
                    if (!await PutAvisAsync(avis.AviBieUserId, avis))
                    {
                        throw new Exception();
                    }
                }
            }
        }



        private async Task<bool> PutAvisAsync(Guid id, AvisBiereUser avis)
        {
            if (id != avis.AviBieUserId)
            {
                return false;
            }

            _context.Entry(avis).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AvisExists(id))
                {
                    return false;
                }
                else
                {
                    throw;
                }
            }

            return true;
        }

        private bool AvisExists(Guid id)
        {
            return _context.AvisBiereUser.Any(e => e.AviBieUserId == id);
        }

    }
}
