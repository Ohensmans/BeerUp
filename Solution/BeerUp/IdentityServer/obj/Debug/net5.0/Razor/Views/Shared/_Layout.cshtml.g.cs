#pragma checksum "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "18206f894ef7f20e2385ca635a1708b579e22baf"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared__Layout), @"mvc.1.0.view", @"/Views/Shared/_Layout.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"18206f894ef7f20e2385ca635a1708b579e22baf", @"/Views/Shared/_Layout.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared__Layout : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/lib/bootstrap/dist/css/bootstrap.min.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/site.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/toastr.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_4 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/img/hops.jpg"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_5 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("style", new global::Microsoft.AspNetCore.Html.HtmlString(@"
            position: absolute;
            left: 0;
            right: 0;
            margin: -2px;
            margin-top: -4px;
            width: 100%;
            height: 200px;
            object-fit: cover;
            vertical-align: top;"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_6 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("navbar-brand"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_7 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("style", new global::Microsoft.AspNetCore.Html.HtmlString("color:#9fe855"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_8 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-area", "", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_9 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-controller", "Home", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_10 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Back", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_11 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("text-white"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_12 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Contact", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_13 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/lib/jquery/dist/jquery.min.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_14 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/lib/bootstrap/dist/js/bootstrap.bundle.min.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("<!DOCTYPE html>\r\n<html lang=\"en\">\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "18206f894ef7f20e2385ca635a1708b579e22baf9024", async() => {
                WriteLiteral("\r\n    <meta charset=\"utf-8\" />\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n    <title>");
#nullable restore
#line 6 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
      Write(ViewData["Title"]);

