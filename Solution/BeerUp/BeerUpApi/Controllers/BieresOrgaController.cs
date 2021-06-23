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
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class BieresOrgaController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public BieresOrgaController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/BieresOrga/5
        [HttpGet("{id, isAchat}")]
        [HttpGet("{id},{isAchat}")]
        public async Task<ActionResult<List<Biere>>> GetBieresOrganisationsAsync(Guid id, bool isAchat)
        {
            if (AuthGuard.isAdminOrGroupAdmin(HttpContext.User.Claims.ToList()) || AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList()) == id)
            {

                var param = new SqlParameter("@OrgId", id);
                List<Biere> bieres = (List<Biere>) await _context.Bieres.FromSqlRaw("GetBieresOrganistion @OrgId", param).ToListAsync();

                if (bieres == null)
                {
                    return new List<Biere>();
                }

                if (!AuthGuard.isAdminOrGroupAdmin(HttpContext.User.Claims.ToList()) && !AuthGuard.hasFullAccess(true, isAchat, HttpContext.User.Claims.ToList()))
                {
                    List<Guid> lAccess = AuthGuard.getListAccess(true, isAchat, HttpContext.User.Claims.ToList());

                    List<Biere> lBieres = new List<Biere>();
                    foreach (Biere bie in bieres)
                    {
                        if (lAccess.Any(b => b == bie.BieId))
                        {
                            lBieres.Add(bie);
                        }
                    }
                    bieres = lBieres;
                }

                bieres = bieres.OrderBy(b => b.BieNom).ToList();
                return bieres;
            }
            return Forbid();
        }
    }
}
