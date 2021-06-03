using BeerUpApi.Services;
using Microsoft.AspNetCore.Authorization;
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
    [Authorize(Policy = "hasAchatAccess")]
    [ApiController]
    public class AdressesFacturationOrgaController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AdressesFacturationOrgaController(BeerUpContext context)
        {
            _context = context;
        }


        // GET: api/AdressesFacturation/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<List<AdressesFacturation>>>> GetAdressesAsync(Guid id)
        {
            Guid orgId = AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList());

            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || orgId == id)
            {

                var param = new SqlParameter("@OrgId", id);
                List<AdressesFacturation> lAdresse = (List<AdressesFacturation>) await _context.AdressesFacturations.FromSqlRaw("GetAdressesOrga @OrgId", param).ToListAsync();

                if (lAdresse == null || lAdresse.Count == 0)
                {
                    return NotFound();
                }

                List<AdressesFacturation> lastAdressse = (List<AdressesFacturation>)await _context.AdressesFacturations.FromSqlRaw("GetLastAdressesOrga @OrgId", param).ToListAsync();

                List<List<AdressesFacturation>> lFullAdresses = new List<List<AdressesFacturation>>();
                lFullAdresses.Add(lAdresse);
                lFullAdresses.Add(lastAdressse);

                return lFullAdresses;
            }
            return Forbid();
        }
    }
}
