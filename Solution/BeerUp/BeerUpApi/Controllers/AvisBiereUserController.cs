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
    [Authorize]
    [ApiController]
    public class AvisBiereUserController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AvisBiereUserController(BeerUpContext context)
        {
           
            _context = context;
        }

        // GET api/<AvisBiereUserController>/5
        //return the last avis from the user for a beer
        [HttpGet("{Userid, BieId}")]
        public ActionResult<AvisBiereUser> GetAvis(Guid userId, Guid biereId)
        {
            var paramOne = new SqlParameter("@UserId", userId);
            var paramTwo = new SqlParameter("@BieId", biereId);
            List<AvisBiereUser> avis = (List<AvisBiereUser>)_context.AvisBiereUsers.FromSqlRaw("GetDernierAvisBiereUser @UserId, @BieId", paramOne, paramTwo).ToList();

            if (avis == null || avis.Count==0)
            {
               return new AvisBiereUser();
            }

            return avis.First() ;
        }


        // POST: api/AvisBiereUserController
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AvisBiereUser>> PostBiere(AvisBiereUser avis)
        {
            _context.AvisBiereUsers.Add(avis);
            try
            {
                await _context.SaveChangesAsync();
                await DesactivateOlderAvisAsync(avis.AviBieUserId, avis.BieId);
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

            return CreatedAtAction("GetAvis", new { userId = avis.UserId, biereId = avis.BieId }, avis);
        }

        private async Task DesactivateOlderAvisAsync (Guid userId, Guid biereId)
        {
            var paramOne = new SqlParameter("@UserId", userId);
            var paramTwo = new SqlParameter("@BieId", biereId);
            List<AvisBiereUser> lAvis = (List<AvisBiereUser>)_context.AvisBiereUsers.FromSqlRaw("GetAvisBiereUserToDesactivate @UserId @BieId", parameters: new[] { paramOne, paramTwo }).ToList();

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
            return _context.AvisBiereUsers.Any(e => e.AviBieUserId == id);
        }

    }
}
