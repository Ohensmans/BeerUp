using FluentValidation;
using IdentityServer.ExternalApiCall.VAT;
using IdentityServer.ViewModels.Account;
using Microsoft.AspNetCore.Identity;
using Repo.Modeles.Identity;
using System;

namespace IdentityServer.Validator
{
    public class RegisterMobileValidator : AbstractValidator<RegisterMobileVIewModel>
    {
        public RegisterMobileValidator(UserManager<Utilisateur> userManager)
        {

            RuleFor(x => x.Password)
                .NotNull().WithMessage("Le mot de passe doit être rempli")
                .MinimumLength(6).WithMessage("Le mot de passe doit être composé de 6 caractères minimum")
                .Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$").WithMessage("Le mot de passe doit contenir au moins : une miniscule, une majuscule, un chiffre et un caractère spécial");

            RuleFor(x => x.ConfirmPassword)
                .NotNull().WithMessage("Le mot de passe de confirmation doit être rempli")
                .Equal(x => x.Password).WithMessage("Les 2 champs mot de passes doivent être identiques");

            RuleFor(x => x.User)
                .SetValidator(new UtilisateurValidator(userManager.Users));


        }


    }
}

