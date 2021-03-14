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
    public class AdressesFacturationOrgaController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public AdressesFacturationOrgaController(BeerUpContext context)
        {
            _context = context;
        }


        // GET: api/AdressesFacturation/5
        [HttpGet("{id}")]
        public ActionResult<List<List<AdressesFacturation>>> GetAdresses(Guid id)
        {
            var param = new SqlParameter("@OrgId", id);
            List<AdressesFacturation> lAdresse = (List<AdressesFacturation>)_context.AdressesFacturations.FromSqlRaw("GetAdressesOrga @OrgId", param).ToList();

            if (lAdresse == null)
            {
                return NotFound();
            }
            
            List<AdressesFacturation> lastAdressse = (List<AdressesFacturation>)_context.AdressesFacturations.FromSqlRaw("GetLastAdressesOrga @OrgId", param).ToList();

            List<List<AdressesFacturation>> lFullAdresses = new List<List<AdressesFacturation>>();
            lFullAdresses.Add(lAdresse);
            lFullAdresses.Add(lastAdressse);

            return lFullAdresses;
        }
    }
}
