<%@ Page Title="" Language="C#" MasterPageFile="~/Local.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PLUserInterface.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 400px;
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
            font-size: 24px;
            text-align: center;
        }

            .message a {
                color: #4CAF50;
                text-decoration: none;
                text-align: center;
            }

        .register-form {
            display: none;
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }

            .container:before, .container:after {
                content: "";
                display: block;
                clear: both;
            }

            .container .info {
                margin: 50px auto;
                text-align: center;
            }

                .container .info h1 {
                    margin: 0 0 15px;
                    padding: 0;
                    font-size: 36px;
                    font-weight: 300;
                    color: #1a1a1a;
                }

                .container .info span {
                    color: #4d4d4d;
                    font-size: 12px;
                }

                    .container .info span a {
                        color: #000000;
                        text-decoration: none;
                    }

                    .container .info span .fa {
                        color: #EF3B3A;
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

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 23px;
        }

        .auto-style3 {
            width: 198px;
        }

        .auto-style4 {
            height: 23px;
            width: 198px;
        }

        .auto-style5 {
            width: 244px;
        }

        .auto-style6 {
            height: 23px;
            width: 244px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div>
        
        <br />
        <div class="login-page">
            <div class="form">

                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label13" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="name" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Name" ControlToValidate="name" ValidationGroup="v2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label14" runat="server" Text="Phone no"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="phoneno" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Your Phone-no" ValidationGroup="v2" ControlToValidate="phoneno"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label15" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ValidationGroup="v2"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label16" runat="server" Text="Username"></asp:Label>
                        </td>
                        <td class="auto-style5" colspan="2">
                            <asp:ScriptManager ID="ScriptManager2" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                                <ContentTemplate>
                                    <div class="input">
                                        <asp:TextBox ID="username" runat="server" AutoPostBack="true" OnTextChanged="CheckUserNameAvailability" ></asp:TextBox>
                                        <asp:Label ID="UpdateMsg" runat="server"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label17" runat="server" Text="Address"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="address" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Address" ValidationGroup="v2" ControlToValidate="address"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label18" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <div class="input">
                                <asp:TextBox ID="password" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td class="auto-style2">

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Password" ValidationGroup="v2" ControlToValidate="password"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <ajaxToolkit:PasswordStrength runat="server" TargetControlID="password"></ajaxToolkit:PasswordStrength>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label19" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="confirmpassword" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Your Password is incorrect" ValidationGroup="v2" ControlToCompare="password" ControlToValidate="confirmpassword"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label20" runat="server" Text="Date Of Birth"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                            <%--<asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender"></asp:Calendar>--%>
                        </td>
                        <td>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientIDMode="Predictable" ErrorMessage="Select Date" ValidationGroup="v2"></asp:CustomValidator>
                            <%--<asp:CustomValidator ID="CustomValidator2" runat="server" ClientIDMode="Predictable" onservervalidate="DateCustVal_Validate" ErrorMessage="Select Date" ValidationGroup="v2"></asp:CustomValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label21" runat="server" Text="Card type"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                                    <asp:ListItem Value="1">Gold</asp:ListItem>
                                    <asp:ListItem Value="2">Titanium</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select Card Type" ValidationGroup="v2" ControlToValidate="RadioButtonList1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label22" runat="server" Text="Select Bank"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:DropDownList ID="selectbank" runat="server" AutoPostBack="True">
                                    <asp:ListItem Value="1">ICICI</asp:ListItem>
                                    <asp:ListItem Value="2">HDFC</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Select Bank Type" ValidationGroup="v2" ControlToValidate="selectbank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label23" runat="server" Text="Saving Account Bank No."></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="accountno" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Please enter Savings Account No." ValidationGroup="v2" ControlToValidate="accountno"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label24" runat="server" Text="IFSC Code"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <div class="input">
                                <asp:TextBox ID="ifsccode" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Please Enter Your IFSC Code" ValidationGroup="v2" ControlToValidate="ifsccode"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style5">
                            <asp:Button ID="Button1" runat="server" Text="Register" class="button" ValidationGroup="v2" OnClick="Button1_Click" />

                        </td>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="v2" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <p class="message">Already registered?<a href="Login.aspx">Login</a></p>
                        </td>
                        <td></td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>



</asp:Content>

