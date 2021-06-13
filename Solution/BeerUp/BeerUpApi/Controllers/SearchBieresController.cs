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
    [Authorize]
    [ApiController]
    public class SearchBieresController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public SearchBieresController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/SearchBieres/aaa
        [HttpGet("{text}")]
        public async Task<ActionResult<List<BiereDescr>>> SearchBieresAsync(string text)
        {
            if (text != null && text != "")
            {
                var param = new SqlParameter("@text", text);
                List<BiereDescr> bieres = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("SearchBiere @text", param).ToListAsync();

                if (bieres == null)
                {
                    return NotFound();

                }
                else
                {
                    return bieres;
                }
            }
            else
            {
                return NotFound();
            }
        }
    }
}
