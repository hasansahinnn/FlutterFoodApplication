using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{
    [Table("PurchaseHistory")]
    public class PurchaseHistory
    {
        public int Id { get; set; }

        public int prdocutId { get; set; }
        [ForeignKey("prdocutId")]
        public virtual Products Products { get; set; }

        public int userId { get; set; }
        [ForeignKey("userId")]
        public virtual Users Users { get; set; }
    }
}
