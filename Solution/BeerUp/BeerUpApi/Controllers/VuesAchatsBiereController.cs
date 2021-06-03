using BeerUpApi.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize(Policy = "hasAchatAccess")]
    [ApiController]
    public class VuesAchatsBiereController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public VuesAchatsBiereController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/VuesAchatsBiere/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<VueAchatsBiere>>> GetVuesAchatsBiereAsync(Guid id)
        {
            if (!AuthGuard.isAdmin(HttpContext.User.Claims.ToList()))
            {
                var userOrgId = AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList());
                if (userOrgId != id)
                {
                    return Forbid();
                }
            }


            var param = new SqlParameter("@OrgId", id);
            List<VueAchatsBiere> lVue =(List<VueAchatsBiere>) await _context.VueAchatsBiere.FromSqlRaw("GetAchatBieresOrga @OrgId", param).ToListAsync();

            
            if (lVue == null)
            {
                lVue = new List<VueAchatsBiere>();
            }

            

            return lVue.OrderBy(v => v.Nom).ToList();

        }

        // GET: api/VuesAchatsBiere
        [HttpGet]
        [Authorize(Policy = "isAdmin")]
        public async Task<ActionResult<IEnumerable<VueAchatsBiere>>> GetAllVuesAchatsBiereAsync()
        {
            List<VueAchatsBiere> lVue = (List<VueAchatsBiere>) await _context.VueAchatsBiere.FromSqlRaw("GetAllAchatBieresOrga").ToListAsync();

            return lVue.OrderBy(v => v.Nom).ToList();
        }
    }
}
