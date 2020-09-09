using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{
    [Table("SubCategories")]
    public class SubCategories
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string SubCategoryName { get; set; }
        public int colorType { get; set; }
        public int productId { get; set; }
        [ForeignKey("productId")]
        public virtual Products Products { get; set; }
    }
}
