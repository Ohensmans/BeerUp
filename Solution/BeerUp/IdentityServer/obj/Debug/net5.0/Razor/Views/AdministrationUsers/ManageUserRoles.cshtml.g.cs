#pragma checksum "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "4ce85937558b7e623d3d2fd5112a20e516bb0414"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_AdministrationUsers_ManageUserRoles), @"mvc.1.0.view", @"/Views/AdministrationUsers/ManageUserRoles.cshtml")]
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
#line 1 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\_ViewImports.cshtml"
using IdentityServer;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\_ViewImports.cshtml"
using IdentityServer.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"4ce85937558b7e623d3d2fd5112a20e516bb0414", @"/Views/AdministrationUsers/ManageUserRoles.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_AdministrationUsers_ManageUserRoles : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IdentityServer.ViewModels.Administration.ManageRolesUserViewModel>
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
#nullable restore
#line 2 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
  
    ViewData["Title"] = "Gérer les rôles de l'utilisateur";
    var userId = ViewBag.userId;
    var returnUrl = ViewBag.returnUrl;

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n\r\n");
#nullable restore
#line 10 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
 using (Html.BeginForm(FormMethod.Post))
{

#line default
#line hidden
#nullable disable
            WriteLiteral("    <div class=\"card\">\r\n        <div class=\"card-header\">\r\n            <h2>Gérer les rôles de l\'utilisateur</h2>\r\n        </div>\r\n        <div class=\"card-body\">\r\n\r\n            ");
#nullable restore
#line 18 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
       Write(Html.ValidationSummary(false, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            ");
#nullable restore
#line 19 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
       Write(Html.HiddenFor(model => model.userId));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"

            <table class=""table table-striped"" id=""myTable"">
                <thead>
                    <tr>
                        <th class=""text-center"">Attribuer le rôle</th>
                        <th class=""NomColonne"" id=""0"">Nom du rôle</th>
                        <th>Description</th>
                        <th class=""NomColonne text-center"" id=""1"">Accès complet</th>
                        <th class=""NomColonne text-center"" id=""2"">Accès partiel</th>
                        <th class=""text-center"">Modifier l'accès de l'utilisateur</th>
                    </tr>
                </thead>
                <tbody>


");
#nullable restore
#line 35 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                     for (int i = 0; i < Model.lRoles.Count; i++)
                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <tr>\r\n                            <td class=\"text-center\">");
#nullable restore
#line 38 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                               Write(Html.EditorFor(model => model.lRoles[i].isSelected));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                            <td>");
#nullable restore
#line 39 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.Label("", Model.lRoles[i].RoleName));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                            <td>");
#nullable restore
#line 40 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                 if (Model.lRoles[i].RoleDescription != null)
                                { 

#line default
#line hidden
#nullable disable
#nullable restore
#line 41 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                             Write(Html.Label("",Model.lRoles[i].RoleDescription));

#line default
#line hidden
#nullable disable
#nullable restore
#line 41 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                                                                 }

#line default
#line hidden
#nullable disable
            WriteLiteral("                            </td>\r\n                            <td class=\"text-center\">");
#nullable restore
#line 43 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                               Write(Html.DisplayFor(model => model.lRoles[i].isFullAcces));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                            <td class=\"text-center\">");
#nullable restore
#line 44 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                               Write(Html.DisplayFor(model => model.lRoles[i].isPartialAccess));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                            <td class=\"text-center\">\r\n");
#nullable restore
#line 46 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                 if (Model.lRoles[i].isEditable && Model.lRoles[i].isSelected)
                                {
                                    

#line default
#line hidden
#nullable disable
#nullable restore
#line 48 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                               Write(Html.ActionLink("Modifier", "EditScopeRole", "AdministrationUsers", new { userId = Model.userId, roleId = Model.lRoles[i].RoleId }, new { @class = "btn btn-primary" }));

#line default
#line hidden
#nullable disable
#nullable restore
#line 48 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                                                                                                                                                                                                            
                                }

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                                ");
#nullable restore
#line 51 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.HiddenFor(model => model.lRoles[i].RoleId));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                                ");
#nullable restore
#line 52 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.HiddenFor(model => model.lRoles[i].RoleName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                                ");
#nullable restore
#line 53 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.HiddenFor(model => model.lRoles[i].RoleDescription));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                                ");
#nullable restore
#line 54 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.HiddenFor(model => model.lRoles[i].isPartialAccess));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                                ");
#nullable restore
#line 55 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.HiddenFor(model => model.lRoles[i].isFullAcces));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                                ");
#nullable restore
#line 56 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                           Write(Html.HiddenFor(model => model.lRoles[i].isEditable));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n                            </td>\r\n                        </tr>\r\n");
#nullable restore
#line 60 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"

                </tbody>
            </table>
        </div>

        <div class=""card-footer"">
            <button style=""width:auto"" type=""submit"" name=""button"" value=""update"" class=""btn btn-success"">Mettre à jour l'utilisateur</button>
            ");
#nullable restore
#line 69 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"
       Write(Html.ActionLink("Retour à la liste des utilisateurs", "ListeUsers", "AdministrationUsers", new { userId = userId, returnUrl = returnUrl }, new { @class = "btn btn-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </div>\r\n    </div>\r\n");
#nullable restore
#line 72 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\ManageUserRoles.cshtml"

}

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "4ce85937558b7e623d3d2fd5112a20e516bb041413143", async() => {
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
                WriteLiteral("\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IdentityServer.ViewModels.Administration.ManageRolesUserViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
