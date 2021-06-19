using BeerUpApi.External_Api_Call;
using BeerUpApi.ParamAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class SearchBiereImageController : ControllerBase
    {
        private readonly BeerUpContext _context;
        private readonly string credentialGoogleJsonPath;
        private readonly string googleProjectId;
        private readonly string googleLocation;
        private readonly string googleProductSetId;

        public SearchBiereImageController(BeerUpContext context, IOptions<BaseParam> param)
        {
            this._context = context;
            this.credentialGoogleJsonPath = param.Value.credentialGoogleJsonPath;
            this.googleProjectId = param.Value.googleProjectId;
            this.googleLocation = param.Value.googleLocation;
            this.googleProductSetId = param.Value.googleProductSetId;
        }

        // GET: api/SearchBieres
        [HttpGet]
        public async Task<ActionResult<List<BiereDescr>>> SearchBieresAsync()
        {
            try
            {
                var formCollection = await Request.ReadFormAsync();
                var file = formCollection.Files.First();
                List<BiereDescr> bieres = new List<BiereDescr>();

                if (file.Length > 0)
                {
                    List<string> lBieId = new List<string>();
                    GCVisionService _gVision = new GCVisionService(googleProjectId, googleLocation, googleProductSetId, credentialGoogleJsonPath);
                    lBieId = await _gVision.SearchProductAsync(file);

                    if (lBieId != null && lBieId.Count > 0)
                    {
                        foreach (String id in lBieId)
                        {
                            var param = new SqlParameter("@BieId", id);
                            List<BiereDescr> biere = (List<BiereDescr>)await _context.BieresDescr.FromSqlRaw("SearchBiereById @BieId", param).ToListAsync();
                            if (biere != null && biere.Count > 0)
                            {
                                bieres.Add(biere[0]);
                            }
                        }
                    }

                    return bieres;
                }
                else
                {
                    return NotFound();
                }

            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }
    }
}
