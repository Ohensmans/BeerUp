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
    public class EtabsOrgaController : ControllerBase
    {

        private readonly BeerUpContext _context;

        public EtabsOrgaController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/EtabsOrga/5
        [HttpGet("{id, isAchat}")]
        [HttpGet("{id},{isAchat}")]
        public async Task<ActionResult<List<Etablissement>>> GetEtablissementsOrgaAsync(Guid id, bool isAchat)
        {
            var orgId = AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList());

            if (AuthGuard.isAdminOrGroupAdmin(HttpContext.User.Claims.ToList()) || orgId == id)
            {

                var param = new SqlParameter("@OrgId", id);
                List<Etablissement> etabs = (List<Etablissement>) await _context.Etablissements.FromSqlRaw("GetEtablissementsOrganistion @OrgId", param).ToListAsync();

                if (etabs == null)
                {
                    etabs = new List<Etablissement>();
                }


                return etabs;
            }
            return Forbid();
        }
    }
    
}
