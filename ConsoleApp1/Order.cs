namespace ConsoleApp1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        public int OrderID { get; set; }

        public int UserID { get; set; }

        public int BookID { get; set; }

        public int Quantity { get; set; }

        public DateTime Date { get; set; }
    }
}
