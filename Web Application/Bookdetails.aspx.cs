using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

namespace Team7
{
    public partial class Bookdetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Book Getbook()
        {
            string isbn = Request.QueryString["ISBN"];

            using (Mybooks entities = new Mybooks())
            {
                Book bookselected = entities.Books.Where(p => p.ISBN == isbn).First<Book>();
                //  Session["cartItems"] = bookselected;
                 return bookselected;
            }
        }

        public void AddToCartButton_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
                btn.Enabled = false;
            if (Session["cartItems"] == null)
            {
                List<CartItem> cartItems = new List<CartItem>();
                cartItems.Add(new CartItem() { BookID = Getbook().BookID, Quantity = 1 });
                Session["cartItems"] = cartItems;
            }
            else
            {
                List<CartItem> cartItems = (List<CartItem>)Session["cartItems"];
                cartItems.Add(new CartItem() { BookID = Getbook().BookID, Quantity = 1 });
                Session["cartItems"] = cartItems;

            }

            List<CartItem> cart = (List<CartItem>)Session["cartItems"];
            Label lcount = (Label)Master.FindControl("LabelCount");
            int NumCart = 0;
            foreach (CartItem c in cart)
            {
                NumCart += c.Quantity;
            }
            lcount.Text = NumCart.ToString();
        }

    }
}
