using BeerUpApi.ParamAccess;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Mollie.Api.Client;
using Mollie.Api.Client.Abstract;
using Mollie.Api.Models;
using Mollie.Api.Models.Payment.Request;
using Mollie.Api.Models.Payment.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MollieController : ControllerBase
    {
        private readonly string baseUrl;
        private readonly HttpClient _client;
        private readonly string baseKey;
        private readonly string referencePayment;
        private readonly string redirectUrl;
        private readonly string webHookUrl;

        public MollieController(IOptions<BaseUrl> url, IOptions<BaseKey> key, IOptions<BaseParam> param, HttpClient client)
        {
            _client = client;
            this.baseUrl = url.Value.apiMollie;
            this.baseKey = key.Value.MollieKey;
            this.referencePayment = param.Value.referencePayment;
            this.redirectUrl = param.Value.redirectUrl;
            this.webHookUrl = param.Value.webHookUrl;
        }

        // GET: api/<MollieController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<MollieController>/5,5
        [HttpGet("{solde},{factureId}")]
        [HttpGet("{solde, factureId}")]
        public async Task<string> GetAsync(int solde, string factureId)
        {
            IPaymentClient paymentClient = new PaymentClient(this.baseKey);
            PaymentRequest paymentRequest = new PaymentRequest()
            {
                Amount = new Amount(Currency.EUR, solde),
                Description = this.referencePayment + factureId,
                RedirectUrl = this.redirectUrl,
                Method = Mollie.Api.Models.Payment.PaymentMethod.Bancontact,
                //WebhookUrl = this.webHookUrl
            };

            PaymentResponse paymentResponse = await paymentClient.CreatePaymentAsync(paymentRequest);
            return paymentResponse.Links.Checkout.ToString();
        }

        // POST api/<MollieController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<MollieController>/5,15
        [HttpPut("{solde,factureId}")]
        public async Task PutAsync(int solde, string factureId)
        {
            IPaymentClient paymentClient = new PaymentClient(this.baseKey);
            PaymentRequest paymentRequest = new PaymentRequest()
            {
                Amount = new Amount(Currency.EUR,solde),
                Description = this.referencePayment+factureId,
                RedirectUrl = this.referencePayment,
                WebhookUrl = this.webHookUrl
            };

            PaymentResponse paymentResponse = await paymentClient.CreatePaymentAsync(paymentRequest);
        }

        // DELETE api/<MollieController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
