using FluentValidation;
using IdentityServer.ExternalApiCall.VAT;
using Repo.Modeles.ModelesBeerUp;
using System;
using System.Net.Mail;
using System.Threading;
using System.Threading.Tasks;

namespace IdentityServer.Validator
{
    public class OrganisationValidator : AbstractValidator<Organisation>
    {
        private readonly IVATService vatValidator;

        public OrganisationValidator(IVATService vatValidator)
        {

            RuleFor(x => x.OrgNom)
                .NotNull().WithMessage("Le nom est obligatoire")
                .MaximumLength(200).WithMessage("Maximum 200 caractères pour le nom");

            RuleFor(x => x.OrgTva)
                .NotNull().WithMessage("Le numéro de TVA est obligatoire");
                //.MustAsync(NumTvaValide).WithMessage("Le numéro de TVA doit être valide, n'oubliez pas le code pays par exemple : BE0409.458.972").When(x => x.OrgTva !=null);

            RuleFor(x => x.OrgEmail)
                .NotNull().WithMessage("L'adresse mail professionnelle est obligatoire")
                .Must(MailEstValide).WithMessage("L'adresse mail doit être valide")
                .MaximumLength(100).WithMessage("Maximum 100 charactères pour l'adresse mail");

            RuleFor(x => x.OrgCp)
                .NotNull().WithMessage("Le code postal est obligatoire")
                .MaximumLength(50).WithMessage("Maximum 50 caractères pour le code postal");

            RuleFor(x => x.OrgVille)
                .NotNull().WithMessage("La ville est obligatoire")
                .MaximumLength(100).WithMessage("Maximum 100 caractères pour la ville");

            RuleFor(x => x.OrgPays)
                .NotNull().WithMessage("Le pays est obligatoire")
                .MaximumLength(50).WithMessage("Maximum 50 caractères pour le pays");

            RuleFor(x => x.OrgRue)
                .NotNull().WithMessage("La rue est obligatoire")
                .MaximumLength(200).WithMessage("Maximum 200 caractères pour la rue");

            RuleFor(x => x.OrgNum)
                .NotNull().WithMessage("Le numéro de boîte est obligatoire")
                .MaximumLength(50).WithMessage("Maximum 50 caractères pour le numéro de boîte");

            RuleFor(x => x.OrgWeb)
                .Matches(@"^(www).([\w]+).[\w\.//]*$").WithMessage("L'adresse url doit être valide par ex : www.youplaboom.be/index")
                .MaximumLength(100).WithMessage("Maximum 100 caractères pour le site web");

            this.vatValidator = vatValidator;
        }


        public async Task<bool> NumTvaValide(string newValue, CancellationToken token)
        {
            Models.VATResponseModele response = await vatValidator.GetVATResponse(newValue);
            return response.Valid;
        }


        public bool MailEstValide(string newValue)
        {
            try
            {
                if (newValue != null)
                {
                    MailAddress email = new MailAddress(newValue);
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

    }
}

