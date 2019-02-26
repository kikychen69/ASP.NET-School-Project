

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Team7.TestForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class = "d-flex flex-row flex-wrap my-flex-container">
        <div class ="table ml-3 mt-3">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="BookID" onRowEditing="GridView1_RowEditing" 
               OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
               onrowcancelingedit="GridView1_RowCancelingEdit" AlternatingRowStyle-BorderStyle="NotSet" RowStyle-BorderColor="#EEEEEE" RowStyle-BorderStyle="Dashed" HeaderStyle-BorderColor="#EEEEEE" HeaderStyle-BorderStyle="Dashed">
            <Columns>
                <asp:TemplateField HeaderText="Image" SortExpression="BookID">
                    <ItemTemplate>
                        <img ID="Label1" src="/Images/<%# Eval("ISBN")%>.jpg" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author" SortExpression="Author">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stock" SortExpression="Stock">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Quantity") %>' Width="50px"></asp:TextBox>
                        <br /><asp:RangeValidator ID="RangeValidator1" ValidationGroup="Check" runat="server" ErrorMessage="Invalid Quantity!" ControlToValidate="TextBox2" MaximumValue='<%# Bind("Stock")%>' MinimumValue="1" Type="Integer" Font-Italic="False"></asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="total" SortExpression="total">
                    <ItemTemplate>
                        <asp:Label ID="total" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField> 
                <%--<asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-secondary" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="Check" />--%>
                <asp:TemplateField >
                        <ItemTemplate >
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text = "Edit" CssClass="btn btn-secondary" />
                        </ItemTemplate>
                         <EditItemTemplate >
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update"  Text = "Update"  CssClass="btn btn-secondary" ValidationGroup="Check" />
                         <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text = "Cancel" CssClass="btn btn-secondary"/>
                        </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField >
                    <ItemTemplate >
                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text = "Delete" CssClass="btn btn-secondary"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView></div>
    <br />
    <div class="col-12">
        <asp:Button ID="Button1" Cssclass="btn btn-danger" style="width: 200px; position:absolute; left: 80%; font-size: 1.2rem; " runat="server" Text="Confirm Order" OnClick="Button1_Click1" />
    <asp:Label ID="Label7" class="p-3" style="width: 200px; position:absolute; left: 60%; font-size: 1.2rem; border:1px #eee solid;" runat="server"  Text="Amount"></asp:Label> </div>
        </div>
</asp:Content>
