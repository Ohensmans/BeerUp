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
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class VuesAchatsEtabController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public VuesAchatsEtabController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/VuesAchatsEtab/5
        [HttpGet("{id}")]
        public async Task<ActionResult<List<VueAchatsEtab>>> GetVuesAchatsEtabAsync(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<VueAchatsEtab> lVue = (List<VueAchatsEtab>) await _context.VueAchatsEtab.FromSqlRaw("GetAchatEtabsOrga @OrgId", param).ToListAsync();

            if (lVue == null)
            {
                lVue = new List<VueAchatsEtab>();
            }

            return lVue.OrderBy(v => v.Nom).ToList();
        }

        // GET: api/VuesAchatsEtab
        [HttpGet]
        public async Task<ActionResult<IEnumerable<VueAchatsEtab>>> GetAllVuesAchatsEtabAsync()
        {
            List<VueAchatsEtab> lVue = (List<VueAchatsEtab>) await _context.VueAchatsEtab.FromSqlRaw("GetAllAchatEtabsOrga").ToListAsync();


            return lVue.OrderBy(v => v.Nom).ToList();
        }
    }
}
