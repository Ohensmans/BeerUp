using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Stripe.Checkout;
using Microsoft.Extensions.Options;
using BeerUpApi.ParamAccess;
using Stripe;
using Newtonsoft.Json;
using Repo.Modeles.ModelesBeerUp;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StripeController : ControllerBase
    {

        private readonly string referencePayment;
        private readonly string successUrl;
        private readonly string canceledUrl;
        private readonly BeerUpContext _context;


        public StripeController(IOptions<BaseUrl> url, IOptions<BaseKey> key, IOptions<BaseParam> param, BeerUpContext context)
        {
            StripeConfiguration.ApiKey = key.Value.StripeKey;
            this.referencePayment = param.Value.referencePayment;
            this.successUrl = param.Value.successUrl;
            this.canceledUrl = param.Value.canceledUrl;
            _context = context;
        }


        // GET api/<StripeController>
        [HttpGet("{solde},{transId},{adresseId}")]
        [HttpGet("{solde, transId, adresseId}")]
        public async System.Threading.Tasks.Task<ActionResult<string>> CreateCheckoutSessionAsync(decimal solde, Guid transId, string adresseId)
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
                            UnitAmount = (long?)(solde * 100),
                            Currency = "eur",
                            ProductData = new SessionLineItemPriceDataProductDataOptions
                            {
                                Name = (referencePayment + transId),
                            }
                        },
                        Quantity = 1,
                    },
                },
                Mode = "payment",
                SuccessUrl = successUrl,
                CancelUrl = canceledUrl,
                Metadata = new Dictionary<string, string>
                {
                    { "AdresseId", adresseId },
                }
            };

            var service = new SessionService();
            Session session = service.Create(options);
            try
            {
                await updateTransactionAsync(transId, session.Id);
            }
            catch
            {
                throw;
            }
            

            return JsonConvert.SerializeObject(new { id = session.Id });
        }

        private async System.Threading.Tasks.Task<ActionResult> updateTransactionAsync(Guid transId, string sessionId)
        {
            var transaction = await _context.Transactions.FindAsync(transId);

            if (transaction == null)
            {
                return NotFound();
            }

            transaction.StripeId = sessionId;

            _context.Entry(transaction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TransExists(transId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        private bool TransExists(Guid id)
        {
            return _context.Transactions.Any(t=> t.TransId == id);
        }

    }
}
