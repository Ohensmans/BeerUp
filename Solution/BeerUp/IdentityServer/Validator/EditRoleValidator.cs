using FluentValidation;
using IdentityServer.ViewModels.Administration;
using Microsoft.AspNetCore.Identity;
using Repo.Modeles.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer.Validator
{
    public class EditRoleValidator : AbstractValidator<EditRoleViewModel>
    {
        private readonly List<Role> lRoles;

        public EditRoleValidator(RoleManager<Role> roleManager)
        {
            lRoles = roleManager.Roles.ToList();


            RuleFor(x => x.RoleName)
                .NotNull().WithMessage("le champ 'Nom' est obligatoire")
                .MaximumLength(250).WithMessage("Maximum 250 caractères")
                .Must(estUniqueAsync).WithMessage("Un rôle de ce nom existe déjà");

            RuleFor(x => x.RoleName)
                .MaximumLength(250).WithMessage("Maximum 250 caractères");

        }

        public bool estUniqueAsync(string newValue)
        {

            return !lRoles.Any(x => x.Name == newValue);
        }
    }
}
