#pragma checksum "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "4cfbf0af6a29137e25830242abbd21fdaebe5ebe"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_AdministrationUsers_ListeRoles), @"mvc.1.0.view", @"/Views/AdministrationUsers/ListeRoles.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\_ViewImports.cshtml"
using IdentityServer;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\_ViewImports.cshtml"
using IdentityServer.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"4cfbf0af6a29137e25830242abbd21fdaebe5ebe", @"/Views/AdministrationUsers/ListeRoles.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_AdministrationUsers_ListeRoles : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IdentityServer.ViewModels.Administration.ListeRoleViewModel>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/site.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
  
    ViewData["Title"] = "Liste des rôles";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<div>\r\n    <br />\r\n    <br />\r\n</div>\r\n<div class=\"card\">\r\n    <div class=\"card-header\">\r\n        <h3>Liste des rôles</h3>\r\n    </div>\r\n    \r\n\r\n    ");
#nullable restore
#line 17 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
Write(Html.ValidationSummary(false, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n    ");
#nullable restore
#line 19 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
Write(Html.HiddenFor(model => model.returnUrl));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n");
#nullable restore
#line 21 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
     if (Model.lRoles.Any())
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <div>\r\n");
#nullable restore
#line 24 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
             if (User.IsInRole("Administrateur"))
            {
                

#line default
#line hidden
#nullable disable
#nullable restore
#line 26 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
           Write(Html.ActionLink("Créer un nouveau rôle", "CreateRole", "AdministrationUsers", new { returnUrl = Model.returnUrl }, new { @class = "btn btn-success" }));

#line default
#line hidden
#nullable disable
#nullable restore
#line 26 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                                                                                                                                                                       
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("            ");
#nullable restore
#line 28 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
       Write(Html.ActionLink("Retour au tableau de bord", "Index", "AdministrationUsers", new { returnUrl = Model.returnUrl }, new { @class = "btn btn-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </div>\r\n");
            WriteLiteral("        <div>\r\n            <br />\r\n        </div>\r\n");
            WriteLiteral(@"        <div class=""card"">
            <table class=""table"" id=""myTable"">

                <thead>
                    <tr>
                        <th class=""NomColonne"" id=""0"">Nom</th>
                        <th>Description</th>
                        <th class=""text-center"">Modifier</th>
");
#nullable restore
#line 43 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                         if (User.IsInRole("Administrateur"))
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <th class=\"text-center\">Supprimer</th>\r\n");
#nullable restore
#line 46 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                        }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    </tr>\r\n                </thead>\r\n                <tbody>\r\n\r\n");
#nullable restore
#line 51 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                     foreach (var role in Model.lRoles)
                    {


#line default
#line hidden
#nullable disable
            WriteLiteral("                        <tr>\r\n                            <td>");
#nullable restore
#line 55 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                           Write(Html.Label("", role.Name));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                            <td>\r\n");
#nullable restore
#line 57 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                                 if (role.Description != null)
                                {

#line default
#line hidden
#nullable disable
#nullable restore
#line 58 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                            Write(Html.Label("", role.Description));

#line default
#line hidden
#nullable disable
#nullable restore
#line 58 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                                                                  }

#line default
#line hidden
#nullable disable
            WriteLiteral("                            </td>\r\n                            <td class=\"text-center\">");
#nullable restore
#line 60 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                                               Write(Html.ActionLink("Modifier", "EditRole", "AdministrationUsers", new { id = role.Id, returnUrl = Model.returnUrl }, new { @class = "btn btn-primary" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n");
#nullable restore
#line 61 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                             if (User.IsInRole("Administrateur"))
                            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                                <td class=\"text-center\">\r\n");
#nullable restore
#line 64 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                                     using (Html.BeginForm("DeleteRole", "AdministrationUsers", new { roleId = role.Id, returnUrl = Model.returnUrl }, FormMethod.Post))
                                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                                        <span");
            BeginWriteAttribute("id", " id=\"", 2491, "\"", 2522, 2);
            WriteAttributeValue("", 2496, "confirmDeleteSpan_", 2496, 18, true);
#nullable restore
#line 66 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
WriteAttributeValue("", 2514, role.Id, 2514, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(@" style=""display:none"">
                                            <span>Etes-vous sûr de vouloir supprimer ce rôle ?</span>
                                            <button type=""submit"" class=""btn btn-danger"">Oui</button>
                                            <a href=""#"" class=""btn btn-primary""");
            BeginWriteAttribute("onclick", " onclick=\"", 2832, "\"", 2874, 4);
            WriteAttributeValue("", 2842, "confirmDelete(\'", 2842, 15, true);
#nullable restore
#line 69 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
WriteAttributeValue("", 2857, role.Id, 2857, 8, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 2865, "\',", 2865, 2, true);
            WriteAttributeValue(" ", 2867, "false)", 2868, 7, true);
            EndWriteAttribute();
            WriteLiteral(">Non</a>\r\n                                        </span>\r\n");
            WriteLiteral("                                        <span");
            BeginWriteAttribute("id", " id=\"", 2981, "\"", 3005, 2);
            WriteAttributeValue("", 2986, "deleteSpan_", 2986, 11, true);
#nullable restore
#line 72 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
WriteAttributeValue("", 2997, role.Id, 2997, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n                                            <a href=\"#\" class=\"btn btn-danger\"");
            BeginWriteAttribute("onclick", " onclick=\"", 3087, "\"", 3128, 4);
            WriteAttributeValue("", 3097, "confirmDelete(\'", 3097, 15, true);
#nullable restore
#line 73 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
WriteAttributeValue("", 3112, role.Id, 3112, 8, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 3120, "\',", 3120, 2, true);
            WriteAttributeValue(" ", 3122, "true)", 3123, 6, true);
            EndWriteAttribute();
            WriteLiteral(">Supprimer</a>\r\n                                        </span>\r\n");
#nullable restore
#line 75 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                                </td>\r\n");
#nullable restore
#line 77 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                            }

#line default
#line hidden
#nullable disable
            WriteLiteral("                            ");
#nullable restore
#line 78 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                       Write(Html.Hidden(role.Id, role.Id));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </tr>\r\n");
#nullable restore
#line 80 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                </tbody>\r\n\r\n            </table>\r\n\r\n            <div id=\"centerAll\" class=\"pagination\">\r\n                <a id=\"paginationButtonPrevious\" href=\"#\">&laquo;</a>\r\n                <a");
            BeginWriteAttribute("id", " id=\"", 3611, "\"", 3616, 0);
            EndWriteAttribute();
            WriteLiteral(" class=\"paginationButtonNum active\" href=\"#\"></a>\r\n                <a");
            BeginWriteAttribute("id", " id=\"", 3686, "\"", 3691, 0);
            EndWriteAttribute();
            WriteLiteral(" class=\"paginationButtonNum\" href=\"#\"></a>\r\n                <a");
            BeginWriteAttribute("id", " id=\"", 3754, "\"", 3759, 0);
            EndWriteAttribute();
            WriteLiteral(" class=\"paginationButtonNum\" href=\"#\"></a>\r\n                <a id=\"paginationButtonNext\" href=\"#\">&raquo;</a>\r\n                <br />\r\n            </div>\r\n            <div>\r\n                <br />\r\n            </div>\r\n        </div>\r\n");
#nullable restore
#line 97 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"



    }
    else
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <div class=\"card\">\r\n            <div class=\"card-header\">\r\n                Il n\'existe pas encore de rôles\r\n            </div>\r\n");
#nullable restore
#line 107 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
             if (User.IsInRole("Administrateur"))
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <div class=\"card-body\">\r\n                    <h5 class=\"card-title\">\r\n                        Utilisez le bouton ci-dessous pour créer un rôle\r\n                    </h5>\r\n                    ");
#nullable restore
#line 113 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
               Write(Html.ActionLink("Créer un nouveau rôle", "CreateRole", "AdministrationUsers", new { returnUrl = Model.returnUrl }, new { @class = "btn btn-success" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </div>\r\n");
#nullable restore
#line 115 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </div>\r\n");
#nullable restore
#line 117 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ListeRoles.cshtml"
    }

#line default
#line hidden
#nullable disable
            WriteLiteral("    \r\n</div>\r\n\r\n\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n            ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "4cfbf0af6a29137e25830242abbd21fdaebe5ebe17679", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n        ");
            }
            );
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IdentityServer.ViewModels.Administration.ListeRoleViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
