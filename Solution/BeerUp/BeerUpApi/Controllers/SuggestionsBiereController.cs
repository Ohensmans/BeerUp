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
    public class SuggestionsBiereController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public SuggestionsBiereController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/SuggestionsBiere/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<BiereDescr>>> GetSuggestionBieresFavorites(Guid id)
        {
            var param = new SqlParameter("@BieId", id);

            List<BiereDescr> bieres = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("GetSuggestionBiere @BieId", param).ToListAsync();

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
