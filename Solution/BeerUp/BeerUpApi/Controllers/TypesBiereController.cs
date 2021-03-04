using Microsoft.AspNetCore.Mvc;
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
    [ApiController]
    public class TypesBiereController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public TypesBiereController(BeerUpContext context)
        {
            _context = context;
        }

        // GET: api/TypesBieres
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypesBiere>>> GetTypeServices()
        {
            return await _context.TypesBieres.ToListAsync();
        }
    }
}
