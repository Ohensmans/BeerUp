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
    public class AchatsBieresFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsBieresFactureController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/AchatsBieresFacture/
        // renvoie toutes les factures de bières => accès uniquement pour admin
        [HttpGet]
        [Authorize(Policy = "isAdmin")]
        public async Task<ActionResult<List<AchatBieresFacture>>> GetAchatsBieresFactureOrgaAsync()
        {

            List<AchatBieresFacture> achats = (List<AchatBieresFacture>)await _context.AchatsBieresFacture.FromSqlRaw("GetAchatBieresFactureAll").ToListAsync();

            if (achats == null)
            {
                achats = new List<AchatBieresFacture>();
            }
            return achats;
           
        }


        // GET: api/AchatsBieresFacture/5
        // renvoie les factures de bières d'une organisation => accès pour admin, groupAdmin et GroupAchat
        [HttpGet("{id}")]
        [Authorize(Policy = "hasAchatAccess")]
        public async Task<ActionResult<List<AchatBieresFacture>>> GetAchatsBieresFactureOrgaAsync(Guid id)
        {
            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList()) == id)
            {
                var param = new SqlParameter("@OrgId", id);
                List<AchatBieresFacture> achats = (List<AchatBieresFacture>)await _context.AchatsBieresFacture.FromSqlRaw("GetAchatBieresFactureOrga @OrgId", param).ToListAsync();

                if (achats == null)
                {
                    achats = new List<AchatBieresFacture>();
                }

                return achats;
            }
            return Forbid();
        }
    }
}
