using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Repo.Modeles.Identity;
using Repo.Contexts;
using System.Reflection;
using IdentityServer4.EntityFramework.DbContexts;
using System.Linq;
using IdentityServer4.EntityFramework.Mappers;
using IdentityServer.Models;
using FluentValidation.AspNetCore;
using FluentValidation;
using IdentityServer.Validator;
using IdentityServer.ViewModels.Account;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;

namespace IdentityServer
{
    public class Startup
    {
        public IWebHostEnvironment Environment { get; }
        public IConfiguration Configuration { get; }

        public Startup(IWebHostEnvironment environment,IConfiguration configuration)
        {
            Environment = environment;
            Configuration = configuration;
        }


        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc(options => options.EnableEndpointRouting = false).AddFluentValidation();
            services.AddControllersWithViews();

            var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;

            services.AddDbContext<UserContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DbUser"), sql => sql.MigrationsAssembly(migrationsAssembly)));

            services.AddIdentity<Utilisateur, IdentityRole>()
                .AddEntityFrameworkStores<UserContext>()
                .AddDefaultTokenProviders();

            var builder = services.AddIdentityServer(options =>
            {
                options.Events.RaiseErrorEvents = true;
                options.Events.RaiseInformationEvents = true;
                options.Events.RaiseFailureEvents = true;
                options.Events.RaiseSuccessEvents = true;
            })
                .AddConfigurationStore(options =>
                {
                    options.ConfigureDbContext = b => b.UseSqlServer(Configuration.GetConnectionString("DbIdentity"), sql => sql.MigrationsAssembly(migrationsAssembly));
                })
                .AddOperationalStore(options =>
                {
                    options.ConfigureDbContext = b => b.UseSqlServer(Configuration.GetConnectionString("DbIdentity"), sql => sql.MigrationsAssembly(migrationsAssembly));
                })
                .AddAspNetIdentity<Utilisateur>();


            services.AddScoped<IUserClaimsPrincipalFactory<Utilisateur>, MyUserClaimsPrincipalFactory>();

            services.AddScoped<IValidator<Utilisateur>, UtilisateurValidator>();
            services.AddTransient<IValidator<RegisterViewModel>, RegisterValidator>();
            services.AddTransient<IValidator<LoginInputViewModel>, LoginValidator>();


            services.Configure<BaseUrl>(Configuration.GetSection("BaseUrl"));
            services.Configure<BaseKey>(Configuration.GetSection("ApiKey"));

            services.UseServicesVAT();
            services.UseServicesOrganisation();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            InitializeDatabase(app);


            app.UseStaticFiles();

            app.UseRouting();
            app.UseIdentityServer();
            app.UseAuthorization();
            app.UseMvc();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapDefaultControllerRoute();
            });
        }

        private void InitializeDatabase(IApplicationBuilder app)
        {
            using (var serviceScope = app.ApplicationServices.GetService<IServiceScopeFactory>().CreateScope())
            {
                serviceScope.ServiceProvider.GetRequiredService<PersistedGrantDbContext>().Database.Migrate();

                var context = serviceScope.ServiceProvider.GetRequiredService<ConfigurationDbContext>();
                context.Database.Migrate();


                foreach (var client in Config.Clients)
                {
                    if (!context.Clients.Any(x => x.ClientName == client.ClientName))
                        context.Clients.Add(client.ToEntity());
                }

                foreach (var resource in Config.Ids)
                {
                    if (!context.IdentityResources.Any(x => x.Name == resource.Name))
                        context.IdentityResources.Add(resource.ToEntity());
                }

                foreach (var resource in Config.Apis)
                {
                    if (!context.ApiResources.Any(x => x.Name == resource.Name))
                        context.ApiResources.Add(resource.ToEntity());
                }
                context.SaveChanges();
                
            }
        }
    }
}
