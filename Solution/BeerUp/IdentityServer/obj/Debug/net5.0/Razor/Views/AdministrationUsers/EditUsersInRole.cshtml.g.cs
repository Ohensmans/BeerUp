#pragma checksum "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "1947e4603862b55977c16f957d1fa6badb74fe79"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_AdministrationUsers_EditUsersInRole), @"mvc.1.0.view", @"/Views/AdministrationUsers/EditUsersInRole.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1947e4603862b55977c16f957d1fa6badb74fe79", @"/Views/AdministrationUsers/EditUsersInRole.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_AdministrationUsers_EditUsersInRole : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<IdentityServer.ViewModels.Administration.UserRoleViewModel>>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("method", "post", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
#nullable restore
#line 2 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
  
    var roleId = ViewBag.roleId;
    var returnUrl = ViewBag.returnUrl;
    var roleName = ViewBag.roleName;
    ViewData["Title"] = "Modifier les utilisateurs ayant un rôle";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<div>\r\n    <br />\r\n    <br />\r\n</div>\r\n<div class=\"card\">\r\n    <div class=\"card-header\">\r\n        <h5>Rajouter ou supprimer des utilisateurs au rôle : ");
#nullable restore
#line 15 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                                                        Write(roleName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h5>\r\n    </div>\r\n\r\n        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "1947e4603862b55977c16f957d1fa6badb74fe794659", async() => {
                WriteLiteral("\r\n                <div class=\"card-body\">\r\n");
#nullable restore
#line 20 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                     for (int i = 0; i < Model.Count; i++)
                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                        <div class=\"form-check m-1\">\r\n                            ");
#nullable restore
#line 23 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                       Write(Html.HiddenFor(model => model[i].UserId));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            ");
#nullable restore
#line 24 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                       Write(Html.HiddenFor(model => model[i].UserName));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            ");
#nullable restore
#line 25 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                       Write(Html.EditorFor(model => model[i].isSelected));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            ");
#nullable restore
#line 26 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                       Write(Html.Label("", Model[i].UserName));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                        </div>\r\n");
#nullable restore
#line 28 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
                    }

#line default
#line hidden
#nullable disable
                WriteLiteral("                </div>\r\n                <div class=\"card-footer\">\r\n                    <input type=\"submit\" value=\"Mettre à jour\" class=\"btn btn-primary\" style=\"width:auto\" />\r\n                    ");
#nullable restore
#line 32 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\EditUsersInRole.cshtml"
               Write(Html.ActionLink("Retour", "EditRole", "AdministrationUsers", new { id = roleId, ReturnUrl = returnUrl }, new { @class = "btn btn-danger" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                </div>\r\n            \r\n        ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Method = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n    </div>\r\n\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<IdentityServer.ViewModels.Administration.UserRoleViewModel>> Html { get; private set; }
    }
}
#pragma warning restore 1591
