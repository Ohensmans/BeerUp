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
    public class AchatsEtabFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsEtabFactureController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/AchatsEtabFacture/
        [HttpGet]
        public ActionResult<List<AchatEtabFacture>> GetAchatsEtabFactureOrga()
        {
            List<AchatEtabFacture> achats = (List<AchatEtabFacture>)_context.AchatsEtabFacture.FromSqlRaw("GetAchatEtabFactureAll").ToList();

            if (achats == null)
            {
                achats = new List<AchatEtabFacture>();
            }

            return achats;
        }


        // GET: api/AchatsEtabFacture/5
        [HttpGet("{id}")]
        public ActionResult<List<AchatEtabFacture>> GetAchatsEtabFactureOrga(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<AchatEtabFacture> achats = (List<AchatEtabFacture>)_context.AchatsEtabFacture.FromSqlRaw("GetAchatEtabFactureOrga @OrgId", param).ToList();

            if (achats == null)
            {
                achats = new List<AchatEtabFacture>();
            }

            return achats;
        }
    }
}
