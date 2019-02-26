<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Team7.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" BackColor="#FFFFCC" ForeColor="#0099FF" OnClick="Button1_Click" Text="ADD NEW " Height="55px" Width="284px" BorderStyle="Solid" />
    <asp:Button ID="Button2" runat="server" BackColor="#FFFFCC" ForeColor="#0099FF" Text="SALE INFO" Height="55px" Width="284px" BorderStyle="Solid" OnClick="Button2_Click" /><br/><br/>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1069px" 
            OnRowDeleting="OnRowDeleting" 
            OnRowEditing="OnRowEditing" 
            OnRowCancelingEdit="OnRowCancelingEdit"
            OnRowUpadting="OnRowUpdating"
            
        DataKeyNames="BookID" DataSourceID="SqlDataSource1" Height="300px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
       <AlternatingRowStyle BackColor="White" />
       <Columns>
                <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="DiscountPercent" HeaderText="DiscountPercent" SortExpression="DiscountPercent" />
                <asp:CheckBoxField DataField="IsDiscount" HeaderText="IsDiscount" SortExpression="IsDiscount" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" ReadOnly="True" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
           
            </Columns>
        <FooterStyle BackColor="#CCCC99" />
       <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
       <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
       <RowStyle BackColor="#F7F7DE" />
       <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
       <SortedAscendingCellStyle BackColor="#FBFBF2" />
       <SortedAscendingHeaderStyle BackColor="#848384" />
       <SortedDescendingCellStyle BackColor="#EAEAD3" />
       <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mybooks %>" DeleteCommand="DELETE FROM [Book] WHERE [BookID] = @BookID" InsertCommand="INSERT INTO [Book] ([Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [DiscountPercent], [IsDiscount], [Description]) VALUES (@Title, @CategoryID, @ISBN, @Author, @Stock, @Price, @DiscountPercent, @IsDiscount, @Description)" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [Title] = @Title, [CategoryID] = @CategoryID, [ISBN] = @ISBN, [Author] = @Author, [Stock] = @Stock, [Price] = @Price, [DiscountPercent] = @DiscountPercent, [IsDiscount] = @IsDiscount, [Description] = @Description WHERE [BookID] = @BookID">
            <DeleteParameters>
                <asp:Parameter Name="BookID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="DiscountPercent" Type="Single" />
                <asp:Parameter Name="IsDiscount" Type="Boolean" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="Stock" Type="Int32" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="DiscountPercent" Type="Single" />
                <asp:Parameter Name="IsDiscount" Type="Boolean" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="BookID" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
    
        </asp:Content>
