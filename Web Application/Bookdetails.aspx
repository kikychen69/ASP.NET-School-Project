<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Bookdetails.aspx.cs" Inherits="Team7.Bookdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <asp:FormView ID="BookDetail" runat="server" ItemType="Team7.Book" SelectMethod="Getbook" RenderOuterTable="false">
        <ItemTemplate>
            <div class="d-flex flex-row flex-wrap my-flex-container m-5">
                <div class="col-12">
                    <h1><%#:Eval("Title") %></h1>
                </div>
                <br />
                <div class="col-12"></div>
                <table>
                    <tr>
                        <td rowspan="2">
                            <img src="/Images/<%#:Eval("ISBN")%>.jpg" style="height: 300px" alt="Images/9780060555665.jpg" />
                        </td>
                        <td style="vertical-align: top; text-align: left;" class="pl-5">
                            <b>Description:</b><br />
                            <%#:Eval("Description") %>
                            <br />
                            <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Eval("Price")) %></span>
                            <br />
                            <span><b>Stock:</b>&nbsp;<%#:Eval("Stock") %></span>
                            <br />
                            <br />
                            <b class="p-1 m-auto">
                                <asp:Button ID="addtocartbtn" CssClass="btn btn-outline-primary" runat="server" Text="Add To Cart" OnClick="AddToCartButton_Click" CommandArgument='<%#Eval("BookID")%>' ValidationGroup="qty" />
                            </b>

                        </td>
                        <td style="width: 200px"></td>
                    </tr>
                </table>
            </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    </ContentTemplate></asp:UpdatePanel>
</asp:Content>
