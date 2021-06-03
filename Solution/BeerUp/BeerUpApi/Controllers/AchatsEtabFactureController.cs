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
    public class AchatsEtabFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsEtabFactureController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/AchatsEtabFacture/
        // renvoie toutes les factures d'étab => accès uniquement pour admin
        [HttpGet]
        [Authorize(Policy = "isAdmin")]
        public async Task<ActionResult<List<AchatEtabFacture>>> GetAchatsEtabFactureOrgaAsync()
        {
            List<AchatEtabFacture> achats = (List<AchatEtabFacture>)await _context.AchatsEtabFacture.FromSqlRaw("GetAchatEtabFactureAll").ToListAsync();

            if (achats == null)
            {
                achats = new List<AchatEtabFacture>();
            }

            return achats;

        }


        // GET: api/AchatsEtabFacture/5
        // renvoie les factures d'étab d'une organisation => accès pour admin, groupAdmin et GroupAchat
        [HttpGet("{id}")]
        [Authorize(Policy = "hasAchatAccess")]
        public async Task<ActionResult<List<AchatEtabFacture>>> GetAchatsEtabFactureOrgaAsync(Guid id)
        {
            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList()) == id)
            {
                var param = new SqlParameter("@OrgId", id);
                List<AchatEtabFacture> achats = (List<AchatEtabFacture>)await _context.AchatsEtabFacture.FromSqlRaw("GetAchatEtabFactureOrga @OrgId", param).ToListAsync();

                if (achats == null)
                {
                    achats = new List<AchatEtabFacture>();
                }

                return achats;
            }
            return Forbid();
        }

    }
}
