using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Dal.Concrete.EntityFramework.Context.Mapping
{
    public class ProductMapping : IEntityTypeConfiguration<Products>
    {
        public void Configure(Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<Products> builder)
        {
            builder.ToTable(nameof(Products), "dbo");
            builder.HasKey(o => o.Id);
            builder.Property(o => o.Id).ValueGeneratedOnAdd();

            builder.HasOne(m => m.Categories)
            .WithMany(w => w.Products)
            .HasForeignKey(f => f.categoryId);
        }
    }
}
