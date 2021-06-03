using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class TypesEtabController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public TypesEtabController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/<TypesEtabController>
        [HttpGet]
        public async Task<IEnumerable<TypesEtablissement>> GetTypeEtabAsync()
        {
            return await _context.TypesEtablissements.OrderBy(t => t.TypEtaNom).ToListAsync();
        }

        
    }
}
