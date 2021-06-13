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
    public class SuggestionsMoisController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public SuggestionsMoisController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/SuggestionsMois/
        [HttpGet]
        public async Task<ActionResult<List<BiereDescr>>> GetSuggestionTopMois()
        {           
            List<BiereDescr> bieres = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("GetSuggestionTop10Mois").ToListAsync();

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
