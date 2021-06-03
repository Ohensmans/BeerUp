using BeerUpApi.Services;
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
    [Authorize(Policy = "hasAchatAccess")]
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
        public async Task<ActionResult<List<Facture>>> GetFacturesOrgaAsync(Guid id)
        {

            var param = new SqlParameter("@OrgId", id);
            List<Facture> fact = (List<Facture>) await _context.Factures.FromSqlRaw("GetFacturesOrga @OrgId", param).ToListAsync();
            fact = fact.OrderByDescending(f => f.FacDate).ToList();

            if (!AuthGuard.isAdmin(HttpContext.User.Claims.ToList()))
            {
                foreach (Facture fac in fact)
                {
                    var trans = await _context.Transactions.FindAsync(fac.TransId);
                    var orgId = AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList());
                    if (trans == null || orgId != trans.OrgId)
                    {
                        return Forbid();
                    }
                }
            }

            if (fact == null)
            {
                fact = new List<Facture>();
            }

            return fact;
        }
    }
}
