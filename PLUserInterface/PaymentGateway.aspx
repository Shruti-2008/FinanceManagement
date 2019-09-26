﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="PaymentGateway.aspx.cs" Inherits="PLUserInterface.PaymentGateway" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
            font-size: 17px;
            padding: 8px;
        }

        * {
            box-sizing: border-box;
        }

        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            margin: 0 -16px;
        }

        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        .col-50 {
            -ms-flex: 50%; /* IE10 */
            flex: 50%;
        }

        .col-75 {
            -ms-flex: 75%; /* IE10 */
            flex: 75%;
        }

        .col-25,
        .col-50,
        .col-75 {
            padding: 0 16px;
        }

        .container {
            background-color: #f2f2f2;
            padding: 5px 20px 15px 20px;
            border: 1px solid lightgrey;
            border-radius: 3px;
        }

        input[type=text] {
            width: 100%;
            margin-bottom: 20px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        label {
            margin-bottom: 10px;
            display: block;
        }

        .icon-container {
            margin-bottom: 20px;
            padding: 7px 0;
            font-size: 24px;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            margin: 10px 0;
            border: none;
            width: 100%;
            border-radius: 3px;
            cursor: pointer;
            font-size: 17px;
        }

            .btn:hover {
                background-color: #45a049;
            }

        a {
            color: #2196F3;
        }

        hr {
            border: 1px solid lightgrey;
        }

        span.price {
            float: right;
            color: grey;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
        @media (max-width: 800px) {
            .row {
                flex-direction: column-reverse;
            }

            .col-25 {
                margin-bottom: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-75">
            <div class="container">


                <div class="row">

                    <div class="col-50">
                        <h3>Payment</h3>

                        <div class="icon-container">
                        </div>



                        <asp:Label ID="Label1" runat="server" Text="Label" for="ccnum">EMI number</asp:Label>
                        <asp:TextBox ID="ccnum" runat="server" name="cardnumber"></asp:TextBox>

                        <asp:Label ID="Label2" runat="server" Text="Exp Month" for="expmonth"></asp:Label>
                        <asp:TextBox ID="expmonth" runat="server" name="expmonth"></asp:TextBox>

                        <div class="row">
                            <div class="col-50">



                                <asp:Label ID="Label3" runat="server" Text="Valid Till" for="expyear"></asp:Label>
                                <asp:TextBox ID="expyear" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-50">



                                <asp:Label ID="Label4" runat="server" Text="Password" for="cvv"></asp:Label>
                                <asp:TextBox ID="cvv" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                </div>


                <asp:Button ID="Button1" runat="server" Text="Pay Now" class="btn" OnClick="Button1_Click" />

            </div>
        </div>

    </div>

</asp:Content>
