using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using Stripe;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StripeWebHook : Controller
    {
        // You can find your endpoint's secret in your webhook settings
        const string secret = "whsec_...";



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
                        CreateOrder(session);

                        // Check if the order is paid (e.g., from a card payment)
                        //
                        // A delayed notification payment will have an `unpaid` status, as
                        // you're still waiting for funds to be transferred from the customer's
                        // account.
                        var orderPaid = session.PaymentStatus == "paid";
        
                        if (orderPaid)
                        {
                            // Fulfill the purchase
                            FulfillOrder(session);
                        }

                        break;
                    case Events.CheckoutSessionAsyncPaymentSucceeded:
                        session = stripeEvent.Data.Object as Stripe.Checkout.Session;

                        // Fulfill the purchase
                        FulfillOrder(session);

                        break;
                    case Events.CheckoutSessionAsyncPaymentFailed:
                        session = stripeEvent.Data.Object as Stripe.Checkout.Session;

                        // Send an email to the customer asking them to retry their order
                        EmailCustomerAboutFailedPayment(session);

                        break;
                }

                return Ok();
            }
            catch (StripeException e)
            {
                return BadRequest();
            }
        }

        private void FulfillOrder(Stripe.Checkout.Session session)
        {
            // TODO: fill me in
        }

        private void CreateOrder(Stripe.Checkout.Session session)
        {
            // TODO: fill me in
        }

        private void EmailCustomerAboutFailedPayment(Stripe.Checkout.Session session)
        {
            // TODO: fill me in
        }
    }
}
