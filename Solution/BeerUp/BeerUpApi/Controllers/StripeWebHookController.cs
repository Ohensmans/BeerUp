using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using Stripe;
using System.Threading.Tasks;
using BeerUpApi.ParamAccess;
using Microsoft.Extensions.Options;
using Repo.Modeles.ModelesBeerUp;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StripeWebHook : Controller
    {
        // You can find your endpoint's secret in your webhook settings
        private readonly string secret;

        private readonly BeerUpContext _context;

        public StripeWebHook(IOptions<BaseKey> key, BeerUpContext context)
        {
            this.secret = key.Value.StripeWebHookKey;
            _context = context;
        }



        [HttpPost]
        public async Task<IActionResult> Index()
        {
            var json = await new StreamReader(HttpContext.Request.Body).ReadToEndAsync();

            try
            {
                var stripeEvent = EventUtility.ConstructEvent(
                  json,
                  Request.Headers["Stripe-Signature"],
                  secret
                );

                Stripe.Checkout.Session session = null;

                switch (stripeEvent.Type)
                {
                    case Events.CheckoutSessionCompleted:
                        session = stripeEvent.Data.Object as Stripe.Checkout.Session;

                        // Save an order in your database, marked as 'awaiting payment'
                        await CreateOrderAsync(session);

                        // Check if the order is paid (e.g., from a card payment)
                        //
                        // A delayed notification payment will have an `unpaid` status, as
                        // you're still waiting for funds to be transferred from the customer's
                        // account.
                        var orderPaid = session.PaymentStatus == "paid";

                        if (orderPaid)
                        {
                            // Fulfill the purchase
                            await FulfillOrderAsync(session);
                        }

                        break;
                    case Events.CheckoutSessionAsyncPaymentSucceeded:
                        session = stripeEvent.Data.Object as Stripe.Checkout.Session;

                        // Fulfill the purchase
                        await FulfillOrderAsync(session);

                        break;
                    case Events.CheckoutSessionAsyncPaymentFailed:
                        session = stripeEvent.Data.Object as Stripe.Checkout.Session;

                        // Cancel the purchase
                        await CancelOrderAsync(session);

                        break;
                }

                return Ok();
            }
            catch (StripeException)
            {
                return BadRequest();
            }
        }

        private async Task FulfillOrderAsync(Stripe.Checkout.Session session)
        {
            Guid transactionId = await getTransactionIdAsync(session.Id);
            if (transactionId != Guid.Empty)
            {
                await updateTransStatutAsync(transactionId, Status.CONFIRMED);
                if (session.Metadata.ContainsKey("AdresseId"))
                {
                    await createFactureAsync(transactionId, session.Id, session.Metadata["AdresseId"]);
                }
            }

            
        }

        private async Task CreateOrderAsync(Stripe.Checkout.Session session)
        {
            Guid transactionId = await getTransactionIdAsync(session.Id);
            if (transactionId != Guid.Empty)
            {
                await updateTransStatutAsync(transactionId, Status.AWAITING_PAYMENT);
            }
        }

        private async Task CancelOrderAsync (Stripe.Checkout.Session session)
        {
            Guid transactionId = await getTransactionIdAsync(session.Id);
            if (transactionId != Guid.Empty)
            {
                await updateTransStatutAsync(transactionId, Status.CANCELED);
            }
        }

        private async Task<Guid> getTransactionIdAsync(string sessionId)
        {
            var param = new SqlParameter("@StripeId", sessionId);
            List<Transaction> transactions =  (List<Transaction>) await _context.Transactions.FromSqlRaw("GetTransactionWithStripeId @StripeId", param).ToListAsync();


            if (transactions == null || transactions.Count !=1)
            {
                return Guid.Empty;
            }

            return transactions[0].TransId;
        }

        private async Task updateTransStatutAsync(Guid transId, Status statut)
        {
            if (transId != Guid.Empty)
            {
                var transaction = await _context.Transactions.FindAsync(transId);

                if (transaction != null)
                {
                    transaction.TransStatus = statut.ToString();

                    _context.Entry(transaction).State = EntityState.Modified;

                    try
                    {
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        throw;
                    }

                }
            }
        }


        private async Task createFactureAsync(Guid transactionId, string sessionId, string adresseId)
        {
            Facture fact = new Facture();
            fact.FacDate = DateTime.Today;
            fact.AdrFacId = Guid.Parse(adresseId);
            fact.TransId = transactionId;
           
            _context.Factures.Add(fact);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                throw;
            }

        }
        private enum Status { NEW, CORRECTION, AWAITING_PAYMENT, CONFIRMED, CANCELED }
    }
}
