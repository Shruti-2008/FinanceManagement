<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PLUserInterface.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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

    <style type="text/css">
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
            max-width: 400px;
            margin: 0 auto 100px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .form1 {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 400px;
            margin: 0 auto 100px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #00cc99;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .input1 {
            z-index: 1;
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #00cc99;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            text-align: center;
            width: 100%;
            font-size: 14px;
            color: white;
        }

        .button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }

            .button:hover, .button:active, .button:focus {
                background: #43A047;
            }


        body {
            background: #76b852; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #76b852, #8DC26F);
            background: -moz-linear-gradient(right, #76b852, #8DC26F);
            background: -o-linear-gradient(right, #76b852, #8DC26F);
            background: linear-gradient(to left, #76b852, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .cities {
            background-color: #666699;
            color: white;
            margin: 10px;
            padding: 10px;
        }

        .cities1 {
            background-color: #ffffcc;
            color: white;
            margin: 10px;
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <%--EMI Card --%>
        <div class="row">
            <div class="col-lg-12">
                <div class="form">
                    <div class="cities">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" GridLines="None">

                            <Fields>

                                <asp:BoundField DataField="cardnumber" HeaderText="Card Number" />
                                <asp:BoundField DataField="username" HeaderText="Name" />
                                <asp:BoundField DataField="validity" HeaderText="ValidTill" />
                                <asp:BoundField DataField="cardname" ItemStyle-CssClass="input" />

                            </Fields>

                        </asp:DetailsView>
                    </div>
                </div>

            </div>
        </div>

        <div class="cities1">
            <div class="form">

                <%--Credit Info--%>
                <div class="row">
                    <div class="input1">
                        <div class="progress">
                            <div id="progressbar1" class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">30</span>
                            </div>
                        </div>
                        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" GridLines="None">
                            <Fields>
                                <asp:BoundField DataField="creditlimit" HeaderText="TotalCredit :" />
                                <asp:BoundField DataField="creditused" HeaderText="CreditUsed :" />
                                <asp:BoundField DataField="creditbalance" HeaderText="RemainingCredit :" />
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>


                <%--ORDER HISTORY--%>
                <div class="row">

                    <div class="input1">
                        <table style="border-collapse: separate; border-spacing: 5px;">
                            <asp:GridView ID="OrderHistory_gridview" runat="server" AutoGenerateColumns="false" OnRowCommand="OrderHistory_gridview_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="orderid" HeaderText="Order Number" />
                                    <asp:BoundField DataField="orderdate" HeaderText="Order Date" />
                                    <asp:BoundField DataField="productname" HeaderText="Product" />
                                    <asp:BoundField DataField="price" HeaderText="Price" />
                                    <asp:BoundField DataField="paid" HeaderText="Paid" />
                                    <asp:BoundField DataField="balance" HeaderText="Balance" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="EMIview_btn" runat="server" CausesValidation="false" CommandName="ViewEMIHistory" Text="View EMI History" OnClick="MyButtonClick" />

                                            <%--OnClientClick="return ShowPanel(this)"--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                            </asp:GridView>
                            <div>
                            </div>
                            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" AutoPostBack="true">
                                <%--Style="display: none"--%>
                                <div class="header bg-danger">
                                    EMI History
                                </div>
                                <div class="body">
                                    <asp:GridView ID="OrderSpecific_gridview" runat="server">
                                    </asp:GridView>
                                    <asp:Label ID="lblorderid" runat="server" />
                                </div>
                                <div class="footer" align="right">
                                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="button" OnClientClick="return ClosePanel()" />
                                </div>
                            </asp:Panel>
                        </table>

                    </div>
                </div>


                <%--Active EMI--%>
                <div class="row">
                    <div class="input1">
                        <asp:GridView ID="ActiveEMI_gridview" runat="server" AutoGenerateColumns="False" OnRowDataBound="ActiveEMI_gridview_RowDataBound" OnRowCreated="ActiveEMI_gridview_RowCreated">
                            <Columns>
                                <asp:BoundField DataField="orderid" HeaderText="Order Number" />
                                <asp:BoundField DataField="productname" HeaderText="Product Name" />
                                <asp:BoundField DataField="EMIduedate" HeaderText="Due Date" />
                                <asp:BoundField DataField="monthlyinstallment" HeaderText="Amount" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="PayNow_btn" runat="server" CausesValidation="false" CommandName="PayNow"
                                            Text="Paynow" OnClick="PayNow_btn_Click" />
                                        <%--CommandArgument='<%# Eval("id") %>'--%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
