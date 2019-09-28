<%@ Page Title="" Language="C#" MasterPageFile="~/Local.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PLUserInterface.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title></title>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <body>
        <div class="container">

            <fieldset>

                <!-- Form Name -->
                <legend>
                    <center><h2><b>LOGIN FORM</b></h2></center>
                </legend>
                <br />

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Username" class="col-md-4 control-label"></asp:Label>

                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="username" runat="server"></asp:TextBox>
                            </span>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Please enter the username"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Password" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="password" runat="server"></asp:TextBox>
                            </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Please enter the password"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            <span class="glyphicon glyphicon-send"></span>

                        <asp:Button ID="Button2" runat="server" class="btn btn-warning" Text="Login" OnClick="Login_Click" />

                    </div>
                </div>





                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4">

                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="v2" />

                        <p class="message">Forgot Password?<a href="ForgotPassword.aspx">Click here to Recover</a></p>
                    </div>
                </div>

            </fieldset>
        </div>


    </body>
</asp:Content>
