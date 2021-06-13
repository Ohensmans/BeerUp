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
    [ApiController]
    [Authorize]
    public class SuggestionsSurpriseController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public SuggestionsSurpriseController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/SuggestionsSurprise/
        [HttpGet]
        public async Task<ActionResult<List<BiereDescr>>> GetSuggestionSurprise()
        {
            List<BiereDescr> bieres = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("GetSuggestionSurprise").ToListAsync();

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
