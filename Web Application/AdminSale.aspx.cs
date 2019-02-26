using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Team7
{
   
    public partial class AdminSale : System.Web.UI.Page
    {
       
            int categoryID;
        
            protected void Page_Load(object sender, EventArgs e)
            {
                //categoryID = Convert.ToInt32(Request.QueryString["categoryID"]);
                //if (!IsPostBack)
                //{
                //    BindGrid();
                //}

            }
            //private void BindGrid()
            //{

               
            //    GridView2.DataBind();
            //}
   

        //protected void SearchBtn_Click(object sender, EventArgs e)
        //{
        //    List<Book> b = new List<Book>();
        //    int n = Convert.ToInt32(CatDropDownList.SelectedValue);

        //    using (Mybooks entities = new Mybooks())
        //    {
        //         b = entities.Books.Where(x=>x.CategoryID == n).ToList<Book>();
        //    }

        //    GridView2.DataSourceID = null;
        //    GridView2.DataSource = b;        
        //    GridView2.DataBind();           
        //    GridView2.Visible = true;
        //    //DropDownList1.Items.FindByValue(categoryID.ToString()).Selected = true;
        //    for (int i = 0; i < GridView2.Rows.Count; i++)
        //    {
        //        GridView2.EditIndex = i;
               
        //    }
            
        //    BindGrid();
 
        //}
        //protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    this.GridView2.EditIndex = e.NewEditIndex;
        //    BindGrid();
        //}
        //protected void OnRowCancelingEdit(object sender, EventArgs e)
        //{
        //    GridView2.EditIndex = -1;
        //    BindGrid();
        //}
        //protected void OnRowUpadting(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = GridView2.Rows[e.RowIndex];
        //    int bookID = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Values[0]);
        //    int CategoryID = Convert.ToInt32((row.FindControl("TextBox2") as TextBox).Text);
        //    float DiscountPercent =(float) Convert.ToDouble((row.FindControl("TextBox7") as TextBox).Text);
        //    bool IsDiscount =Convert.ToBoolean((row.FindControl("TextBox8") as TextBox).Text);
        //    AdminBusinesslogic.AddCategory( bookID,CategoryID, DiscountPercent, IsDiscount);
        //    GridView2.EditIndex = -1;
        //    BindGrid();

        //}

        //protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string selectedIndex = GridView2.SelectedIndex.ToString();

        //}

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            int categoryID = Convert.ToInt32(this.CatDropDownList.SelectedValue);
            float discountPercent = (float)Convert.ToDouble(this.TxtDiscount.Text);
            AdminBusinesslogic.ListCategoryBy(categoryID);
            AdminBusinesslogic.SaleBook(categoryID,discountPercent);
            

            //AdminBusinesslogic.SaleBook(categoryID, price, discountPercent, isDiscount);
            DataBind();
            Response.Write("<script language=javascript>alert('Sumbmit Successful');</script>");
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            this.TxtDiscount.Text = "";
        }
    }
}