<%@ Page Title="" MaintainScrollPositionOnPostback ="true" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Team7.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSheetST.css">
            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="side col-md-3" id="side">
        <div class="cats ml-4">
            <ul class="p-0">
                <li><asp:LinkButton ID="bs" href="#bestsellers" runat="server">Bestsellers</asp:LinkButton></li>
                <li><asp:LinkButton ID="ch" Onclick="MenuChildren_Click" runat="server">Children</asp:LinkButton></li>
                <li><asp:LinkButton ID="nf" Onclick="MenuNonFiction_Click" runat="server">Non-Fiction</asp:LinkButton></li>
                <li><asp:LinkButton ID="fin" Onclick="MenuFinance_Click" runat="server">Finance</asp:LinkButton></li>
                <li><asp:LinkButton ID="tech" Onclick="MenuTechnical_Click" runat="server">Technical</asp:LinkButton></li>
            </ul></div>
        <div class = "searcharea p-2">
            <div class="p-2">SEARCH FILTERS</div>
            <div class="searchbody">
            <p class="m-2">
                <asp:DropDownList Cssclass="form-control" ID="DropDownList1" runat="server" AppendDataBoundItems="True">
                    <asp:ListItem Value="0" Text="All Categories"></asp:ListItem>
                </asp:DropDownList></p>
            <p class="m-2"><span>TITLE: </span><br/>
                <asp:TextBox ID="searchTitletb"  Cssclass="form-control" runat="server"></asp:TextBox></p>
            <p class="m-2"><span>AUTHOR: </span><br/>
                <asp:TextBox ID="searchAuthortb" Cssclass="form-control" runat="server"></asp:TextBox></p>
            <p class="m-2"><span>ISBN: </span><br/>
                <asp:TextBox ID="searchISBNtb" Cssclass="form-control" runat="server"></asp:TextBox></p>
            <p class="m-2"><br/>
                <asp:Button ID="Button1" CssClass="btn btn-outline-success" runat="server" Text="Search" OnClick="Button1_Click" />
            </p>
            </div>
        </div>
    </div>

    <div class = "maincontent col-12 col-lg-9 d-flex flex-row flex-wrap my-flex-container">
        <div class="mt-2">
        <div id="carousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
                <asp:LinkButton ID="LinkButton1" Onclick="MenuNonFiction_Click" runat="server"><img class="d-block w-100" src="Images/hero2.jpg" alt="First slide"></asp:LinkButton>
            </div>
            <div class="carousel-item">
              <asp:LinkButton ID="LinkButton2" Onclick="MenuChildren_Click" runat="server"><img class="d-block w-100" src="Images/hero1.jpg" alt="Second slide"></asp:LinkButton>
            </div>
            <div class="carousel-item">
              <asp:LinkButton ID="LinkButton3" href="#bestsellers" runat="server"><img class="d-block w-100" src="Images/hero3.jpg" alt="Third slide"></asp:LinkButton>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div><!-- this is carousel div closer -->
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <a name="bestsellers" id="bestsellers"></a>
        <div class="linetitle" id =""><span class="title ">BESTSELLERS</span></div>
        
       <div class="mb-5 productlist d-flex flex-row flex-wrap my-flex-container">
        <%--<asp:Label ID="Label2" runat="server" Text="This is a Label"></asp:Label>--%><br />
        <asp:ListView ID="ListView2" runat="server" OnPagePropertiesChanged="ListView1_PagePropertiesChanged">
        <ItemTemplate>
              <div class="product-wrapper col-sm-3 p-3">
         <table>
            <tr><td class="p-3"><div class="imagewrapper">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Bookdetails.aspx?ISBN=" + Eval("ISBN") %>'><img src="/Images/<%# Eval("ISBN")%>.jpg" class="img-responsive img-fluid thumbnail detailsimage " alt="Details">
                <div class="middle"><div class="middletext">Details</div></div></asp:HyperLink></div>
                </td></tr>                
            <tr><td class="book-title"><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Bookdetails.aspx?ISBN=" + Eval("ISBN") %>'><asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title") %>'>
                            </asp:Label></asp:HyperLink></td></tr>
            <tr><td class="book-author p-1"><asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("Author") %>'>
                            </asp:Label></td></tr>
            <tr><td class="item-price"><asp:Label ID="lblPrice" CssClass='<%#Eval("IsDiscount")%>' runat="server" Text='<%#"<span>$"+Eval("Price")+"</span>&nbsp"+String.Format("{0:C}",(1-Convert.ToDouble(Eval("DiscountPercent")))*Convert.ToDouble(Eval("Price")))%>'>
            </asp:Label></td></tr>
            <tr><td class="stock p-1"><asp:Label ID="Label1" CssClass="lblstock" runat="server" Text='<%# "Only "+Eval("Stock")+" Copies Left!"%>'>
                    </asp:Label></td></tr>
            <tr><td class="form-inline">
               <span class="ml-5 mr-1"> Qty: <asp:TextBox ID="TextBoxQty" Value="1" runat="server" Width="50px" CssClass="form-control"></asp:TextBox></span><br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="lblstock ml-0 pl-0" ErrorMessage="Invalid Qty!" ControlToValidate="TextBoxQty" MinimumValue="1" MaximumValue='<%#Eval("Stock") %>' Type="Integer" ValidationGroup="qty"></asp:RangeValidator>
                </td></tr>
            <tr><td class="p-1 m-auto">
                <asp:Button ID="addtocartbtn" CssClass="btn btn-outline-primary" runat="server" Text="Add To Cart" OnClick="AddToCartButton_Click" CommandArgument='<%#Eval("BookID")%>' ValidationGroup="qty"/>
                <asp:Label ID="LabelAdded" runat="server" Text=""></asp:Label>
                </td></tr></table>
            </div>
        </ItemTemplate>
        </asp:ListView>
        </div><!-- this is Bestseller Product List div closer -->
               
        

        <div class="linetitle"><span class="title ">ALL BOOKS</span></div> <a name="all" id="all"></a>
        <div class="col-12""><asp:Label ID="NoResultsLabel" runat="server" Text=""></asp:Label></div>
                    <div class="dp"><br />
    <asp:DataPager ID="DataPager1" runat="server" PageSize="16" PagedControlID="ListView1">
           <Fields>

        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true"   ShowLastPageButton="false" ShowNextPageButton="false" PreviousPageText="Prev" ButtonCssClass="pagingbutton" />
        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="pagingbutton" ButtonType="Button" CurrentPageLabelCssClass="currentpg" PreviousPageText="..." />
        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="pagingbutton" />

   </Fields>
    </asp:DataPager></div> <!-- this is data pager div closer -->
        <div class="productlist d-flex flex-row flex-wrap my-flex-container">
        <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanged="ListView1_PagePropertiesChanged">
        <ItemTemplate>
              <div class="product-wrapper col-sm-3 p-3">
         <table>
            <tr><td class="p-3"><div class="imagewrapper">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Bookdetails.aspx?ISBN=" + Eval("ISBN") %>'><img src="/Images/<%# Eval("ISBN")%>.jpg" class="img-responsive img-fluid thumbnail detailsimage " alt="Details">
                <div class="middle"><div class="middletext">Details</div></div></asp:HyperLink></div>
                </td></tr>                
            <tr><td class="book-title"><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Bookdetails.aspx?ISBN=" + Eval("ISBN") %>'><asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title") %>'>
                            </asp:Label></asp:HyperLink></td></tr>
            <tr><td class="book-author p-1"><asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("Author") %>'>
                            </asp:Label></td></tr>
            <tr><td class="item-price"><asp:Label ID="lblPrice" CssClass='<%#Eval("IsDiscount")%>' runat="server" Text='<%#"<span>$"+Eval("Price")+"</span>&nbsp"+String.Format("{0:C}",(1-Convert.ToDouble(Eval("DiscountPercent")))*Convert.ToDouble(Eval("Price")))%>'>
            </asp:Label></td></tr>
            <tr><td class="stock p-1"><asp:Label ID="Label1" CssClass="lblstock" runat="server" Text='<%# "Only "+Eval("Stock")+" Copies Left!"%>'>
                    </asp:Label></td></tr>
            <tr><td class="form-inline">
               <span class="ml-5 mr-1"> Qty: <asp:TextBox ID="TextBoxQty" Value="1" runat="server" Width="50px" CssClass="form-control"></asp:TextBox></span><br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="lblstock ml-0 pl-0" ErrorMessage="Invalid Qty!" ControlToValidate="TextBoxQty" MinimumValue="1" MaximumValue='<%#Eval("Stock") %>' Type="Integer" ValidationGroup="qty"></asp:RangeValidator>
                </td></tr>
            <tr><td class="p-1 m-auto">
                <asp:Button ID="addtocartbtn" CssClass="btn btn-outline-primary" runat="server" Text="Add To Cart" OnClick="AddToCartButton_Click" CommandArgument='<%#Eval("BookID")%>' ValidationGroup="qty" />
                <asp:Label ID="LabelAdded" runat="server" Text=""></asp:Label>
                </td></tr></table>
            </div>
        </ItemTemplate>
        </asp:ListView>
        </div><!-- this is Product List div closer -->
      </ContentTemplate></asp:UpdatePanel>  


    </div> <!-- this is main content div closer -->

</asp:Content>
