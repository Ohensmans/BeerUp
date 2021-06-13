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
    public class BiereMobileVenduesEtabController : ControllerBase
    {
        private readonly BeerUpContext _context;


        public BiereMobileVenduesEtabController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/BiereMobileVenduesEtab/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<BiereDescr>>> GetBieresVenduesEtab(Guid id)
        {
            var param = new SqlParameter("@EtaId", id);
            List<BiereDescr> bieres = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("GetBiereMobileParEtab @EtaId", param ).ToListAsync();

            if (bieres == null)
            {
                return NotFound();
            }

            return bieres;
        }
    }
}
