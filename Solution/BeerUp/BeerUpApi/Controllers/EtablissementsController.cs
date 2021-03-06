﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BeerUpApi.External_Api_Call;
using BeerUpApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using Repo.Modeles.POC;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class EtablissementsController : ControllerBase
    {
        private readonly BeerUpContext _context;
        private readonly IMapService mapService;
        const string brasserie = "BRASSERIE";

        public EtablissementsController(BeerUpContext context, IMapService mapService)
        {
            _context = context;
            this.mapService = mapService;
        }

        // GET: api/Etablissements
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Etablissement>>> GetEtablissements()
        {
            //if (orgId != null)
            //{
            //    var param = new SqlParameter("@OrgId", orgId);
            //    return _context.Etablissements.FromSqlRaw("GetEtablissementsOrganistion @OrgId", param).ToList();
            //}
            //else
            return await _context.Etablissements.OrderBy(e => e.EtaNom).ToListAsync();
        }

        // GET: api/Etablissements/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Etablissement>> GetEtablissement(Guid id)
        {
            var etablissement = await _context.Etablissements.FindAsync(id);
            
            EtablDescr etabDes = new EtablDescr();
            etabDes.Convert(etablissement);
            etabDes.estOuvert = await EtabEstOuvert.estOuvertAsync(etablissement, _context);

            if (etablissement == null)
            {
                return NotFound();
            }
            return etabDes;
        }

        // PUT: api/Etablissements/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [Authorize(Policy = "hasEtabAccess")]
        public async Task<IActionResult> PutEtablissement(Guid id, Etablissement etablissement)
        {
            var orgId = AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList());

            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || orgId == etablissement.OrgId)
            {

                try
                {
                    if (id != etablissement.EtaId)
                    {
                        return BadRequest();
                    }

                    List<Etablissement> lEtab = await _context.Etablissements.AsNoTracking().ToListAsync();

                    if (lEtab.Any(e => e.EtaId == etablissement.EtaId && (e.EtaRue != etablissement.EtaRue || e.EtaVille != etablissement.EtaVille)))
                    {
                        etablissement = await GetCoordinatesAsync(etablissement);
                    }

                    _context.Entry(etablissement).State = EntityState.Modified;

                    await _context.SaveChangesAsync();

                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EtablissementExists(id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                catch (Exception)
                {
                    throw;
                }

                return NoContent();
            }
            return Forbid();
        }

        // POST: api/Etablissements
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Etablissement>> PostEtablissement(Etablissement etablissement)
        {
            try
            {
                List<Etablissement> lEtab = _context.Etablissements.ToList();
                

                if(etablissement.EtaRue!=null && etablissement.EtaRue != "") 
                {
                    etablissement = await GetCoordinatesAsync(etablissement);
                }

                //new Etab from Mobile orgId = Guid.Empty
                //new Etab from Web (not from Admin) orgId = new Guid
                //new Etab from Web and Admin orgId = Guid.Empty

                if (!AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) && etablissement.OrgId == Guid.Empty)
                {
                    TypesEtablissement type = await _context.TypesEtablissements.FirstOrDefaultAsync(t => t.TypEtaNom.ToUpper() == brasserie);
                    etablissement.TypEtaId = type.TypEtaId;

                    if(lEtab.Exists(e => e.EtaNom == etablissement.EtaNom && e.TypEtaId == type.TypEtaId))
                    {
                        return lEtab.FirstOrDefault(e => e.EtaNom == etablissement.EtaNom);
                    }
                }
                
                if (lEtab.Exists(etab => etab.EtaNom == etablissement.EtaNom && etab.OrgId == Guid.Empty)&& etablissement.OrgId!=Guid.Empty)
                {
                    etablissement.EtaId = lEtab.First(etab => etab.EtaNom == etablissement.EtaNom).EtaId;
                    _context.Entry(etablissement).State = EntityState.Modified;
                }
                else
                {
                    _context.Etablissements.Add(etablissement);
                }

                await _context.SaveChangesAsync();

                return CreatedAtAction("GetEtablissement", new { id = etablissement.EtaId }, etablissement);
            }
            catch (Exception)
            {
                throw;
            }
        }

        // DELETE: api/Etablissements/5
        [HttpDelete("{id}")]
        [Authorize(Policy = "hasEtabAccess")]
        public async Task<IActionResult> DeleteEtablissement(Guid id)
        {
            var orgId = AuthGuard.getOrgIdUser(HttpContext.User.Claims.ToList());

            if (AuthGuard.isAdmin(HttpContext.User.Claims.ToList()) || orgId == id)
            {
                var etablissement = await _context.Etablissements.FindAsync(id);
                var horaires = await _context.Horaires.Where(h => h.EtaId == etablissement.EtaId).ToListAsync();
                var jours = await _context.JoursFermeture.Where(j => j.EtaId == etablissement.EtaId).ToListAsync();
                var ventes = await _context.VenteBiereEta.Where(v => v.EtaId == etablissement.EtaId).ToListAsync();
                if (etablissement == null)
                {
                    return NotFound();
                }

                _context.Etablissements.Remove(etablissement);
                await _context.SaveChangesAsync();

                return NoContent();
            }
            return Forbid();
        }

        private bool EtablissementExists(Guid id)
        {
            return _context.Etablissements.Any(e => e.EtaId == id);
        }

        private async Task<Etablissement> GetCoordinatesAsync(Etablissement etablissement)
        {
            string adresse = etablissement.EtaNum + "+" + etablissement.EtaRue + ",+" + etablissement.EtaCp + ",+" + etablissement.EtaVille + ",+" + etablissement.EtaPays;
            Coordonne coord = await mapService.GetCoordinates(adresse);

            etablissement.EtaCoordLat = coord.Latitude;
            etablissement.EtaCoordLong = coord.Longitude;

            return etablissement;
        }


    }
}
