using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Repo.Modeles.Identity;

namespace Repo.Contexts
{
    class UserContext : IdentityDbContext<Utilisateur>
    {
        public UserContext(DbContextOptions<UserContext> options): base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Utilisateur>()
                        .Property(u => u.OrgId);

        }
    }
}
