using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerUpApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionsController : ControllerBase
    {
        private readonly BeerUpContext _context;

        public TransactionsController(BeerUpContext context)
        {
            _context = context;
        }


        // GET: api/Transactions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Transaction>> GetTransaction(Guid id)
        {
            var transaction = await _context.Transactions.FindAsync(id);

            if (transaction == null)
            {
                return NotFound();
            }

            return transaction;
        }

        // POST: api/Transactions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Transaction>> PostTransaction(Transaction transaction)
        {
            _context.Transactions.Add(transaction);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTransaction", new { id = transaction.TransId }, transaction);
        }
    }
}
