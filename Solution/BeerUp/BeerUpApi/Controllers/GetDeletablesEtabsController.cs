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
    [Route("api/[controller]")]
    [ApiController]
    public class GetDeletablesEtabController : ControllerBase
    {

        private readonly BeerUpContext _context;

        public GetDeletablesEtabController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/<GetDeletablesEtabController>
        [HttpGet]
        public ActionResult<List<Etablissement>> Get()
        {
            List<Etablissement> lEtab= (List<Etablissement>)_context.Etablissements.FromSqlRaw("GetDeletablesEta").ToList();

            if (lEtab == null)
            {
                lEtab = new List<Etablissement>();
            }

            return lEtab;
        }

        // GET api/<GetDeletablesEtabController>/5
        [HttpGet("{id}")]
        public ActionResult<List<Etablissement>> Get(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<Etablissement> lEtab = (List<Etablissement>)_context.Etablissements.FromSqlRaw("GetDeletablesEtaOrga @OrgId", param).ToList();

            if (lEtab == null)
            {
                lEtab = new List<Etablissement>();
            }

            return lEtab;
        }
    }
}
