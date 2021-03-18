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
    public class AchatFactureParFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatFactureParFactureController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/AchatsFacture/5
        [HttpGet("{id}")]
        public ActionResult<List<AchatFacture>> GetAchatsFactureOrga(int id)
        {
            var param = new SqlParameter("@FacId", id);
            List<AchatFacture> achats = (List<AchatFacture>)_context.AchatsFacture.FromSqlRaw("GetAchatFacture @FacId", param).ToList();

            if (achats == null)
            {
                achats = new List<AchatFacture>();
            }

            return achats;
        }
    }
}
