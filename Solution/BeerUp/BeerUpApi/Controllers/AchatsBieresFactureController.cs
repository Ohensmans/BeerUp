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
    public class AchatsBieresFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsBieresFactureController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/AchatsBieresFacture/
        [HttpGet]
        public ActionResult<List<AchatBieresFacture>> GetAchatsBieresFactureOrga()
        {
            List<AchatBieresFacture> achats = (List<AchatBieresFacture>)_context.AchatsBieresFacture.FromSqlRaw("GetAchatBieresFactureAll").ToList();

            if (achats == null)
            {
                achats = new List<AchatBieresFacture>();
            }

            return achats;
        }


        // GET: api/AchatsBieresFacture/5
        [HttpGet("{id}")]
        public ActionResult<List<AchatBieresFacture>> GetAchatsBieresFactureOrga(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<AchatBieresFacture> achats = (List<AchatBieresFacture>)_context.AchatsBieresFacture.FromSqlRaw("GetAchatBieresFactureOrga @OrgId", param).ToList();

            if (achats == null)
            {
                achats = new List<AchatBieresFacture>();
            }

            return achats;
        }
    }
}