#line default
#line hidden
#nullable disable
                WriteLiteral(" - BeerUp IdentityServer</title>\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "18206f894ef7f20e2385ca635a1708b579e22baf9702", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "18206f894ef7f20e2385ca635a1708b579e22baf10880", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "18206f894ef7f20e2385ca635a1708b579e22baf12059", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
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
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "18206f894ef7f20e2385ca635a1708b579e22baf13942", async() => {
                WriteLiteral("\r\n    <header>\r\n        ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "18206f894ef7f20e2385ca635a1708b579e22baf14225", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_4);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_5);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral(@"
        <nav class=""navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark border-bottom box-shadow mb-3"">
            <div class=""container"">
                <button class=""navbar-toggler"" type=""button"" data-toggle=""collapse"" data-target="".navbar-collapse"" aria-controls=""navbarSupportedContent""
                        aria-expanded=""false"" aria-label=""Toggle navigation"">
                    <span class=""navbar-toggler-icon""></span>
                </button>
                <div class=""navbar-collapse collapse d-sm-inline-flex justify-content-between"">
                    <ul class=""navbar-nav flex-grow-1"">
                        <li class=""nav-item"">
                            ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "18206f894ef7f20e2385ca635a1708b579e22baf16133", async() => {
                    WriteLiteral("BeerUp");
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_6);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_7);
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Area = (string)__tagHelperAttribute_8.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_8);
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_9.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_9);
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_10.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_10);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n                        </li>\r\n\r\n");
#nullable restore
#line 35 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                         if (User?.Identity != null && User.Identity.IsAuthenticated && (User.IsInRole("Administrateur") || User.IsInRole("GroupAdmin") || User.IsInRole("GroupAchat")))
                        {

#line default
#line hidden
#nullable disable
                WriteLiteral(@"                            <li class=""nav-item dropdown"">
                                <a class=""nav-link text-light dropdown-toggle "" href=""#"" id=""navbarDropdownAchat"" role=""button"" data-toggle=""dropdown"" aria-haspopup=""true"" aria-expanded=""false"">
                                    Achats
                                </a>
                                <div class=""dropdown-menu"" aria-labelledby=""navbarDropdownAchat"">
                                    ");
#nullable restore
#line 42 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                               Write(Html.ActionLink("Vues bières", "VuesBiere", "Home", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                    ");
#nullable restore
#line 43 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                               Write(Html.ActionLink("Vues établissement", "VuesEtablissement", "Home", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                    ");
#nullable restore
#line 44 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                               Write(Html.ActionLink("Achat de nouvelles vues", "AchatVues", "Home", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                    ");
#nullable restore
#line 45 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                               Write(Html.ActionLink("Factures", "Factures", "Home", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n\r\n                                </div>\r\n                            </li>\r\n");
#nullable restore
#line 49 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                        }

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n");
#nullable restore
#line 51 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                         if (User?.Identity != null && User.Identity.IsAuthenticated && (User.IsInRole("Administrateur") || User.IsInRole("GroupAdmin")))
                        {

#line default
#line hidden
#nullable disable
                WriteLiteral(@"                            <li class=""nav-item dropdown"">
                                <a class=""nav-link text-light dropdown-toggle "" href=""#"" id=""navbarDropdownAdmin"" role=""button"" data-toggle=""dropdown"" aria-haspopup=""true"" aria-expanded=""false"">
                                    Administration
                                </a>
                                <ul class=""dropdown-menu"" aria-labelledby=""navbarDropdownAdmin"">
");
#nullable restore
#line 58 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                                     if (User.IsInRole("Administrateur"))
                                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                                        <li class=\"nav-item\">\r\n                                            \r\n                                             ");
#nullable restore
#line 62 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                                        Write(Html.ActionLink("Tarifs bières", "TarifsBiere", "Home", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                             ");
#nullable restore
#line 63 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                                        Write(Html.ActionLink("Tarifs établissements", "TarifsEtab", "Home", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                            \r\n                                        </li>\r\n");
#nullable restore
#line 66 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                                    }

#line default
#line hidden
#nullable disable
                WriteLiteral("                                    <li>\r\n                                        ");
#nullable restore
#line 68 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                                   Write(Html.ActionLink("Utilisateurs", "Index", "AdministrationUsers", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                    </li>\r\n                                </ul>\r\n                            </li>\r\n");
#nullable restore
#line 72 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                        }

#line default
#line hidden
#nullable disable
#nullable restore
#line 73 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                         if (User?.Identity != null && User.Identity.IsAuthenticated && (User.IsInRole("Administrateur") || User.IsInRole("GroupAdmin") || User.IsInRole("GroupBiere")))
                        {

#line default
#line hidden
#nullable disable
                WriteLiteral("                            <li class=\"nav-item\">\r\n                                ");
#nullable restore
#line 76 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                           Write(Html.ActionLink("Bières", "Bieres", "Home", null, new { @class = "nav-link text-light" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </li>\r\n");
#nullable restore
#line 78 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                        }

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n");
#nullable restore
#line 80 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                         if (User?.Identity != null && User.Identity.IsAuthenticated && (User.IsInRole("Administrateur") || User.IsInRole("GroupAdmin") || User.IsInRole("GroupEtablissement")))
                        {

#line default
#line hidden
#nullable disable
                WriteLiteral("                            <li class=\"nav-item\">\r\n                                ");
#nullable restore
#line 83 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                           Write(Html.ActionLink("Etablissements", "Etablissements", "Home", null, new { @class = "nav-link text-light" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </li>\r\n");
#nullable restore
#line 85 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                        }

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n\r\n");
#nullable restore
#line 88 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                         if (User?.Identity != null && User.Identity.IsAuthenticated)
                        {

#line default
#line hidden
#nullable disable
                WriteLiteral(@"                            <li class=""nav-item dropdown ml-auto"">
                                <a class=""nav-link dropdown-toggle "" href=""#"" id=""navbarDropdown"" role=""button"" data-toggle=""dropdown"" aria-haspopup=""true"" aria-expanded=""false"">
                                    ");
#nullable restore
#line 92 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                               Write(User.Claims.FirstOrDefault(x => x.Type.ToString().Equals("name")).Value);

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                </a>\r\n                                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n                                    ");
#nullable restore
#line 95 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                               Write(Html.ActionLink("Se déconnecter", "logout", "account", null, new { @class = "dropdown-item" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                                </div>\r\n                            </li>\r\n");
#nullable restore
#line 98 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
                WriteLiteral("                            <li class=\"nav-item ml-auto\">\r\n                                ");
#nullable restore
#line 102 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                           Write(Html.ActionLink("S'identifier", "login", "account", null, new { @class = "nav-link text-light" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </li>\r\n                            <li class=\"nav-item \">\r\n                                ");
#nullable restore
#line 105 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                           Write(Html.ActionLink("S'enregistrer", "registerweb", "account", null, new { @class = "nav-link text-light" }));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </li>\r\n");
#nullable restore
#line 107 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
                        }

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </nav>\r\n    </header>\r\n    <div class=\"container\">\r\n        <main role=\"main\" class=\"pb-3\">\r\n            ");
#nullable restore
#line 116 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
       Write(RenderBody());

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        </main>\r\n    </div>\r\n\r\n    <footer class=\"border-top footer bg-dark text-muted\">\r\n        <div class=\"container text-white\">\r\n            &copy; 2021 - BeerUp - ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "18206f894ef7f20e2385ca635a1708b579e22baf30183", async() => {
                    WriteLiteral("Contact");
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Area = (string)__tagHelperAttribute_8.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_8);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_11);
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Controller = (string)__tagHelperAttribute_9.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_9);
                __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_12.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_12);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n        </div>\r\n    </footer>\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "18206f894ef7f20e2385ca635a1708b579e22baf31955", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_13);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "18206f894ef7f20e2385ca635a1708b579e22baf33056", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_14);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n    ");
#nullable restore
#line 127 "C:\Users\Olivier\Desktop\Projets Git\BeerUp\Solution\BeerUp\IdentityServer\Views\Shared\_Layout.cshtml"
Write(await RenderSectionAsync("Scripts", required: false));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n</html>\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
