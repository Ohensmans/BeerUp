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
    public class AchatsBieresFactureParFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsBieresFactureParFactureController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/AchatsBieresFactureParFacture/5
        //renvoie une facture spécifique
        [HttpGet("{id}")]
        [Authorize(Policy = "hasAchatAccess")]
        public async Task<ActionResult<List<AchatBieresFacture>>> GetAchatsBieresFactureParFactureAsync(int id)
        {            
            var param = new SqlParameter("@FacId", id);
            List<AchatBieresFacture> achats = (List<AchatBieresFacture>) await _context.AchatsBieresFacture.FromSqlRaw("GetAchatBieresFacture @FacId", param).ToListAsync();

            if (achats == null || achats.Count == 0)
            {
                achats = new List<AchatBieresFacture>();
            }

            if(AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || 
               achats[0].OrgId == AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList()))
            {
                return achats;
            }

            return Forbid();            
        }
    }
}
