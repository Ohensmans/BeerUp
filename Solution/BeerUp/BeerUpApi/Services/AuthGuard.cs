using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace BeerUpApi.Services
{
    public static class AuthGuard
    {

        public static bool isAdmin (List<Claim> userClaims)
        {
            if (userClaims.Where(c => c.Type == "http://schemas.microsoft.com/ws/2008/06/identity/claims/role" && c.Value == "Administrateur").Any() 
                && userClaims.Where(c => c.Type == "Valide" && c.Value =="True").Any())
            {
                return true;
            }

                return false;
        }

        public static bool isGroupAdmin(List<Claim> userClaims)
        {
            if (userClaims.Where(c => c.Type == "http://schemas.microsoft.com/ws/2008/06/identity/claims/role" && c.Value == "GroupAdmin").Any()
                && userClaims.Where(c => c.Type == "Valide" && c.Value == "True").Any())
            {
                return true;
            }

            return false;
        }

        public static bool isAdminOrGroupAdmin(List<Claim> userClaims)
        {
            if (isAdmin(userClaims) || isGroupAdmin(userClaims))
            {
                return true;
            }
            return false;
        }

        public static bool hasBiereAccess(List<Claim> userClaims)
        {
            if (isAdminOrGroupAdmin(userClaims) || userClaims.Where(c => c.Type == "http://schemas.microsoft.com/ws/2008/06/identity/claims/role" && c.Value == "GroupBiere").Any()
                && userClaims.Where(c => c.Type == "Valide" && c.Value == "True").Any())
            {
                return true;
            }
            return false;
        }

        public static bool isMobileUser(List<Claim> userClaims)
        {
            if (userClaims.Where(c => c.Type == "http://schemas.microsoft.com/ws/2008/06/identity/claims/role" && c.Value == "User").Any()
                && userClaims.Where(c => c.Type == "Valide" && c.Value == "True").Any())
            {
                return true;
            }
            return false;
        }

        public static Guid getOrgIdUser (List<Claim> userClaims)
        {
            if (userClaims.FirstOrDefault(c => c.Type == "OrgId") != null)
            {
                return Guid.Parse(userClaims.FirstOrDefault(c => c.Type == "OrgId").Value);
            }
            else
                return Guid.Empty;
        }

        public static Guid getUserId(List<Claim> userClaims)
        {
            if (userClaims.FirstOrDefault(c => c.Type == "sid") != null)
            {
                return Guid.Parse(userClaims.FirstOrDefault(c => c.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier").Value);
            }
            else
                return Guid.Empty;
        }

        public static async Task<bool> etabIsInUserOrgAsync (Guid? etaId, BeerUpContext context, List<Claim> userClaims)
        {
            List<Etablissement> lEtab = await context.Etablissements.AsNoTracking().Where(e => e.EtaId == etaId).ToListAsync();
            Guid orgId = Guid.Parse(userClaims.FirstOrDefault(c => c.Type == "OrgId").Value);
            
            if (lEtab.Any(e => e.OrgId == orgId))
            {
                return true;
            }
            return false;
        }

        public static async Task<bool> biereIsInUserOrgAsync(Guid? bieId, BeerUpContext context, List<Claim> userClaims)
        {
            Guid orgId = Guid.Parse(userClaims.FirstOrDefault(c => c.Type == "OrgId").Value);

            var param = new SqlParameter("@OrgId", orgId);
            List<Biere> lBieres = (List<Biere>) await context.Bieres.FromSqlRaw("GetBieresOrganistion @OrgId", param).AsNoTracking().ToListAsync();
            

            if (lBieres.Any(e => e.BieId == bieId))
            {
                return true;
            }
            return false;
        }

        //isBiere true => renvoie la liste d'accès bière
        //isBiere false => renvoie la liste d'accès etab
        //isAchat true => renvoie la liste pour l'accès Achat de bière ou étab
        //isAchat false => renvoie la liste pour l'accès  bière ou étab
        public static List<Guid> getListAccess(bool isBiere, bool isAchat, List<Claim> userClaims)
        {
            List<Guid> listAccess = new List<Guid>();
            if(isBiere && isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupAchatBiere").ToList();
                foreach(Claim claim in listAcces)
                {
                    listAccess.Add(Guid.Parse(claim.Value));
                }
            }

            if (!isBiere && isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupAchatEtab").ToList();
                foreach (Claim claim in listAcces)
                {
                    listAccess.Add(Guid.Parse(claim.Value));
                }
            }

            if (!isBiere && !isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupEtablissementEtab").ToList();
                foreach (Claim claim in listAcces)
                {
                    listAccess.Add(Guid.Parse(claim.Value));
                }
            }

            if (isBiere && !isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupBiereBiere").ToList();
                foreach (Claim claim in listAcces)
                {
                    listAccess.Add(Guid.Parse(claim.Value));
                }
            }

            return listAccess;

        }

        //isBiere true => renvoie si full accès bière
        //isBiere false => renvoie si full accès etab
        //isAchat true => renvoie si full accès Achat de bière ou étab
        //isAchat false => renvoie si full accès  bière ou étab
        public static bool hasFullAccess(bool isBiere, bool isAchat, List<Claim> userClaims)
        {
            if (isBiere && isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupAchatBiere").ToList();
                if (listAcces[0].Value == "All")
                {
                    return true;
                }

            }

            if (!isBiere && isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupAchatEtab").ToList();
                if (listAcces[0].Value == "All")
                {
                    return true;
                }
            }

            if (!isBiere && !isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupEtablissementEtab").ToList();
                if (listAcces[0].Value == "All")
                {
                    return true;
                }
            }

            if (isBiere && !isAchat)
            {
                List<Claim> listAcces = userClaims.Where(c => c.Type == "GroupBiereBiere").ToList();
                if (listAcces[0].Value == "All")
                {
                    return true;
                }
            }
            return false;
        }


    }
}
