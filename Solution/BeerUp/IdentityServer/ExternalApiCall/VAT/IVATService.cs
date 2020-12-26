using IdentityServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.ExternalApiCall.VAT
{
    public interface IVATService
    {
        Task<VATResponseModele> GetVATResponse(string VAT);
    }
}
