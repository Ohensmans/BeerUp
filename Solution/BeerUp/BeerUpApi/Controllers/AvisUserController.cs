using BeerUpApi.Services;
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
    [Authorize]
    public class AvisUserController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AvisUserController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/AvisUser/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AvisMoyen>> GetAvisUserAsync(Guid id)
        {

            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());

            if (userId != Guid.Empty)
            {

                var paramOne = new SqlParameter("@BieId", id);
                var paramTwo = new SqlParameter("@UserId", userId);

                List<AvisMoyen> lAvis = (List<AvisMoyen>) await _context.AvisMoyens.FromSqlRaw("GetAvisUser @BieId, @UserId", paramOne, paramTwo).ToListAsync();

                AvisMoyen avis;

                if (lAvis == null || lAvis.Count == 0)
                {
                    avis = new AvisMoyen(id);
                }
                else
                {
                    avis = lAvis[0];
                }

                return avis;
            }
            else
            {
                return NotFound();
            }
        }

        // POST: api/AvisUserController
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AvisMoyen>> PostAvisUser(AvisMoyen avis)
        {
            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());

            AvisBiereUser newAvis = new AvisBiereUser();
            newAvis.Convert(avis, userId);
            _context.AvisBiereUser.Add(newAvis);
            try
            {
                await _context.SaveChangesAsync();
                await DesactivateOlderAvisAsync(userId, avis.BieId);
            }
            catch (DbUpdateException)
            {
                if (AvisExists(newAvis.AviBieUserId))
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

            return NoContent();
        }

        private async Task DesactivateOlderAvisAsync(Guid userId, Guid biereId)
        {
            var paramOne = new SqlParameter("@UserId", userId);
            var paramTwo = new SqlParameter("@BieId", biereId);
            List<AvisBiereUser> lAvis = (List<AvisBiereUser>)_context.AvisBiereUser.FromSqlRaw("GetAvisBiereUserToDesactivate @UserId, @BieId", parameters: new[] { paramOne, paramTwo }).ToList();

            if (lAvis!=null && lAvis.Any())
            {
                foreach (AvisBiereUser avis in lAvis)
                {
                    avis.AviBieUserActif = false;
                    if (!await PutAvisUserAsync(avis.AviBieUserId, avis))
                    {
                        throw new Exception();
                    }
                }
            }
        }

        private async Task<bool> PutAvisUserAsync(Guid id, AvisBiereUser avis)
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
