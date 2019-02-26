<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Team7.login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSheetLogin.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class = "mainlogin col-12 col-lg-9 d-flex flex-row flex-wrap my-flex-container">
        <div class="form-group form-inline col-12 col-md-6" style="height: 200px; text-align:center;">
         <asp:Login ID="Login1" runat="server" Onloggedin="LoggedIn" TextBoxStyle-CssClass="form-control m-2" DisplayRememberMe="False" LoginButtonStyle-CssClass="btn btn-warning mt-2 mr-4" LoginButtonText="Log In" LoginButtonType="Button" TitleText="LOG IN" DestinationPageUrl="Default.aspx" VisibleWhenLoggedIn="False"></asp:Login>
            </div>
         <div class="form-group form-inline col-12 col-md-6 mt-3">
             <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" TextBoxStyle-CssClass="form-control m-2" CreateUserButtonStyle-CssClass="btn btn-warning mr-2">
                 <WizardSteps>
                     <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                     </asp:CreateUserWizardStep>
                     <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                     </asp:CompleteWizardStep>
                 </WizardSteps>
             </asp:CreateUserWizard>
         </div>
         </div>
</asp:Content>
