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
    public class AchatsEtabFactureParFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsEtabFactureParFactureController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/AchatsEtabFactureParFacture/5
        //renvoie une facture spécifique
        [HttpGet("{id}")]
        [Authorize(Policy = "hasAchatAccess")]
        public async Task<ActionResult<List<AchatEtabFacture>>> GetAchatsEtabFactureParFactureAsync(int id)
        {
            var param = new SqlParameter("@FacId", id);
            List<AchatEtabFacture> achats = (List<AchatEtabFacture>) await _context.AchatsEtabFacture.FromSqlRaw("GetAchatEtabFacture @FacId", param).ToListAsync();

            if (achats == null)
            {
                achats = new List<AchatEtabFacture>();
            }

            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) ||
               achats[0].OrgId == AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList()))
            {
                return achats;
            }

            return Forbid();
        }
    }
}
