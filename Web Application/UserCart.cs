namespace Team7
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserCart")]
    public partial class UserCart
    {
        [Key]
        public int UserID { get; set; }

        public int BookID { get; set; }

        public int Quantity { get; set; }
    }
}
