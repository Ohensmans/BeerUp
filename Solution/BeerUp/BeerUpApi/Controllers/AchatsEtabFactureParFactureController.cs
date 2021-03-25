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
    [ApiController]
    public class AchatsEtabFactureParFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsEtabFactureParFactureController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/AchatsEtabFactureParFacture/5
        [HttpGet("{id}")]
        public ActionResult<List<AchatEtabFacture>> GetAchatsEtabFactureParFacture(int id)
        {
            var param = new SqlParameter("@FacId", id);
            List<AchatEtabFacture> achats = (List<AchatEtabFacture>)_context.AchatsEtabFacture.FromSqlRaw("GetAchatEtabFacture @FacId", param).ToList();

            if (achats == null)
            {
                achats = new List<AchatEtabFacture>();
            }

            return achats;
        }
    }
}
