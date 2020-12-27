using FluentValidation;
using IdentityServer.ViewModels.Account;


namespace IdentityServer.Validator
{
    public class LoginValidator : AbstractValidator<LoginInputViewModel>
    {
        public LoginValidator() 
        {
            RuleFor(x => x.Username)
                .NotNull().WithMessage("Un Username doit être rempli");

            RuleFor(x => x.Password)
                .NotNull().WithMessage("Un mot de passe doit être rempli");
        }

    }
}
