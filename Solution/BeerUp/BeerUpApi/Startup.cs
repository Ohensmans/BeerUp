
using BeerUpApi.ParamAccess;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Repo.Modeles.ModelesBeerUp;
using System.IO;
using System.Reflection;

namespace BeerUpApi
{
    public class Startup
    {
        readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddCors(options =>
            {
                options.AddPolicy(name: MyAllowSpecificOrigins,
                builder => builder
                .WithOrigins("http://localhost:4200", "http://192.168.179.194:5000")
                .AllowAnyHeader()
                .AllowAnyMethod()) ;
            });

            services.AddControllers();

            var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;

            services.AddDbContext<BeerUpContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DbBeerUp"), sql => sql.MigrationsAssembly(migrationsAssembly)));


            services.AddAuthentication("Bearer")
                .AddJwtBearer("Bearer", options =>
                {
                    options.Authority = "http://192.168.179.194:5000";
                    options.RequireHttpsMetadata = false;
                    //options.Audience = "ApiBeerUp";
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateAudience = false
                    };
                });

            services.AddAuthorization(options =>
            {
                options.AddPolicy("isAdmin", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur").RequireClaim("Valide", "True"));
                options.AddPolicy("hasOwnerAccess", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur", "GroupAdmin").RequireClaim("Valide", "True"));
                options.AddPolicy("hasAchatAccess", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur", "GroupAdmin", "GroupAchat").RequireClaim("Valide", "True"));
                options.AddPolicy("hasBiereAccess", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur", "GroupAdmin", "GroupBiere").RequireClaim("Valide", "True"));
                options.AddPolicy("hasEtabAccess", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur", "GroupAdmin", "GroupEtablissement").RequireClaim("Valide", "True"));
                options.AddPolicy("hasWebAccess", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur", "GroupAdmin", "GroupEtablissement", "GroupBiere", "GroupAchat").RequireClaim("Valide", "True"));
                options.AddPolicy("isRegistred", policy => policy.RequireClaim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Administrateur", "GroupAdmin", "GroupEtablissement", "GroupBiere", "GroupAchat", "User", "GroupUser"));
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "ApiBeerUp", Version = "v1" });
            });

            services.Configure<FormOptions>(o => {
                o.ValueLengthLimit = int.MaxValue;
                o.MultipartBodyLengthLimit = int.MaxValue;
                o.MemoryBufferThreshold = int.MaxValue;
            });

            services.UseServicesMap();

            services.Configure<BaseUrl>(Configuration.GetSection("BaseUrl"));
            services.Configure<BaseKey>(Configuration.GetSection("ApiKey"));
            services.Configure<BaseParam>(Configuration.GetSection("ParamsApi"));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "BeerUpApi v1"));
            }

            //to use https
            app.UseHsts();
            app.UseHttpsRedirection();

            app.UseRouting();
            

            app.UseStaticFiles();
            app.UseStaticFiles(new StaticFileOptions()
            {
                FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), @"Resources")),
                RequestPath = new PathString("/Resources")
            }) ;

            app.UseCors(MyAllowSpecificOrigins);

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
