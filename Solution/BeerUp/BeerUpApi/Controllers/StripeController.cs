using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Stripe.Checkout;
using Microsoft.Extensions.Options;
using BeerUpApi.ParamAccess;
using Stripe;
using Newtonsoft.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StripeController : ControllerBase
    {
        private readonly string baseUrl;
        private readonly string baseKey;
        private readonly string referencePayment;
        private readonly string successUrl;
        private readonly string canceledUrl;
        private readonly string webHookUrl;

        public StripeController(IOptions<BaseUrl> url, IOptions<BaseKey> key, IOptions<BaseParam> param)
        {
            this.baseUrl = url.Value.apiMollie;
            //StripeConfiguration.ApiKey = key.Value.StripeKey;
            StripeConfiguration.ApiKey = "sk_test_4eC39HqLyjWDarjtT1zdp7dc";
            this.referencePayment = param.Value.referencePayment;
            this.successUrl = param.Value.successUrl;
            this.canceledUrl = param.Value.canceledUrl;
            this.webHookUrl = param.Value.webHookUrl;
        }


        // POST api/<StripeController>
        [HttpGet("{solde},{factureId}")]
        [HttpGet("{solde, factureId}")]
        public ActionResult<string> CreateCheckoutSession(decimal solde, string factureId)
        {
            var options = new SessionCreateOptions
            {
                PaymentMethodTypes = new List<string>
                {
                  "card",
                },
                LineItems = new List<SessionLineItemOptions>
                {
                    new SessionLineItemOptions
                        {
                            PriceData = new SessionLineItemPriceDataOptions
                                {
                                    UnitAmount = (long?)(solde*100),
                                    Currency = "eur",
                                    ProductData = new SessionLineItemPriceDataProductDataOptions
                                      {
                                        Name = (referencePayment + factureId),
                                      },

                                },
                            Quantity = 1,
                        },
                },
                Mode = "payment",
                SuccessUrl = successUrl,
                CancelUrl = canceledUrl,
            };

            var service = new SessionService();
            Session session = service.Create(options);

            return JsonConvert.SerializeObject(new { id = session.Id });
        }

    }
}
