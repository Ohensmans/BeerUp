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
    public class AchatsBieresFactureParFactureController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AchatsBieresFactureParFactureController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/AchatsBieresFactureParFacture/5
        [HttpGet("{id}")]
        public ActionResult<List<AchatBieresFacture>> GetAchatsBieresFactureParFacture(int id)
        {
            var param = new SqlParameter("@FacId", id);
            List<AchatBieresFacture> achats = (List<AchatBieresFacture>)_context.AchatsBieresFacture.FromSqlRaw("GetAchatBieresFacture @FacId", param).ToList();

            if (achats == null)
            {
                achats = new List<AchatBieresFacture>();
            }

            return achats;
        }
    }
}
