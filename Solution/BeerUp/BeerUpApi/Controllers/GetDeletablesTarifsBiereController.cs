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
    public class GetDeletablesTarifsBiereController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public GetDeletablesTarifsBiereController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/<GetDeletablestarifsBiereController>
        [HttpGet]
        public ActionResult<List<TarifsVueBie>> Get()
        {
            List<TarifsVueBie> lTarifs = (List<TarifsVueBie>)_context.TarifsVueBies.FromSqlRaw("GetDeletablesTarifsBiere").ToList();

            if (lTarifs == null)
            {
                lTarifs = new List<TarifsVueBie>();
            }

            return lTarifs;
        }
    }
}
