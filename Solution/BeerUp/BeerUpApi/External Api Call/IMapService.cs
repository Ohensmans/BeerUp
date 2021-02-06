using Repo.Modeles.POC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.External_Api_Call
{
    public interface IMapService
    {
        Task<Coordonne> GetCoordinates(string adresse);
    }
}
