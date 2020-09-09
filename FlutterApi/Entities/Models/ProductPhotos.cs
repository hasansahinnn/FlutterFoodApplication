using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{
    [Table("ProductPhotos")]
    public class ProductPhotos
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string photoUrl { get; set; }
        public int productId { get; set; }
        [ForeignKey("productId")]
        public virtual Products Products { get; set; }
    }
}
