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

        public string successUrl { get; set; }

        public string canceledUrl { get; set; }

        public string bucketName { get; set; }

        public string credentialGoogleJsonPath { get; set; }

        public string googleProjectId { get; set; }
        public string googleLocation { get; set; }
        public string googleProductSetId { get; set; }

    }
}
