using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.ParamAccess
{
    public class BaseKey
    {
        public string MapQuest { get; set; }
        public string MollieKey { get; set; }
        public string StripeWebHookKey { get; set; }

        public string StripeKey { get; set; }
    }
}
