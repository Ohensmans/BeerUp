using Microsoft.AspNetCore.Authorization;
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
    [Authorize(Policy = "isAdmin")]
    [Route("api/[controller]")]
    [ApiController]
    public class GetDeletablesTarifsEtabController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public GetDeletablesTarifsEtabController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/<GetDeletablestarifsEtabController>
        [HttpGet]
        public ActionResult<List<TarifsVueEtab>> Get()
        {
            List<TarifsVueEtab> lTarifs = (List<TarifsVueEtab>)_context.TarifsVueEtabs.FromSqlRaw("GetDeletablesTarifsEtab").ToList();

            if (lTarifs == null)
            {
                lTarifs = new List<TarifsVueEtab>();
            }

            return lTarifs;
        }
    }
}
