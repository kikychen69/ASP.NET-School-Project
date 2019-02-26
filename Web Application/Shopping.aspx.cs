using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.Security;

namespace Team7
{
    public partial class TestForm : System.Web.UI.Page
    {
        static decimal sub = 0;
        int orderid;

        int userid;
        static List<CartItemDetail> cartItemDetails = new List<CartItemDetail>();
        public List<CartItem> sessioncart1 { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            List<CartItem> sessioncart = (List<CartItem>)Session["cartItems"];
            List<OrderDetail> OrderDetails = new List<OrderDetail>();
            sessioncart1 = sessioncart;



            //IIdentity id = User.Identity;
            //if (id.IsAuthenticated)
            //{
            //    userid = BusinessLogic.GetUserIDByUserName(id.Name).UserID;
            //}
            //else
            //{
            //    userid = 0;
            //}



            if (!IsPostBack)
            {

                foreach (CartItem c in sessioncart)
                {
                    OrderDetail od = new OrderDetail();
                    od.OrderID = 0;
                    od.BookID = c.BookID;
                    od.Quantity = c.Quantity;
                    Book b = BusinessLogic.GetBookByID(c.BookID);
                    od.Price = (1 - (decimal)b.DiscountPercent) * (decimal)b.Price;
                    OrderDetails.Add(od);
                }

                List<CartItemDetail> cartdetail = new List<CartItemDetail>();
                foreach (CartItem c in sessioncart)
                {
                    CartItemDetail cid = new CartItemDetail();
                    Book b = BusinessLogic.GetBookByID(c.BookID);
                    cid.BookID = c.BookID;
                    cid.Title = b.Title;
                    cid.Author = b.Author;
                    cid.ISBN = b.ISBN;
                    cid.Quantity = c.Quantity;
                    cid.Price = (1 - (decimal)b.DiscountPercent) * (decimal)b.Price;
                    cid.Stock = b.Stock;
                    cid.total = c.Quantity * cid.Price;
                    cartdetail.Add(cid);
                    cartItemDetails.Add(cid);
                    sub = sub + cid.total;
                }

                GridView1.DataSource = cartdetail;
                GridView1.DataBind();
                //    cartItemDetails.AddRange(cartdetail);
                //  var q = cartItemDetails.Count;

                Label7.Text = "Amount: " + sub.ToString();
            }
        }


        protected void BindGrid()
        {
            cartItemDetails.Clear();
            List<CartItem> sessioncart = (List<CartItem>)Session["cartItems"];
            sessioncart1 = sessioncart;
            List<CartItemDetail> cartdetail = new List<CartItemDetail>();
            sub = 0;
            foreach (CartItem c in sessioncart)
            {
                CartItemDetail cid = new CartItemDetail();
                Book b = BusinessLogic.GetBookByID(c.BookID);
                cid.BookID = c.BookID;
                cid.Title = b.Title;
                cid.Author = b.Author;
                cid.ISBN = b.ISBN;
                cid.Quantity = c.Quantity;
                cid.Price = (1 - (decimal)b.DiscountPercent) * (decimal)b.Price;
                cid.Stock = b.Stock;
                cid.total = c.Quantity * cid.Price;
                cartdetail.Add(cid);
                cartItemDetails.Add(cid);
                sub = sub + cid.total;
            }
            GridView1.DataSource = cartdetail;
            GridView1.DataBind();

            //   cartItemDetails.AddRange(cartdetail);
            //    var q = cartItemDetails.Count;

            Label7.Text = "Amount: " + sub.ToString();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)

