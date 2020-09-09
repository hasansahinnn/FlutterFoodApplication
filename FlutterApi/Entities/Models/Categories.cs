using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{

    [Table("Categories")]
    public  class Categories
    {
        public Categories()
        {
            Products = new HashSet<Products>();
        }
        public int Id { get; set; }
        public string CategoryName { get; set; }
        public string photoUrl { get; set; }
        public int TotalItem { get; set; }

        public virtual ICollection<Products> Products { get; set; }

    }
}
