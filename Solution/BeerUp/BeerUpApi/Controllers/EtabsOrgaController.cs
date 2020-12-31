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
    public class EtabsOrgaController : ControllerBase
    {

        private readonly BeerUpContext _context;

        public EtabsOrgaController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/EtabsOrga/5
        [HttpGet("{id}")]
        public ActionResult<List<Etablissement>> GetEtablissementsOrga(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<Etablissement> etab = (List<Etablissement>)_context.Etablissements.FromSqlRaw("GetEtablissementsOrganistion @OrgId", param).ToList();

            if (etab == null)
            {
                etab = new List<Etablissement>();
            }

            return etab;
        }
    }
    
}
