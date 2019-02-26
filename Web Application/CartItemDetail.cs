using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Team7
{
    public class CartItemDetail
    {

        public int BookID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string ISBN { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal Stock { get; set; }
        public decimal total { get; set; } // new add
        public  decimal grandtotal { get; set; }
    }
}