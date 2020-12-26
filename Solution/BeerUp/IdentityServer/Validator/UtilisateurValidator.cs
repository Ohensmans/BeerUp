using FluentValidation;
using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;

namespace IdentityServer.Validator
{
    public class UtilisateurValidator : AbstractValidator<Utilisateur>
    {
        private readonly IEnumerable<Utilisateur> _Utilisateurs;

        public UtilisateurValidator(IEnumerable<Utilisateur> Utilisateurs)
        {
            _Utilisateurs = Utilisateurs;

            RuleFor(x => x.UserName)
                .NotNull().WithMessage("Le champ 'Login' est obligatoire")
                .MaximumLength(255).WithMessage("Maximum 255 caractères")
                .Must(MailEstValide).WithMessage("L'adresse mail doit être valide")
                .Must(MailEstUnique).WithMessage("Cette adresse mail est déjà utilisée");

        }

        public bool MailEstUnique(Utilisateur user, string newValue)
        {
            return _Utilisateurs.All(u => u.Equals(user) || u.Email != newValue);
        }

        public bool MailEstValide(string newValue)
        {
            try
            {
                MailAddress email = new MailAddress(newValue);
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}
