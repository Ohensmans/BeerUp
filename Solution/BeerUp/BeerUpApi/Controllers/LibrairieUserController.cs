using BeerUpApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class LibrairieUserController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public LibrairieUserController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/LibrairieUserController/
        // renvoie toutes les bières de la librairie de l'user
        [HttpGet]
        public async Task<ActionResult<List<BiereDescr>>> GetBieresLibrairieUser()
        {
            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());

            List<LibrairieUserBiere> lFavoris = (List<LibrairieUserBiere>) await _context.LibrairieUserBieres.Where(l => l.UserId == userId).ToListAsync();

            List<BiereDescr> LBieresAll = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("GetAllBieresMobile").ToListAsync();

            List<BiereDescr> lBieresFavorites = new List<BiereDescr>();

            foreach(LibrairieUserBiere favoris in lFavoris)
            {
                BiereDescr bie = LBieresAll.FirstOrDefault(b => b.BieId == favoris.BieId);
                if (bie != null)
                {
                    lBieresFavorites.Add(bie);
                }
            }

            return lBieresFavorites.OrderBy(b => b.BieNom).ToList();

        }

        // GET: api/LibrairieUserController/5
        [HttpGet("{id}")]
        public async Task<ActionResult<bool>> biereIsFavorite(Guid id)
        {
            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());

            List<LibrairieUserBiere> lFavoris = (List<LibrairieUserBiere>)await _context.LibrairieUserBieres.Where(l => l.UserId == userId).ToListAsync();

            return lFavoris.Any(f => f.BieId == id);

        }

        // POST: api/LibrairieUserController/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<LibrairieUserBiere>> PostFavoris(LibrairieUserBiere favoris)
        {
            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());
            if (favoris.UserId == userId)
            {
                _context.LibrairieUserBieres.Add(favoris);
                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateException)
                {
                    throw;
                }

                return NoContent();
            }
            return Forbid();
        }

        // DELETE: api/LibrairieUserController/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFavoris(Guid id)
        {
            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());
            var favoris = await _context.LibrairieUserBieres.FirstOrDefaultAsync(l => l.BieId == id && l.UserId == userId);
            if (favoris == null)
            {
                return NotFound();
            }

            _context.LibrairieUserBieres.Remove(favoris);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private async Task<LibrairieUserBiere> GetFavoris(Guid id)
        {
            Guid userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());

            return await _context.LibrairieUserBieres.FirstOrDefaultAsync(l => l.UserId == userId && l.BieId == id);
        }

    }
}
