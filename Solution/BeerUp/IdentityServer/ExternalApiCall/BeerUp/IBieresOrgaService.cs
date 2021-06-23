using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Security.Principal;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public interface IBieresOrgaService
    {
        Task<List<Biere>> GetAllBieresOrgaAsync(Guid id, string token);
    }
}
