using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team7
{
    public partial class login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoggedIn(object sender, EventArgs e)
        {
            string ReturnUrl = Convert.ToString(Request.QueryString["url"]);
            if (!string.IsNullOrEmpty(ReturnUrl))
            {
                Response.Redirect(ReturnUrl);
            }
            else{ 
            Response.Redirect("Default.aspx");
            }
        }
    }
}