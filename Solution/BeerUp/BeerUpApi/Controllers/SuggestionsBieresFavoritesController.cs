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
    public class SuggestionsBieresFavoritesController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public SuggestionsBieresFavoritesController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/SuggestionsBieresFavorites/
        [HttpGet]
        public async Task<ActionResult<List<BiereDescr>>> GetSuggestionBieresFavorites()
        {
            var userId = AuthGuard.getUserId(HttpContext.User.Claims.ToList());
            var param = new SqlParameter("@UserId", userId);

            List<BiereDescr> bieres = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("GetSuggestionBieresFavoritesUser @UserId", param).ToListAsync();

            if (bieres == null)
            {
                return NotFound();

            }
            else
            {
                return bieres;
            }
        }
    }
}
