<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="PLUserInterface.ProductInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />


    <style>
        table {
            width: -webkit-fill-available;
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

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 100%;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
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

        .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 20px;
            text-align: center;
        }

            .message a {
                color: #4CAF50;
                text-decoration: none;
                text-align: center;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1"></asp:FormView>--%>
    <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>--%>
    <div class="container">
        <div class="form">
            <asp:FormView ID="FormView1" runat="server" OnPageIndexChanging="FormView1_PageIndexChanging" >

                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-4">
                            image:
           
                        <asp:Image ID="Image1" ImageUrl='<%#"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("productimage"))%>' runat="server" Width="200px" Height="200px" />
                            <br />
                        </div>

                        <div class="col-sm-8" style="background-color: white; border: solid; border-color: green">
                            <br>
                            <div class="input">
                                <br/>
                              
                                <span class="w3-text-blue">name:
                                </span>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("productname")  %>' />

                                <br />

                                <span class="w3-text-blue">details:</span>
                                <asp:Label ID="detailsLabel" runat="server" Text='<%# Bind("description") %>' />
                                <br />
                                <span class="w3-text-blue">price:</span>
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                                <br />
                            </div>
                            <br>

                            <div class="input">
                                <asp:Label ID="Label1" runat="server" Text="EMI TYPE:"></asp:Label>
                                <br>
                                <asp:DropDownList ID="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" >
                                    <asp:ListItem Value="1">3 months</asp:ListItem>
                                    <asp:ListItem Value="2">6 months</asp:ListItem>
                                    <asp:ListItem Value="3">9 months</asp:ListItem>
                                    <asp:ListItem Value="4">12 months</asp:ListItem>
                                </asp:DropDownList>
                               
                                <br>
                                <asp:Button ID="Button1" runat="server" Text="Pay Now" class="btn btn-primary" OnClick="Button1_Click" />

                            </div>
                            <br>
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" Checked="True" />By checking this you agree to our
                        <a data-toggle="modal" href="#Modal1">Terms and Conditions</a></p>
                       
                        <asp:Label ID="Label2" runat="server" Text="Label" ></asp:Label>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

        </div>

    </div>
    <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Terms and Conditions</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    1) Term of the Agreement
          <br />
                    <br />
                    The term of this Agreement will begin upon our acceptance of your Program Application and will end when terminated by either party. Either you or we may terminate this Agreement at any time, with or without cause, by giving the other party written notice of termination.
          <br />
                    <br />
                    2) Modification
          <br />
                    <br />
                    We may modify any of the terms and conditions contained in this Agreement, without prior notice at any time and in our sole discretion, by posting a change notice or a new agreement on the Flipkart Site.
          <br />
                    <br />
                    3) Limitation of Liability
          <br />
                    <br />
                    We will not be liable for indirect, special, or consequential damages (or any loss of revenue, profits, or data) arising in connection with this Agreement or the Program, even if we have been advised of the possibility of such damages.
          <br />
                    <br />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
