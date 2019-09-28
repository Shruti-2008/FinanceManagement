<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="PLUserInterface.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style>
        /*div{
            padding: 30px;
        }*/
        .display-box{
            background-color:white;
            padding: 30px;
            margin: 20px;
        }
        .outofstock{
            color:red;
        }
        .common-margin{
            margin: 20px;

        }

        display-heading{
            font-family:Cambria;
           
        }
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
            padding-left: 30px;
            margin: 0 15px 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background-color: #0d2e69;
            width:100px;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
           
        }
        button:disabled,
button[disabled] {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background-color:green ;
            width: 100%;
            border: 0;
            padding: 15px;
            color: pink;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }
       
            .button:hover, .button:active, .button:focus {
                background-color: #3569c4;
                color:white;
                width:100px;
            }

        .img {
            max-height: 100%;
            height: 100%;
            width: 100%;
        }
        input[type=submit]:disabled {
           background: white;
           border: 0;
           color: #666;
           cursor: pointer;
       }
        /*Button1:disabled{
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background:blue ;
            width: 100%;
            border: 0;
            padding: 15px;
            color: pink;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }*/



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
        .label-heading{
            color: red;
            font-size: 24px;
            padding: 15px;
        }
        .product-info{
           
            font-size: 14px;
        }
        .product-details:{
            padding: 20px;
        }
        .info-heading:{
            font-weight:300;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1"></asp:ListView>--%>
    <%--<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1"></asp:GridView>--%>

    <%-- <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL"></asp:ObjectDataSource>--%>
    <div class="display-box common-margin">
         <asp:Label ID="Label6" runat="server" Text="Label" CssClass="common-margin ">Select Category</asp:Label>

    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" CssClass="common-margin">
    </asp:DropDownList >
    </div>
   

    <asp:Label ID="Label1" runat="server"  Visible="false" ></asp:Label>
    <asp:ListView ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" AutoPostBack="True" OnSelectedIndexChanging="ListView1_SelectedIndexChanging1">




        <ItemTemplate>
            <%--<div class="form" style="display: inline-block; width: auto;">--%>
                <div class="row display-box">
                    <br /><br />
                        <div class="col-sm-3">
                           
                                <div class="input" style="padding-left: 25px;">
                                    <asp:Image ImageUrl='<%#"data:Image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("productimage"))%>' runat="server" CssClass="img"  />
                                </div>


                           
                        </div>

                        <div class="col-sm-7 input" style="border: solid; border-color:#3569c4 ;border-radius:15px; " >
                           
                                <div class="row" >
                                    <div class="col-sm-3">
                                         <asp:Label ID="Label2" runat="server" CssClass="label-heading" Font-Italic="true" Font-Names="Monotype Corsiva" Font-Bold="true" ForeColor="Maroon" Text='<%# Eval("productname")%>'>
                                    </asp:Label>
                                        <%--<h6 class="group inner list-group-item-heading">Product Name</h6>--%>
                                    </div>
                                    <div class="col-sm-2">
                                       
                                   
                                    </div>
                                   
                                </div>

                           
                   

                            <div class="row product-details" style="padding:25px;">
                                <div class="col-sm-3">
                                    <h6 class="group inner list-group-item-heading" ><b>Price</b></h6>
                                </div>
                                <div class="col-sm-2">
                                    <asp:Label ID="Label7" runat="server" CssClass="product-info" Text="₹ "></asp:Label>
                                    <asp:Label ID="Label3" runat="server" CssClass="product-info" Font-Bold="false" Text='<%# Eval("price")%>'>
                                </asp:Label>
                                </div>
                               
                            </div>

                       
                            <div class="row product-details"  style="padding-left:25px;">
                                <div class="col-sm-3">
                                    <h6 class="group inner list-group-item-heading" ><b>Description</b</h6>
                                </div>
                                <div class="col-sm-2" style="padding-left:10px;">
                                     <%--<asp:Label ID="Label4" runat="server"  Text='<%# Eval("description")%>'>
                                </asp:Label>--%>
                                     <asp:Label ID="Label4" runat="server"  Width="400px" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique, diam vitae finibus pellentesque, mauris nulla vestibulum risus, nec gravida." Font-Bold="false">
                                </asp:Label>
                                   <%-- <asp:TextBox ID="TextBox1" runat="server" Width="400px" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at." ReadOnly="true"></asp:TextBox>--%>
                                </div>
                               
                            </div>
</div>
                   <div class="col-sm-2">
                       <div class="row"></div><br />
                       <div class="row"></div><br />
                       <div class="row"></div><br />
                       <div class="row"><asp:LinkButton ID="Button1" runat="server" Text="Buy Now" CssClass="button button:disabled" Enabled='<%# Eval("Disable").ToString() == "0" && Convert.ToInt32(Eval("quantity"))>0 ? true : false %>' OnClick="Button1_Click1" Font-Bold="false" CommandName="Select" /> </div><br />
                           <div >

                               <asp:Label ID="Label5" runat="server" CssClass="outofstock" Font-Bold="false" Text='<%# Eval("quantity").ToString() == "0"? "Out of Stock": "" %>'></asp:Label>
                           </div>
                           

                   </div>
                           

           
                    </div>
           

        </ItemTemplate>

    </asp:ListView>




</asp:Content>
