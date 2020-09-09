namespace Dal.Concrete.EntityFramework.Context
{
    using Entities.Models;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public  class FlutterContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseLazyLoadingProxies(true).UseSqlServer(@"Data Source=hasansahin.net\MSSQLSERVER2016;Initial Catalog=hasansa1_flutter;Integrated Security=False;User ID=hasansa1_flutter;Password=hasan123*;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"); 
            //optionsBuilder.UseLazyLoadingProxies(true).UseSqlServer("server=.;database=FlutterStore;trusted_connection=true;"); 
        }
        public FlutterContext()
        {
        }
        public FlutterContext(DbContextOptions options) : base(options)
        {
        }

        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductPhotos> ProductPhotos { get; set; }
        public virtual DbSet<PurchaseHistory> PurchaseHistory { get; set; }
        public virtual DbSet<SubCategories> SubCategories { get; set; }
        public virtual DbSet<UserFavorites> UserFavorites { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UserStars> UserStars { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Products>()
               .HasOne(p => p.Categories)
               .WithMany(b => b.Products).HasForeignKey(x => x.categoryId);


            modelBuilder.Entity<ProductPhotos>()
             .HasOne(p => p.Products)
             .WithMany(b => b.ProductPhotos).HasForeignKey(x => x.productId);

            modelBuilder.Entity<SubCategories>()
             .HasOne(p => p.Products)
             .WithMany(b => b.SubCategories).HasForeignKey(x => x.productId);
        }



    }
}
