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
    public class AvisMoyenController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AvisMoyenController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/AvisMoyen/5
        [HttpGet("{id}")]
        public ActionResult<AvisMoyen> GetAvisMoyen(Guid id)
        {
            var param = new SqlParameter("@BieId", id);
            List<AvisMoyen> lAvis = (List<AvisMoyen>)_context.AvisMoyens.FromSqlRaw("GetAvisMoyen @BieId", param).ToList();

            AvisMoyen avis;

            if (lAvis == null || lAvis.Count == 0)
            {
                avis = new AvisMoyen(id);
            }
            else
            {
                avis = lAvis[0];
            }

            return avis;
        }
    }
}
