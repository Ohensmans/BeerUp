using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
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
    public class BieresEtabController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public BieresEtabController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/BieresEtab/5
        [HttpGet("{id}")]
        public ActionResult<List<Biere>> GetBieresServiesEtablissement(Guid id)
        {
            var param = new SqlParameter("@EtaId", id);
            List<Biere> biere = (List<Biere>)_context.Bieres.FromSqlRaw("GetBieresServiesEtab @EtaId", param).ToList();

            if (biere == null)
            {
                biere = new List<Biere>();
            }
            else
            {
                biere = biere.OrderBy(b => b.BieNom).ToList();
            }

            return biere;
        }
    }
}
