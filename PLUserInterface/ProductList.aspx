<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="PLUserInterface.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        table {
            width: -webkit-fill-available;
        }

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            display: block;
            z-index: 1;
            background: #FFFFFF;
            /*max-width: 400px;*/
            margin: 0 auto 10px;
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

        .img {
            max-height: 100%;
            height: 100%;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1"></asp:ListView>--%>
    <%--<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1"></asp:GridView>--%>

    <%-- <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL"></asp:ObjectDataSource>--%>


    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
    <asp:ListView ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" AutoPostBack="True" OnSelectedIndexChanging="ListView1_SelectedIndexChanging1">




        <ItemTemplate>
            <div class="form" style="display: inline-block; width: auto;">
                <table style="border-collapse: separate; border-spacing: 5px;">


                    <tr class="col-sm-12">
                        <div class="col-sm-3">
                            <td>
                                <div class="input col-sm-3">
                                    <asp:Image ImageUrl='<%#"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("productimage"))%>' runat="server" Width="200px" Height="200px" />
                                </div>


                            </td>
                        </div>

                        <div class="col-sm-9">
                            <td>
                                <div class="input">
                                    <h6 class="group inner list-group-item-heading"><u>Product Name</u></h6>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("productname")%>'> 
                                    </asp:Label>
                                </div>

                            </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="input ">
                                <h6 class="group inner list-group-item-heading"><u>Product Details</u></h6>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("quantity")%>'> 
                                </asp:Label>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="input ">
                                <h6 class="group inner list-group-item-heading"><u>Product Details</u></h6>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("price")%>'> 
                                </asp:Label>
                            </div>

                        </td>
                    </tr>


                    <tr>
                        <td>
                            <asp:LinkButton ID="Button1" runat="server" Text="Buy Now" CssClass="button" Enabled='<%# Eval("Disable").ToString() == "0" ? true : false %>' OnClick="Button1_Click1" CommandName="Select" />


                        </td>
            </div>
            </tr>
            

                </table>

            </div>
        </ItemTemplate>

    </asp:ListView>




</asp:Content>
