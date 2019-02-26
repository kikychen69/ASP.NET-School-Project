using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

namespace Team7
{
    public partial class SearchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LabelTitle.Text = Session["title"].ToString();
                int cat = Convert.ToInt32(Session["cat"]);
                string stitle = (string)Session["stitle"];
                string sauthor = (string)Session["sauthor"];
                string sisbn = (string)Session["sisbn"];
                List<Book> myQuery = BusinessLogic.SearchBooks(cat, stitle, sauthor, sisbn);
                ListView2.DataSource = myQuery;
                ListView2.DataBind();

            if (myQuery.Count == 0)
            {
                NoResultsLabel.Text = "Sorry There are no results matching your search parameters!";
            }
            else
            {
                NoResultsLabel.Text = "";
            }

                DropDownList1.DataSource = BusinessLogic.ListCategories();
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataValueField = "CategoryID";
                DropDownList1.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["title"] = "Search Results";
            Session["cat"] = Convert.ToInt32(DropDownList1.SelectedValue);
            Session["stitle"] = searchTitletb.Text;
            Session["sauthor"] = searchAuthortb.Text;
            Session["sisbn"] = searchISBNtb.Text;

            Response.Redirect("SearchResults.aspx");
        }


        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            var item = (ListViewItem)btn.NamingContainer;
            TextBox qt = (TextBox)item.FindControl("TextBoxQty");
            int bookid = Convert.ToInt32(btn.CommandArgument);
            int quantity = Convert.ToInt32(qt.Text);

            List<CartItem> cartItems;
            if (Session["cartItems"] == null)
            {
                cartItems = new List<CartItem>();
                AddingToCart(cartItems, bookid, quantity);
            }
            else
            {
                cartItems = (List<CartItem>)Session["cartItems"];
                AddingToCart(cartItems, bookid, quantity);
            }

            List<CartItem> cart = (List<CartItem>)Session["cartItems"];
            Label lcount = (Label)Master.FindControl("LabelCount");
            int NumCart = 0;
            foreach (CartItem c in cart)
            {
                NumCart += c.Quantity;
            }
            lcount.Text = NumCart.ToString();

            Label Added = (Label)item.FindControl("LabelAdded");
            Added.Text = "Added!";
            btn.Enabled = false;
        }
        protected void AddingToCart(List<CartItem> cartItems, int bookid, int quantity)
        {
            int tempquant=0;
            int index=-1;
            foreach (CartItem c in cartItems)
            {
                if(c.BookID == bookid)
                {
                    tempquant = c.Quantity;
                    index = cartItems.IndexOf(c);
                }
            }

            if(index != -1)
            {
                cartItems[index] = new CartItem() 
                { BookID = bookid, Quantity = tempquant + quantity };
            }
            else
            {
                cartItems.Add(new CartItem()
                {
                    BookID = bookid,
                    Quantity = quantity
                });
            }

            Session["cartItems"] = cartItems;
        }
        protected void MenuChildren_Click(object sender, EventArgs e)
        {
            SendToSearch("Children", 1);
        }

        protected void MenuNonFiction_Click(object sender, EventArgs e)
        {
            SendToSearch("Non-Fiction", 3);
        }

        protected void MenuFinance_Click(object sender, EventArgs e)
        {
            SendToSearch("Finance", 2);
        }

        protected void MenuTechnical_Click(object sender, EventArgs e)
        {
            SendToSearch("Technical", 4);
        }

        protected void SendToSearch(string title, int cat)
        {
            Session["title"] = title;
            Session["cat"] = cat;
            Session["stitle"] = "";
            Session["sauthor"] = "";
            Session["sisbn"] = "";
            Response.Redirect("SearchResults.aspx");
        }
    }
}