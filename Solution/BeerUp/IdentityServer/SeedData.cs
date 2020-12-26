using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Repo.Contexts;
using Repo.Modeles.Identity;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer
{
    public class SeedData
    {
        public static void EnsureSeedData(string connectionString)
        {
            var services = new ServiceCollection();
            services.AddLogging();
            services.AddDbContext<UserContext>(options =>
               options.UseSqlServer(connectionString));

            services.AddIdentity<Utilisateur, IdentityRole>()
                .AddEntityFrameworkStores<UserContext>()
                .AddDefaultTokenProviders();

            using (var serviceProvider = services.BuildServiceProvider())
            {
                using (var scope = serviceProvider.GetRequiredService<IServiceScopeFactory>().CreateScope())
                {
                    var context = scope.ServiceProvider.GetService<UserContext>();
                    context.Database.Migrate();

                    var roleMgr = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
                    var admin = roleMgr.FindByNameAsync("Administrateur").Result;
                    if (admin == null)
                    {
                        admin = new IdentityRole
                        {
                            Name = "Administrateur"
                        };
                        var result = roleMgr.CreateAsync(admin).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("admin created");
                    }
                    else
                    {
                        Log.Debug("admin already exists");
                    }

                    var GroupAdmin = roleMgr.FindByNameAsync("GroupAdmin").Result;
                    if (GroupAdmin == null)
                    {
                        GroupAdmin = new IdentityRole
                        {
                            Name = "GroupAdmin"
                        };
                        var result = roleMgr.CreateAsync(GroupAdmin).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("GroupAdmin created");
                    }
                    else
                    {
                        Log.Debug("GroupAdmin already exists");
                    }

                    var User = roleMgr.FindByNameAsync("User").Result;
                    if (User == null)
                    {
                        User = new IdentityRole
                        {
                            Name = "User"
                        };
                        var result = roleMgr.CreateAsync(User).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("User created");
                    }
                    else
                    {
                        Log.Debug("User already exists");
                    }

                    var GroupBiere = roleMgr.FindByNameAsync("GroupBiere").Result;
                    if (GroupBiere == null)
                    {
                        GroupBiere = new IdentityRole
                        {
                            Name = "GroupBiere"
                        };
                        var result = roleMgr.CreateAsync(GroupBiere).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("GroupBiere created");
                    }
                    else
                    {
                        Log.Debug("GroupBiere already exists");
                    }

                    var GroupAchat = roleMgr.FindByNameAsync("GroupAchat").Result;
                    if (GroupAchat == null)
                    {
                        GroupAchat = new IdentityRole
                        {
                            Name = "GroupAchat"
                        };
                        var result = roleMgr.CreateAsync(GroupAchat).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("GroupAchat created");
                    }
                    else
                    {
                        Log.Debug("GroupAchat already exists");
                    }

                    var GroupEtablissement = roleMgr.FindByNameAsync("GroupEtablissement").Result;
                    if (GroupEtablissement == null)
                    {
                        GroupEtablissement = new IdentityRole
                        {
                            Name = "GroupEtablissement"
                        };
                        var result = roleMgr.CreateAsync(GroupEtablissement).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("GroupEtablissement created");
                    }
                    else
                    {
                        Log.Debug("GroupEtablissement already exists");
                    }

                    var GroupUser = roleMgr.FindByNameAsync("GroupUser").Result;
                    if (GroupUser == null)
                    {
                        GroupUser = new IdentityRole
                        {
                            Name = "GroupUser"
                        };
                        var result = roleMgr.CreateAsync(GroupUser).Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("GroupUser created");
                    }
                    else
                    {
                        Log.Debug("GroupUser already exists");
                    }


                    var userMgr = scope.ServiceProvider.GetRequiredService<UserManager<Utilisateur>>();
                    var alice = userMgr.FindByNameAsync("alice@merveille.be").Result;
                    if (alice == null)
                    {
                        alice = new Utilisateur
                        {
                            UserName = "alice@merveille.be",
                        };
                        var result = userMgr.CreateAsync(alice, "Ephec*1234").Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("alice created");
                    }
                    else
                    {
                        Log.Debug("alice already exists");
                    }

                    var robinson = userMgr.FindByNameAsync("robinson@crusoe.be").Result;
                    if (robinson == null)
                    {
                        robinson = new Utilisateur
                        {
                            UserName = "robinson@crusoe.be",
                        };
                        var result = userMgr.CreateAsync(robinson, "Ephec*1234").Result;
                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }

                        if (!result.Succeeded)
                        {
                            throw new Exception(result.Errors.First().Description);
                        }
                        Log.Debug("robinson created");
                    }
                    else
                    {
                        Log.Debug("robinson already exists");
                    }
                }
            }

        }
    }
}