        {


            GridViewRow row = GridView1.Rows[e.RowIndex];
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            List<CartItem> sessioncart = (List<CartItem>)Session["cartItems"];
            int tempquant = 0;
            int index = -1;
            foreach (CartItem c in sessioncart)
            {
                if (c.BookID == bookId)
                {
                    tempquant = c.Quantity;
                    index = sessioncart.IndexOf(c);
                }
            }
            int quantity = Convert.ToInt32((row.FindControl("TextBox2") as TextBox).Text);
            sessioncart[index] = new CartItem()
            { BookID = bookId, Quantity = quantity };
            Session["cartItems"] = sessioncart;
            GridView1.EditIndex = -1;
            BindGrid();

        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            List<CartItem> sessioncart = (List<CartItem>)Session["cartItems"];
            sessioncart.RemoveAll(x => x.BookID == bookId);
            Session["cartItems"] = sessioncart;
            List<CartItemDetail> cartdetail = new List<CartItemDetail>();
            sub = 0;
            foreach (CartItem c in sessioncart)
            {
                CartItemDetail cid = new CartItemDetail();

                Book b = BusinessLogic.GetBookByID(c.BookID);
                cid.BookID = c.BookID;
                cid.Title = b.Title;
                cid.Author = b.Author;
                cid.ISBN = b.ISBN;
                cid.Quantity = c.Quantity;
                int qnt = cid.Quantity;
                cid.Price = (1 - (decimal)b.DiscountPercent) * (decimal)b.Price;
                cid.Stock = b.Stock;
                cid.total = (qnt) * (1 - (decimal)b.DiscountPercent) * (decimal)b.Price;
                cartdetail.Add(cid);

                sub = sub + cid.total;
                Label7.Text = "Amount: " + sub.ToString();

            }
            BindGrid();

            //if (sessioncart1 == null)
            //{
            //    Label7.Text = null;
            //    // Button1.Enabled = false;
            //}
            //else
            //{
            //    GridView1.DataSource = cartdetail;

            //    GridView1.DataBind();
            //}



        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            BindGrid();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var q = cartItemDetails.Count;
            IIdentity id = User.Identity;

            //try
            //{
            //    if (id.IsAuthenticated)
            //    {
            //        userid = BusinessLogic.GetUserIDByUserName(id.Name).UserID;

            //   using (Mybooks mybooks = new Mybooks())
            //  {
            //        foreach (CartItemDetail c in cartItemDetails)
            //            {
            //                Order o = new Order();
            //                o.Username = id.Name;
            //                o.Date = DateTime.Now;
            //                mybooks.Orders.Add(o);
            //                mybooks.SaveChanges();
            //                orderid = o.OrderID;

            //                OrderDetail orderDetail = new OrderDetail();
            //                orderDetail.OrderID = orderid;
            //                orderDetail.BookID = c.BookID;
            //                orderDetail.Price = c.total;
            //                orderDetail.Quantity = c.Quantity;
            //                mybooks.OrderDetails.Add(orderDetail);
            //                mybooks.SaveChanges();

            //            }
            //        }
            //    }
            //}
            //catch (Exception)
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('PLease Login to place your Order')", true);
            //}
            //else
            //{
            //    userid = 0;
            //}

            //using (Mybooks entities = new Mybooks())
            //{
            //    foreach (CartItemDetail c in cartItemDetails)
            //    {
            //        Order o = new Order();
            //        o.UserID = userid;
            //        o.Date = DateTime.Now;
            //        entities.Orders.Add(o);
            //        entities.SaveChanges();
            //        orderid = o.OrderID;
            //    }
            //}
            using (Mybooks mybooks = new Mybooks())
            {
                foreach (CartItemDetail c in cartItemDetails)
                {
                    Order o = new Order();
                    o.Username = id.Name;
                    o.Date = DateTime.Now;
                    mybooks.Orders.Add(o);
                    mybooks.SaveChanges();
                    orderid = o.OrderID;

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderID = orderid;
                    orderDetail.BookID = c.BookID;
                    orderDetail.Price = c.total;
                    orderDetail.Quantity = c.Quantity;
                    mybooks.OrderDetails.Add(orderDetail);
                    mybooks.SaveChanges();

                }



            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            //IIdentity id = User.Identity;
            //var q = cartItemDetails.Count;
            //if (id.IsAuthenticated)
            //{
            using (Mybooks mybooks = new Mybooks())
            {
                foreach (CartItemDetail c in cartItemDetails)
                {
                    Order o = new Order();
                    o.Username = "Customer";
                    o.Date = DateTime.Now;
                    mybooks.Orders.Add(o);
                    mybooks.SaveChanges();
                    orderid = o.OrderID;

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderID = orderid;
                    orderDetail.BookID = c.BookID;
                    orderDetail.Price = c.total;
                    orderDetail.Quantity = c.Quantity;
                    mybooks.OrderDetails.Add(orderDetail);
                    mybooks.SaveChanges();

                }

            }
            Response.Redirect("confirmpage.aspx");
            //}
            //else
            //{
            //    Response.Redirect("logIn.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            //}


        }

    }

        }
    
