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
    public class BieresOrgaController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public BieresOrgaController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/BieresOrga/5
        [HttpGet("{id}")]
        public  ActionResult<List<Biere>> GetBieresOrganisations(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<Biere> biere =(List<Biere>) _context.Bieres.FromSqlRaw("GetBieresOrganistion @OrgId", param).ToList();

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
