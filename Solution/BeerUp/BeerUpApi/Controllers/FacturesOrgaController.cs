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
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class FacturesOrgaController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public FacturesOrgaController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/FacturesOrga/5
        [HttpGet("{id}")]
        public ActionResult<List<Facture>> GetFacturesOrga(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<Facture> fact = (List<Facture>)_context.Factures.FromSqlRaw("GetFacturesOrga @OrgId", param).ToList();
            fact = fact.OrderByDescending(f => f.FacDate).ToList();

            if (fact == null)
            {
                fact = new List<Facture>();
            }

            return fact;
        }
    }
}
