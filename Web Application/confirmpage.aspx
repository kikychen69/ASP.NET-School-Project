<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="confirmpage.aspx.cs" Inherits="Team7.confirmpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="your Order is Done...!!!'"></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="HOMEPAGE" OnClick="Button1_Click" />
</asp:Content>
