using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dal.Abstract;
using Dal.AbstractInterfaces;
using Dal.Concrete.EntityFramework.Repository;
using Interfaces;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SiparisTakip.Bll;

namespace FlutterApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.TryAddScoped<IProductService, ProductManager>();
            services.TryAddScoped<IProductRepository, EfProductRepository>();
            services.TryAddScoped<ICategoriesService, CategoryManager>();
            services.TryAddScoped<ICategoriesRepository, EfCategoriesRepository>();
            services.TryAddScoped<IUserService, UserManager>();
            services.TryAddScoped<IUserRepository, EfUserRepository>();
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().AllowCredentials().Build());
            });
            services.AddControllers().AddJsonOptions(option => { option.JsonSerializerOptions.PropertyNamingPolicy = null; option.JsonSerializerOptions.MaxDepth = 256; });
            string dbConnString = Configuration.GetConnectionString("DevConnection");

            //  services.AddDbContext<Dal.Concrete.EntityFramework.Context.FlutterContext>(options => options.UseLazyLoadingProxies().UseSqlServer(dbConnString));

            services.AddControllers().AddNewtonsoftJson(o =>
            {
                o.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            JsonConvert.DefaultSettings = () => new JsonSerializerSettings
            {
                Formatting = Newtonsoft.Json.Formatting.Indented,
                ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
            };

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
