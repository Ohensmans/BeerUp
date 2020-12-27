using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public class OrganisationService : IOrganisationService
    {
        public Task<Organisation> CreateOrganisationAsync(Organisation etablissement, string idToken)
        {
            throw new NotImplementedException();
        }

        public Task DeleteOrganisationAsync(Guid id, string idToken)
        {
            throw new NotImplementedException();
        }

        public Task<List<Organisation>> GetAllOrganisationsAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Organisation> GetOrganisationAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<Organisation> UpdateOrganisationAsync(Organisation etablissement, string idToken)
        {
            throw new NotImplementedException();
        }
    }
}
