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
    public class AchatsFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsFactureController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/AchatsFacture/
        [HttpGet]
        public ActionResult<List<AchatFacture>> GetAchatsFactureOrga()
        {
            List<AchatFacture> achats = (List<AchatFacture>)_context.AchatsFacture.FromSqlRaw("GetAchatFactureAll").ToList();

            if (achats == null)
            {
                achats = new List<AchatFacture>();
            }

            return achats;
        }


        // GET: api/AchatsFacture/5
        [HttpGet("{id}")]
        public ActionResult<List<AchatFacture>> GetAchatsFactureOrga(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<AchatFacture> achats = (List<AchatFacture>)_context.AchatsFacture.FromSqlRaw("GetAchatFactureOrga @OrgId", param).ToList();

            if (achats == null)
            {
                achats = new List<AchatFacture>();
            }

            return achats;
        }
    }
}
