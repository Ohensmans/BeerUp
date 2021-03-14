using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.ParamAccess
{
    public class BaseParam
    {
        public string MapQuest { get; set; }
        public string referencePayment { get; set; }

        public string redirectUrl { get; set; }
        public string webHookUrl { get; set; }
    }
}
