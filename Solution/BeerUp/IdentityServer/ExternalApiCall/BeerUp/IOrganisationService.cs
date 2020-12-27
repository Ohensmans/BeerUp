using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public interface IOrganisationService
    {
        Task<List<Organisation>> GetAllOrganisationsAsync();

        Task<Organisation> GetOrganisationAsync(Guid id);

        Task<Organisation> CreateOrganisationAsync(Organisation etablissement, string idToken);

        Task<Organisation> UpdateOrganisationAsync(Organisation etablissement, string idToken);

        Task DeleteOrganisationAsync(Guid id, string idToken);
    }
}
