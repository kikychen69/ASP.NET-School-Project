using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;





namespace Team7
{
    public partial class AdminAdd : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void tbSubmit_Click1(object sender, EventArgs e)
        {
            
            string title = this.txtBookName.Text;
            int categoryID = Convert.ToInt32(this.CategoryDropdown.SelectedValue);
            string  iSBN = this.txtISBN.Text;
            string author = this.TxtAuthor.Text;
            int  stock = Convert.ToInt32(this.txtStock.Text);
            decimal price =Convert.ToDecimal( this.txtPrice.Text);
            float discountPercent =(float) Convert.ToDouble(this.txtdiscountpercent.Text);
            bool isDiscount = Convert.ToBoolean(this.txtIsDiscount.Text);
            string description = this.txtDescription.Text;
            AdminBusinesslogic.AddBook(title,categoryID, iSBN, author, stock, price, discountPercent,isDiscount, description);
            DataBind();
            Response.Write("<script language=javascript>alert('Sumbmit Successful');</script>");
        }

        protected void tbReset_Click(object sender, EventArgs e)
        {
           this.txtBookName.Text="";
           this.txtISBN.Text="";
           this.TxtAuthor.Text="";
           this.txtStock.Text="";
           this.txtPrice.Text="";
           this.txtdiscountpercent.Text="";
           this.txtIsDiscount.Text="";
           this.txtDescription.Text="";
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}