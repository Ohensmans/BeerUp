using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public interface IEtablissementService
    {
        Task<List<Etablissement>> GetAllEtablissementsAsync();

    }
}
