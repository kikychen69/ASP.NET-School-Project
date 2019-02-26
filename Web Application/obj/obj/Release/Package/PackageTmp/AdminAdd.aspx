<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adminAdd.aspx.cs" Inherits="Team7.AdminAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" div="margin:0px suto">
    <!DOCTYPE html>
  
    <style type="text/css">
        .auto-style3 {
            height: 24px;
            width: 300px;
        }
        .auto-style4 {
            width: 300px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="Table1">
        <tr style="text-align:center;color:red;font-size:20px">
            <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add New Books</td>
            
        </tr>
        <tr>
            
            <td class="auto-style4" >Title：</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtBookName" runat="server" BackColor="#FFFFCC" Width="160px"></asp:TextBox>
                <asp:Label ID="Label2" runat="server">*</asp:Label> Not Null</td>
            </tr>
        <tr>
            <td class="auto-style4" ></td>
            <td class="auto-style3">
                </td>
           
        </tr>
        <tr >
            
            <td class="auto-style4">Category：</td>
            <td class="auto-style3" >
                <asp:DropDownList ID="CategoryDropdown" runat="server" Width="160px" DataSourceID="SqlDataSource1" DataTextField="CategoryID" DataValueField="CategoryID" Height="30px" BackColor="#FFFFCC">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mybooks %>" DeleteCommand="DELETE FROM [Category] WHERE [CategoryID] = @CategoryID" SelectCommand="SELECT [CategoryID] FROM [Category]">
                    <DeleteParameters>
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style4">ISBN:</td>
            <td class="auto-style3">

                <asp:TextBox ID="txtISBN" runat="server" BackColor="#FFFFCC" Width="160px" ></asp:TextBox>
            
                <asp:Label ID="Label9" runat="server">*</asp:Label>
                Numbers.</td>
        </tr>
        <tr>
            <td class="auto-style4">Author:</td>
            <td class="auto-style3">

                <asp:TextBox ID="TxtAuthor" runat="server" BackColor="#FFFFCC" Width="160px"></asp:TextBox>
            
                <asp:Label ID="Label1" runat="server">*</asp:Label>
                Not Null</td>
        </tr>
        <tr>
          
            <td class="auto-style4">Price：</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPrice" runat="server" BackColor="#FFFFCC" Width="160px"></asp:TextBox>
                <asp:Label ID="Label8" runat="server">*</asp:Label>
                Numbers</td>
           
        </tr>
        <tr>
            
            <td class="auto-style4">Stock：</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtStock" runat="server" BackColor="#FFFFCC" Width="160px"></asp:TextBox>
            
                <asp:Label ID="Label10" runat="server">*</asp:Label>
                Integer</td>
            </tr>
        <tr>
        <td class="auto-style4">DiscountPercent</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtdiscountpercent" runat="server" BackColor="#FFFFCC" Width="160px"></asp:TextBox>
            
                *Float</td>
           
        </tr>
        <tr>
        <td class="auto-style4">Description：</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtDescription" runat="server" BackColor="#FFFFCC" Width="160px"></asp:TextBox>
            
                string</td>
        </tr>
        <tr>
        <td class="auto-style4">IsDiscount：</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtIsDiscount" runat="server" Width="160px" BackColor="#FFFFCC"></asp:TextBox>
            
                *true/false</td>
        </tr>
         <tr>   
            <td class="auto-style4" >
                <asp:Button ID="tbSubmit" runat="server" Text="Submit" OnClick="tbSubmit_Click1" Width="75px" BackColor="#FFFFCC"  />
               
                <asp:Button ID="tbReset" runat="server" CausesValidation="False" Text="Reset" OnClick="tbReset_Click" Width="94px" BackColor="#FFFFCC" />
                <asp:LinkButton ID="Back" runat="server" OnClick="Back_Click" BackColor="#FF3300" BorderStyle="Solid" Font-Size="Medium">Back</asp:LinkButton>
            </td>
           
        </tr>
    </table>
    </asp:Content>
