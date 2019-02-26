using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Team7
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        int bookID;
        protected void Page_Load(object sender, EventArgs e)
        {
            bookID = Convert.ToInt32(Request.QueryString["bookID"]);
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        private void BindGrid()
        {
            //GridView1.DataSource = AdminLoginBusinesslogic.ListBooksBy(bookID);
            GridView1.DataBind();
        }
      
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            AdminBusinesslogic.DeleteBook(bookID);
            BindGrid();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }
        protected void OnRowUpadting(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int bookID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string Title = (row.FindControl("TextBox1") as TextBox).Text;
            int CategoryID = Convert.ToInt32((row.FindControl("TextBox2") as TextBox).Text);
            string ISBN = (row.FindControl("TextBox3") as TextBox).Text;
            string Author = (row.FindControl("TextBox4") as TextBox).Text;
            int Stock = Convert.ToInt32((row.FindControl("TextBox5") as TextBox).Text);
            decimal Price = Convert.ToDecimal((row.FindControl("TextBox6") as TextBox).Text);
            float DiscountPercent =(float) Convert.ToByte((row.FindControl("TextBox7") as TextBox).Text);
            bool IsDiscount = (bool)Convert.ToBoolean((row.FindControl("TextBox8") as TextBox).Text);
            string Description = (row.FindControl("TextBox9") as TextBox).Text;
            AdminBusinesslogic.AddBook(Title, CategoryID, ISBN, Author, Stock, Price, DiscountPercent, IsDiscount,Description);
            GridView1.EditIndex = -1;
            BindGrid();        
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAdd.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSale.aspx");
        }
    }
}