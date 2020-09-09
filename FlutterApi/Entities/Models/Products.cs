using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{

    [Table("Products")]
    public  class Products
    {
        
        public int Id { get; set; }
        public string ProductName { get; set; }
        public string Subtitle { get; set; }
        public string Description { get; set; }
        public string DefaultPhoto { get; set; }
        public int TotalItem { get; set; }
        public int Stock { get; set; }
        public float Stars { get; set; }
        public float Price { get; set; }
        public int DiscountPercent { get; set; }

        [NotMapped]
        public bool IsUserFavorite { get; set; }
        [NotMapped]
        public int UserStarCount { get; set; }

        public virtual ICollection<ProductPhotos> ProductPhotos { get; set; }
        public virtual ICollection<SubCategories> SubCategories { get; set; }


        public int categoryId { get; set; }
        [ForeignKey("categoryId")]
        public virtual  Categories Categories { get; set; }
    }
}
