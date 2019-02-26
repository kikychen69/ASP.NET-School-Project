<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSale.aspx.cs" Inherits="Team7.AdminSale" %>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
    <head>
        <meta charset="UTF-8" />
        <title>Choose your sale period</title>
        
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.25/daterangepicker.css" rel="stylesheet">
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.25/moment.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.25/daterangepicker.js"></script>
        
    </head>
    <body style="margin: 0px 0">
        <form id="form1" runat="server">
                <asp:LinkButton ID="Back" runat="server" OnClick="Back_Click" BackColor="White" Font-Underline="True" Height="35px" Width="194px" Font-Size="Medium" ForeColor="#0099FF">Back</asp:LinkButton>
             <br/>       
            <asp:Label ID="LabelCategory" runat="server" Text="Category:" Font-Size="Medium"></asp:Label>
                    <asp:DropDownList ID="CatDropDownList" runat="server" Width="170px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CategoryID" DataValueField="CategoryID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="30px" BackColor="#FFFFCC" Font-Size="Medium" >
                    </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mybooks %>" DeleteCommand="DELETE FROM [Category] WHERE [CategoryID] = @CategoryID" SelectCommand="SELECT [CategoryID] FROM [Category]">
                    <DeleteParameters>
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
              <br/>         
            
            <br>
                    <asp:Label ID="LabelDiscount" runat="server" Text="DiscountPercent" Font-Size="Medium"></asp:Label>
                    :<asp:TextBox ID="TxtDiscount" runat="server" BackColor="#FFFFCC" Height="26px" Width="83px"></asp:TextBox>
                    <br />
                    <br />
        <div class="row">
            <div class="auto-style1">
                <h4>&nbsp;</h4>
                <h4>Choose your sale period</h4>
                <input type="text" id="config-demo" class="auto-style2">
                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
            </div>
        </div>
        <style type="text/css">
            .demo {
                position: relative;
            }
            
            .demo i {
                position: absolute;
                bottom: 10px;
                right: 24px;
                top: auto;
                cursor: pointer;
            }
            .auto-style1 {
                left: 1px;
                top: 3px;
            }
            .auto-style2 {
                display: block;
                width: 20%;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.42857143;
                color: #555;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            }
        </style>

        <script type="text/javascript">
            $('#config-demo').daterangepicker({              
                "linkedCalendars": false,
                "autoUpdateInput": false,
                "showDropdowns":true,
                "locale": {
                    format: 'YYYY-MM-DD',
                    separator: ' ~ ',
                    applyLabel: "apply",
                    cancelLabel: "cancel",
                    resetLabel: "reset",
                }
            }, function(start, end, label) {
                console.log(this.startDate.format(this.locale.format));
                console.log(this.endDate.format(this.locale.format));
                if(!this.startDate){
                    this.element.val('');
                }else{
                    this.element.val(this.startDate.format(this.locale.format) + this.locale.separator + this.endDate.format(this.locale.format));
                }
                });
            
        </script>

                    <p>
                    <asp:Button ID="ResetBtn" runat="server" BackColor="#FFFFCC" Font-Size="Medium" OnClick="ResetBtn_Click" Text="Reset" Width="109px" />
                    <asp:Button ID="SubmitBtn" runat="server" BackColor="#FFFFCC" Font-Size="Medium" OnClick="SubmitBtn_Click" Text="Submit" Width="105px" />
                    </p>

        </form>
    </body>
</html>
