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
    [Authorize(Policy = "hasBiereAccess")]
    [ApiController]
    public class GetDeletablesBieresController : ControllerBase
    {

        private readonly BeerUpContext _context;

        public GetDeletablesBieresController(BeerUpContext context)
        {
            this._context = context;
        }


        // GET: api/<GetDeletablesBieresController>
        [HttpGet]
        public ActionResult<List<Biere>> Get()
        {
            List<Biere> lbiere = (List<Biere>)_context.Bieres.FromSqlRaw("GetDeletablesBieres").ToList();

            if (lbiere == null)
            {
                lbiere = new List<Biere>();
            }

            return lbiere;
        }

        // GET api/<GetDeletablesBieresController>/5
        [HttpGet("{id}")]
        public ActionResult<List<Biere>> Get(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<Biere> lbiere = (List<Biere>)_context.Bieres.FromSqlRaw("GetDeletablesBieresOrga @OrgId", param).ToList();

            if (lbiere == null)
            {
                lbiere = new List<Biere>();
            }

            if (!AuthGuard.isAdminOrGroupAdmin(HttpContext.User.Claims.ToList()) && !AuthGuard.hasFullAccess(true, false, HttpContext.User.Claims.ToList()))
            {
                List<Guid> lAccess = AuthGuard.getListAccess(true, false, HttpContext.User.Claims.ToList());

                List<Biere> lBieres = new List<Biere>();
                foreach (Biere bie in lbiere)
                {
                    if (lAccess.Any(b => b == bie.BieId))
                    {
                        lBieres.Add(bie);
                    }
                }
                lbiere = lBieres;
            }

            return lbiere;
        }

        
    }
}
