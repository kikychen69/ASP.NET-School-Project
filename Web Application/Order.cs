namespace Team7
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        public int OrderID { get; set; }

        [Required]
        [StringLength(64)]
        public string Username { get; set; }

        public DateTime Date { get; set; }
    }
}
