#pragma checksum "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "3a5118c87e9410406ad886eda9609b1d3687c81e"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_AdministrationUsers_EditRole), @"mvc.1.0.view", @"/Views/AdministrationUsers/EditRole.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3a5118c87e9410406ad886eda9609b1d3687c81e", @"/Views/AdministrationUsers/EditRole.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_AdministrationUsers_EditRole : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IdentityServer.ViewModels.Administration.EditRoleViewModel>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("method", "post", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("mt-3"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
  
    ViewData["Title"] = "Modifier un rôle";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<h1>Modifier un rôle</h1>\r\n\r\n");
#nullable restore
#line 9 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
Write(Html.HiddenFor(model => model.returnUrl));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "3a5118c87e9410406ad886eda9609b1d3687c81e4567", async() => {
                WriteLiteral("\r\n\r\n    <div class=\"form-group row\">\r\n        ");
#nullable restore
#line 14 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
   Write(Html.Label("", "Id", new { @class = "col-sm-2 col-form-label" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        <div class=\"col-sm-10\">\r\n            ");
#nullable restore
#line 16 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
       Write(Html.TextBoxFor(model => model.Id, new { @disabled = "disabled", @class = "form-control" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        </div>\r\n    </div>\r\n\r\n    <div class=\"form-group row\">\r\n        ");
#nullable restore
#line 21 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
   Write(Html.Label("", Model.RoleName, new { @class = "col-sm-2 col-form-label" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        <div class=\"col-sm-10\">\r\n            ");
#nullable restore
#line 23 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
       Write(Html.TextBoxFor(model => model.RoleName, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        </div>\r\n        ");
#nullable restore
#line 25 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
   Write(Html.ValidationMessageFor(model => model.RoleName, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n    </div>\r\n    ");
#nullable restore
#line 27 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
Write(Html.ValidationSummary(false, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n\r\n    <div class=\"form-group row\">\r\n        <div class=\"col-sm-10\">\r\n");
#nullable restore
#line 31 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
             if (User.IsInRole("Administrateur"))
            {

#line default
#line hidden
#nullable disable
                WriteLiteral("                <button type=\"submit\" class=\"btn btn-primary\">Modifier le nom du rôle</button>\r\n");
#nullable restore
#line 34 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
            }

#line default
#line hidden
#nullable disable
                WriteLiteral("            ");
#nullable restore
#line 35 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
       Write(Html.ActionLink("Retour à la liste des rôles", "ListeRoles", "AdministrationUsers", null, new { @class = "btn btn-danger" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        </div>\r\n    </div>\r\n\r\n    <div class=\"card\">\r\n        <div class=\"card-header\">\r\n            <h3>Utilisateurs qui ont ce rôle</h3>\r\n        </div>\r\n        <div class=\"card-body\">\r\n");
#nullable restore
#line 44 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
             if (Model.Users.Any())
            {
                foreach (var user in Model.Users)
                {

#line default
#line hidden
#nullable disable
                WriteLiteral("                    <h5 class=\"card-title\">");
#nullable restore
#line 48 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
                                      Write(user);

#line default
#line hidden
#nullable disable
                WriteLiteral("</h5>\r\n");
#nullable restore
#line 49 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
                }
            }
            else
            {

#line default
#line hidden
#nullable disable
                WriteLiteral("                <h5 class=\"card-title\">Aucun utilisateur n\'a ce rôle pour le moment</h5>\r\n");
#nullable restore
#line 54 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
            }

#line default
#line hidden
#nullable disable
                WriteLiteral("        </div>\r\n        <div class=\"card-footer\">\r\n            ");
#nullable restore
#line 57 "F:\Projets GitHub\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditRole.cshtml"
       Write(Html.ActionLink("Ajouter ou suppimer des utilisateurs", "EditUsersInRole", "AdministrationUsers", new { roleId = Model.Id, returnUrl = Model.returnUrl }, new { @class = "btn btn-success", @style = "width:auto" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        </div>\r\n    </div>\r\n\r\n\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Method = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IdentityServer.ViewModels.Administration.EditRoleViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591