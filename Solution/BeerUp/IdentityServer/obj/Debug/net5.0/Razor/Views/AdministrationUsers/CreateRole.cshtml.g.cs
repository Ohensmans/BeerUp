#pragma checksum "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "3b02fb1568d3b11ae545d3f128a9d28d91e450be"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_AdministrationUsers_CreateRole), @"mvc.1.0.view", @"/Views/AdministrationUsers/CreateRole.cshtml")]
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
#line 1 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\_ViewImports.cshtml"
using IdentityServer;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\_ViewImports.cshtml"
using IdentityServer.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3b02fb1568d3b11ae545d3f128a9d28d91e450be", @"/Views/AdministrationUsers/CreateRole.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_AdministrationUsers_CreateRole : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IdentityServer.ViewModels.Administration.CreateRoleViewModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
  
    ViewData["Title"] = "Créer un nouveau rôle";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<div>\r\n    <br />\r\n    <br />\r\n</div>\r\n<div class=\"card\">\r\n    <div class=\"card-header\">\r\n        <h3>Créer un nouveau rôle</h3>\r\n    </div>\r\n    <div class=\"card-body\">\r\n\r\n");
#nullable restore
#line 16 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
         using (Html.BeginForm(FormMethod.Post))
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <div>\r\n                <div class=\"col-md-12\">\r\n                    ");
#nullable restore
#line 20 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
               Write(Html.HiddenFor(model => model.ReturnUrl));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                    ");
#nullable restore
#line 21 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
               Write(Html.ValidationSummary(false, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n                    <div class=\"form-group\">\r\n                        ");
#nullable restore
#line 24 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
                   Write(Html.LabelFor(model => model.RoleName, new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        ");
#nullable restore
#line 25 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
                   Write(Html.TextBoxFor(model => model.RoleName, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
                    </div>

                    <button style=""width:auto"" type=""submit"" name=""button"" value=""create"" class=""btn btn-primary"">Créer le rôle</button>
                    <button style=""width:auto"" type=""submit"" name=""button"" value=""back"" class=""btn btn-danger"">Retour</button>

                </div>
            </div>
");
#nullable restore
#line 33 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\AdministrationUsers\CreateRole.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </div>\r\n</div>\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IdentityServer.ViewModels.Administration.CreateRoleViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
