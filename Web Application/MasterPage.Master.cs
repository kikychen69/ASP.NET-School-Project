using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team7
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cartItems"] == null)
            {
                LabelCount.Text = "0";
            }
            else
            {
                List<CartItem> cart = (List<CartItem>)Session["cartItems"];
                LabelCount.Text = cart.Count.ToString();
            }

            if (!Page.User.IsInRole("admin"))
            {
                menuAdmin.Visible = false;
            }
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

    protected void SearchButton_Click(object sender, EventArgs e)
        {
            Session["title"] = "Search Results";
            Session["cat"] = "-1";
            Session["stitle"] = TextBoxSearch.Text;
            Session["sauthor"] = TextBoxSearch.Text;
            Session["sisbn"] = TextBoxSearch.Text;

            Response.Redirect("SearchResults.aspx");
        }
    }
}