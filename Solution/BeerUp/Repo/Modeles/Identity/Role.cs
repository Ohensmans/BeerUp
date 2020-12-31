using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Repo.Modeles.Identity
{
    public class Role : IdentityRole
    {
        public bool isEditable { set; get; }

        public string? Description { get; set; } 
    }
}
