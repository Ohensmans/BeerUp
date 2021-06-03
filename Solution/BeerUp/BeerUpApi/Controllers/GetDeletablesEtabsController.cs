using BeerUpApi.Services;
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
    [Route("api/[controller]")]
    [Authorize(Policy = "hasEtabAccess")]
    [ApiController]
    public class GetDeletablesEtabsController : ControllerBase
    {

        private readonly BeerUpContext _context;

        public GetDeletablesEtabsController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/<GetDeletablesEtabController>
        [HttpGet]
        [Authorize(Policy = "isAdmin")]
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

            if (!AuthGuard.isAdminOrGroupAdmin(HttpContext.User.Claims.ToList()) && !AuthGuard.hasFullAccess(false, false, HttpContext.User.Claims.ToList()))
            {
                List<Guid> lAccess = AuthGuard.getListAccess(false, false, HttpContext.User.Claims.ToList());

                List<Etablissement> lEtabs = new List<Etablissement>();
                foreach (Etablissement etab in lEtab)
                {
                    if (lAccess.Any(a => a == etab.EtaId))
                    {
                        lEtabs.Add(etab);
                    }
                }
                return lEtabs;
            }

            return lEtab;
        }
    }
}
