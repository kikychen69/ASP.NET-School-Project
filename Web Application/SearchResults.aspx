<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback ="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="Team7.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="StyleSheetST.css">
          
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="side col-md-3" id="side">
        <div class="cats ml-4">
            <ul class="p-0">
                <li><asp:LinkButton ID="bs" href="Default.aspx#bestsellers" runat="server">Bestsellers</asp:LinkButton></li>
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
            <div class="linetitle"><span class="title ">
                <asp:Label ID="LabelTitle" runat="server" Text="Label"></asp:Label></span></div>
        <div class="productlist d-flex flex-row flex-wrap my-flex-container">
            <div class="col-12"><asp:Label ID="NoResultsLabel" runat="server" Text=""></asp:Label></div>
        <asp:ListView ID="ListView2" runat="server">
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
        
            <div class="dp mb-5"><br />
    <asp:DataPager ID="DataPager1" runat="server" PageSize="20" PagedControlID="ListView2">
           <Fields>

        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true"   ShowLastPageButton="false" ShowNextPageButton="false" PreviousPageText="Prev" ButtonCssClass="pagingbutton" />
        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="pagingbutton" ButtonType="Button" CurrentPageLabelCssClass="currentpg" PreviousPageText="..." />
        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="pagingbutton" />

   </Fields>
    </asp:DataPager></div> <!-- this is data pager div closer -->

    </div> <!-- this is main content div closer -->

 <!-- Cart Modal -->
<div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLabel">Added to Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table>
            <tr><td rowspan="2">
                <asp:Image ID="modalimg1" runat="server" /></td></tr>
            <tr><td>
                <asp:Label ID="modallbl1" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="modallbl2" runat="server" Text="Label"></asp:Label></td></tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Continue Browsing</button>
        <button type="button" class="btn btn-primary">Go to Cart</button>
      </div>
    </div>
  </div>
</div>

</asp:Content>
