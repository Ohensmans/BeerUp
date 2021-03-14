using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.BeerUp
{
    public interface IAdresseFacturationService
    {
        Task<AdressesFacturation> CreateAdresseAsync(AdressesFacturation adresse);
    }
}
