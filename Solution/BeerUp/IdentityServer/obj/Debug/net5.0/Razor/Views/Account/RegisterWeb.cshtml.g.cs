#pragma checksum "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "0718a63783ee299250f56d850e57571d6f2fd9de"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Account_RegisterWeb), @"mvc.1.0.view", @"/Views/Account/RegisterWeb.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0718a63783ee299250f56d850e57571d6f2fd9de", @"/Views/Account/RegisterWeb.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"10f39343255d883200aea98a2d0118731e125e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_Account_RegisterWeb : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IdentityServer.ViewModels.Account.RegisterViewModel>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/RegisterWeb.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
#line 2 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
  
    ViewData["Title"] = "Enregistrer un nouvel utilisateur";

#line default
#line hidden
#nullable disable
            WriteLiteral("<div>\r\n    <br />\r\n    <br />\r\n</div>\r\n<div class=\"card\">\r\n    <div class=\"card-header\">\r\n        <h3>Enregistrer un nouvel utilisateur</h3>\r\n    </div>\r\n    <div class=\"card-body\">\r\n\r\n");
#nullable restore
#line 15 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
         using (Html.BeginForm(FormMethod.Post, new { @class = "row" }))
        {
            

#line default
#line hidden
#nullable disable
#nullable restore
#line 17 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
       Write(Html.HiddenFor(model => model.ReturnUrl));

#line default
#line hidden
#nullable disable
#nullable restore
#line 19 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
             for (int i = 0; i < Model.lOrgaNom.Count; i++)
            {
                

#line default
#line hidden
#nullable disable
#nullable restore
#line 21 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
           Write(Html.HiddenFor(model => model.lOrgaNom[i]));

#line default
#line hidden
#nullable disable
#nullable restore
#line 21 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                                                           
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("            <div class=\"col-md-12\">\r\n\r\n                <fieldset>\r\n                    <legend>Informations de connexion</legend>\r\n\r\n                    <div class=\"form-group\">\r\n                        ");
#nullable restore
#line 30 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.LabelFor(model => model.User.UserName, "Adresse mail / Login", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        <br />\r\n                        ");
#nullable restore
#line 32 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.TextBoxFor(model => model.User.UserName, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        <br />\r\n                        ");
#nullable restore
#line 34 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.ValidationMessageFor(model => model.User.UserName, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                    </div>\r\n\r\n                    <div class=\"form-group\">\r\n                        ");
#nullable restore
#line 38 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.LabelFor(model => model.Password, "Mot de passe", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        <br />\r\n                        ");
#nullable restore
#line 40 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.TextBoxFor(model => model.Password, new { @class = "form-control", @type = "password" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        <br />\r\n                        ");
#nullable restore
#line 42 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.ValidationMessageFor(model => model.Password, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                    </div>\r\n\r\n                    <div class=\"form-group\">\r\n                        ");
#nullable restore
#line 46 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.LabelFor(model => model.ConfirmPassword, "Confirmation du mot de passe", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        <br />\r\n                        ");
#nullable restore
#line 48 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.TextBoxFor(model => model.ConfirmPassword, new { @class = "form-control", @type = "password" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        <br />\r\n                        ");
#nullable restore
#line 50 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                   Write(Html.ValidationMessageFor(model => model.ConfirmPassword, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
                    </div>
                </fieldset>

                <fieldset>
                    <legend>Organisation</legend>

                    <div class=""col-md-12 row"">

                        <div class=""col-md-6 form-group"">
                            ");
#nullable restore
#line 60 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.EditorFor(model => model.OrgExiste, new { @class = "form-control", id = "OrgaExist" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 61 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.OrgExiste, "Mon organisation est déjà enregistrée", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 63 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.OrgExiste, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n                        </div>\r\n\r\n                        <div class=\"col-md-6 form-group\">\r\n                            ");
#nullable restore
#line 68 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.DropDownListFor(model => model.NomOrganisation, new SelectList(Model.lOrgaNom), "Sélectionnez votre organisation", new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 70 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.NomOrganisation, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"col-md-12 form-group\">\r\n                            ");
#nullable restore
#line 74 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.EditorFor(model => model.OrgRegister, new { @class = "form-control", id = "OrgaRegister" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 75 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.OrgRegister, "Je souhaite enregistrer mon organisation et la représenter", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 77 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.OrgRegister, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                    </div>\r\n\r\n                    <div class=\"col-md-12 row\" id=\"registerOrga\">\r\n\r\n                        <div class=\"form-group col-md-6\">\r\n                            ");
#nullable restore
#line 85 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgNom, "Nom de l'Organisation", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 86 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgNom, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 88 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgNom, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-6\">\r\n                            ");
#nullable restore
#line 92 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgTva, "Numéro de TVA", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 93 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgTva, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 95 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgTva, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-8\">\r\n                            ");
#nullable restore
#line 99 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgRue, "Rue", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 100 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgRue, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 102 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgRue, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-4\">\r\n                            ");
#nullable restore
#line 106 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgNum, "Numéro", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 107 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgNum, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 109 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgNum, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-2\">\r\n                            ");
#nullable restore
#line 113 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgCp, "Code Postal", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 114 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgCp, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 116 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgCp, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-6\">\r\n                            ");
#nullable restore
#line 120 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgVille, "Ville", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 121 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgVille, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 123 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgVille, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-4\">\r\n                            ");
#nullable restore
#line 127 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgPays, "Pays", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 128 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgPays, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 130 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgPays, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-12\">\r\n                            ");
#nullable restore
#line 134 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgEmail, "Adresse email", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 135 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgEmail, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 137 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgEmail, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                        </div>\r\n\r\n                        <div class=\"form-group col-md-12\">\r\n                            ");
#nullable restore
#line 141 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.LabelFor(model => model.Organisation.OrgWeb, "Site Web", new { @class = "control-label" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            ");
#nullable restore
#line 142 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.TextBoxFor(model => model.Organisation.OrgWeb, new { @class = "form-control" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            <br />\r\n                            ");
#nullable restore
#line 144 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"
                       Write(Html.ValidationMessageFor(model => model.Organisation.OrgWeb, "", new { @class = "text-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
                        </div>


                    </div>
                </fieldset>

                <button type=""submit"" class=""btn btn-primary"" name=""button"" value=""register"">Enregistrer</button>

                <button type=""submit"" class=""btn btn-danger"" name=""button"" value=""cancel"">Retour</button>
            </div>
");
#nullable restore
#line 155 "C:\Users\ho2175\Desktop\TFE\repo\BeerUp\Solution\BeerUp\IdentityServer\Views\Account\RegisterWeb.cshtml"

        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </div>\r\n</div>\r\n\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "0718a63783ee299250f56d850e57571d6f2fd9de25129", async() => {
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IdentityServer.ViewModels.Account.RegisterViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
