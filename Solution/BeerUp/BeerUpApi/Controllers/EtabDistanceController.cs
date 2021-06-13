using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class EtabDistanceController : ControllerBase
    {
        private readonly BeerUpContext _context;
        public double MILEMARIN = 1.852;
        public int COEFMINUTE = 60;

        public EtabDistanceController(BeerUpContext context)
        {
            this._context = context;
        }

        // GET: api/EtabDistance/5,4.45,50.4
        //renvoie une facture spécifique
        //[HttpGet("{distance, lattitude, longitude, bieId}")]
        //[HttpGet("{distance},{lattitude},{longitude},{bieId}")]
        [HttpGet]
        public async Task<ActionResult<List<EtablDescr>>> GetEtabsDistance(double distance, double lattitude, double longitude, Guid bieId)
        {
            try
            {
                var id = bieId.ToString();
                var param = new SqlParameter("@BieId", bieId.ToString());
                List<Etablissement> lEtabs = (List<Etablissement>)await _context.Etablissements.FromSqlRaw("GetEtablissementsBiereServie @BieId", param).ToListAsync();


                double zMax = (distance) / (MILEMARIN * COEFMINUTE);
                var test = Double.Parse(distance.ToString(), CultureInfo.InvariantCulture);
                var test2 = (lattitude);
                var test3 = (longitude);
                var PAR = (Math.PI * (lattitude)) / 180;

                lEtabs = lEtabs.Where(e => e.EtaCoordLat != null && e.EtaCoordLat != ""
                && Double.Parse(e.EtaCoordLat, CultureInfo.InvariantCulture) >= (Double.Parse(e.EtaCoordLat, CultureInfo.InvariantCulture) - zMax)
                && Double.Parse(e.EtaCoordLat, CultureInfo.InvariantCulture) <= (Double.Parse(e.EtaCoordLat, CultureInfo.InvariantCulture) + zMax)).ToList();

                var cosPAR = Math.Cos(PAR);

                lEtabs = lEtabs.Where(e => e.EtaCoordLong != null && e.EtaCoordLong != ""
                && ((Double.Parse(e.EtaCoordLong, CultureInfo.InvariantCulture) - (longitude)) * cosPAR) <= zMax).ToList();

                if (lEtabs != null && lEtabs.Any())
                {
                    List<TypesEtablissement> lTypes = await _context.TypesEtablissements.ToListAsync();

                    List<EtablDescr> lEtabsDescr = new List<EtablDescr>();
                    

                    foreach (Etablissement etab in lEtabs)
                    {
                        EtablDescr etabDes = new EtablDescr();
                        etabDes.Convert(etab);

                        etabDes.nomTypeEta = lTypes.FirstOrDefault(t => t.TypEtaId == etab.TypEtaId).TypEtaNom;

                        var PA = (lattitude);
                        var PB = Double.Parse(etab.EtaCoordLat, CultureInfo.InvariantCulture);
                        var LA = (longitude);
                        var LB = Double.Parse(etab.EtaCoordLong, CultureInfo.InvariantCulture);
                        var PBR = (Math.PI * Double.Parse(etab.EtaCoordLat, CultureInfo.InvariantCulture)) / 180;

                        double x = (LB - LA) * Math.Cos((PAR + PBR) / 2);
                        double y = (PB - PA);
                        double z = Math.Sqrt((Math.Pow(x, 2) + Math.Pow(y, 2)));
                        etabDes.distance = z * COEFMINUTE * MILEMARIN;

                        lEtabsDescr.Add(etabDes);
                    }
                    return lEtabsDescr.Where(e => e.distance <= (distance)).OrderBy(e => e.distance).ToList();
                }
                return new List<EtablDescr>();


            }
             
            catch (Exception ex)
            {
                throw ex;
            }
}



    }
}
