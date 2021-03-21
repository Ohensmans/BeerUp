using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.ModelesBeerUp
{
    public class Transaction
    {

        public Transaction()
        {
            AchatsVues = new HashSet<AchatsVue>();
        }

        public Guid TransId { get; set; }
        public Guid OrgId { get; set; }
        public string TransStatus { get; set; }
        public DateTime TransDate { get; set; }

        public string StripeId { get; set; }

        public virtual Organisation Orga { get; set; }

        public virtual Facture Fact { get; set; }

        public virtual ICollection<AchatsVue> AchatsVues { get; set; }

        
    }
}
