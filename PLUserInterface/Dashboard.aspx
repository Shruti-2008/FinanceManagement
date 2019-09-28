<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PLUserInterface.Dashboard" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Dashboard</title>
    <style>
        .headerCssClass {
            background-color: #0d2e69;
            color: white;
            border: 1px solid black;
            padding: 4px;
        }

        .contentCssClass {
            background-color: #FDFAB3;
            color: black;
            border: 1px dotted black;
            padding: 4px;
        }

        .headerSelectedCss {
            background-color: #3569c4;
            color: white;
            border: 1px solid black;
            padding: 4px;
        }

        body {
            background: #FDFAB3; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #FDFAB3, #8DC26F);
            background: -moz-linear-gradient(right, #FDFAB3, #8DC26F);
            background: -o-linear-gradient(right, #FDFAB3, #8DC26F);
            background: linear-gradient(to left, #FDFAB3, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .card {

        }

        .goldcolor{
            background: #ebb434;
        }

        .detail-item {
           padding-left:30px;
        }

        .grid-data-padding{
            padding:10px;
            margin-top: 20px;
             color: black;
        }
         .detail-item{
            padding-top: 2px;
        }
         .data-text{
             padding-top: 2px;
         }
    </style>

    <script type="text/javascript">
        function ShowPanel(btnShow) {
            var row = $(btnShow).closest("tr");
            $('[id*=lblorderid]').html($("td", row).eq(0).html());
            $('[id*=pnlPopup]').show();
            return false;
        };

        function ClosePanel() {
            $('[id*=pnlPopup]').hide();
            return false;
        }
    </script>

    <%--     <style type="text/css">
        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        table > * {
            max-width: 100%;
            width: -webkit-fill-available;
        }

        tbody > * {
            max-width: 100%;
            width: -webkit-fill-available;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            /*max-width: 400px;*/
            max-width: 600px;
            margin: 0 auto 100px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .form1 {
            position: relative;
            z-index: 1;
            /*max-width: 400px;*/
            margin: 0 auto 100px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            background-color: white;
            width:500px;
            height:400px;
        }

        .input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background-color: #ebb434;
            width: 100px;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .input1 {
            z-index: 1;
            font-family: "Roboto", sans-serif;
            outline: 0;
            background-color: #ccebe9;
            border: 0;
            margin: 0 0 15px;
            padding: 35px;
            padding-top:50px;
            text-align: center;
            width: 100%;
            /*height: 275px;*/
            font-size: 16px;
            color: white;
        }

        button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background-color: #0D2E69;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 16px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }

            .button:hover, .button:active, .button:focus {
                background: #43A047;
            }


        body {
            background: #FDFAB3; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #FDFAB3, #8DC26F);
            background: -moz-linear-gradient(right, #FDFAB3, #8DC26F);
            background: -o-linear-gradient(right, #FDFAB3, #8DC26F);
            background: linear-gradient(to left, #FDFAB3, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            
        }

        .card {
            background-color: #0D2E69;
            color: white;
            margin: 10px;
            padding: 30px;
            position:relative;

        }
        .card-text {
            background-color: #0D2E69;
            color: white;
            margin: 10px;
            padding: 30px;

        }

        .cities1 {
            background-color:  #0D2E69;
            color: white;
            margin: 100px;
            margin-top: 15px;
            padding: 75px;
        }
        .data-text{
            color: black;
        }
        .data-padding{
            padding:5px;
            margin-top: 30px;
             color: black;
        }
        .grid-data-padding{
            padding:15px;
            margin-top: 30px;
             color: black;
        }
        .panel-data{
           background-color:white;
           padding:20px;
        }
        .panel-label{
            background-color: #ebb434;
            padding:5px;
        }
        .detail-item{
            padding: 20px;
            margin-left: 30px;
        }
        .viewhistory{
            margin: 10px;
        }
    </style>--%>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class='row'>

            <div class="col-md-4">
                <a href="ProductList.aspx">ProductList.aspx</a><br />
                <br />
                <div style="background-color: #FDFAB3; padding : 20px;">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" GridLines="None" RowStyle-CssClass="card-text">
                        <Fields>
                            <asp:BoundField DataField="cardnumber" HeaderText="Card Number" ItemStyle-CssClass="detail-item" />
                            <asp:BoundField DataField="username" HeaderText="Name" ItemStyle-CssClass="detail-item" />
                            <asp:BoundField DataField="validity" HeaderText="ValidTill" ItemStyle-CssClass="detail-item" />
                            <asp:BoundField DataField="cardname" ItemStyle-CssClass="goldcolor detail-item" />
                        </Fields>
                    </asp:DetailsView>

                    <br />

                    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="80%" AutoGenerateRows="False" GridLines="None" CssClass="data-padding">
                        <Fields>
                            <asp:BoundField DataField="creditlimit" HeaderStyle-CssClass="data-text" ItemStyle-CssClass="data-padding" HeaderText="TotalCredit      :" />
                            <asp:BoundField DataField="creditused" HeaderStyle-CssClass="data-text" HeaderText="CreditUsed      :" ItemStyle-CssClass="data-padding" />
                            <asp:BoundField DataField="creditbalance" HeaderStyle-CssClass="data-text" HeaderText="RemainingCredit :" ItemStyle-CssClass="data-padding" />
                        </Fields>
                    </asp:DetailsView>
                    <div class="progress">
                        <asp:Panel ID="YourPercentagePanel" runat="server" CssClass="progress-bar" OnLoad="ShowProgressBar"></asp:Panel>
                    </div>
                </div>

                <asp:Button ID="Saveaspdf" runat="server" OnClick="Saveaspdf_Click" Text="Download Your Dashboard" />

            </div>

            <div class="col-md-8">
                <br />
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div style="width: 100%">
                    <ajaxToolkit:Accordion ID="Accordion1" runat="server" HeaderCssClass="headerCssClass" ContentCssClass="contentCssClass" HeaderSelectedCssClass="headerSelectedCss" FadeTransitions="true" TransitionDuration="500" AutoSize="None" SelectedIndex="0">
                        <Panes>

                            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                                <Header>Active EMIs</Header>
                                <Content>
                                    <b><u>Active EMI</u></b>
                                    <div style="padding:10px">
                                    <asp:GridView ID="ActiveEMI_gridview" runat="server" AutoGenerateColumns="False" OnRowDataBound="ActiveEMI_gridview_RowDataBound" AutoPostBack="True" EmptyDataText="No records Found" GridLines="Horizontal">

                                        <Columns>
                                            <asp:BoundField DataField="orderid" HeaderText="Order Number" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="productname" HeaderText="Product Name" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="EMIduedate" HeaderText="Due Date" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="monthlyinstallment" HeaderText="Amount" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="PayNow_btn" runat="server" CausesValidation="false" CommandName="PayNow"
                                                        Text="Paynow" OnClick="PayNow_btn_Click" CssClass="viewhistory" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                    </div>
                                </Content>
                            </ajaxToolkit:AccordionPane>

                            <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                                <Header>Order History</Header>
                                <Content >
                                    <b><u>Order History</u></b>
                                    <div style="padding:10px">

                                   
                                    <asp:GridView ID="OrderHistory_gridview" runat="server" AutoGenerateColumns="false" AutoPostBack="True" CssClass="data-padding" EmptyDataText="No records Found" GridLines="Horizontal">
                                        <Columns>
                                            <asp:BoundField DataField="orderid" HeaderText="Order Number" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="orderdate" HeaderText="Order Date" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="productname" HeaderText="Product" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="price" HeaderText="Price" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="paid" HeaderText="Paid" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:BoundField DataField="balance" HeaderText="Balance" HeaderStyle-CssClass="grid-data-padding" ItemStyle-CssClass="grid-data-padding" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="EMIview_btn" runat="server" CausesValidation="false" CommandName="ViewEMIHistory" Text="View EMI History" OnClick="MyButtonClick" CssClass="viewhistory" />
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                    </asp:GridView>

                                         </div>
                                    
                                    <div style="border-style: solid; border-color:#0d2e69; border:1px;">

                                    
                                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" AutoPostBack="true" BackColor="#ffffff" Style="margin: 15px; width: 90%; margin-left: 10px; padding: 10px; ">
                                        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="panel-label">EMI History</asp:Label>

                                        <div class="body">
                                            <asp:GridView ID="OrderSpecific_gridview" runat="server" CssClass="grid-data-padding" RowStyle-CssClass="grid-data-padding" CellPadding="15" GridLines="Horizontal">
                                            </asp:GridView>
                                            <asp:Label ID="lblorderid" runat="server" />
                                        </div>
                                        <div class="footer" align="left">
                                            <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="button headerSelectedCss" OnClientClick="return ClosePanel()" />
                                        </div>
                                    </asp:Panel>
                                    </div>
                                </Content>
                            </ajaxToolkit:AccordionPane>

                        </Panes>
                    </ajaxToolkit:Accordion>
                </div>
            </div>
        </div>
    
</asp:Content>
