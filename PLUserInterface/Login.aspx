<%@ Page Title="" Language="C#" MasterPageFile="~/Local.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PLUserInterface.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="login-page">
        <div class="form">
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <div class="input">
                <asp:TextBox ID="username" runat="server" ></asp:TextBox>
            </div>
            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Please enter the username"></asp:RequiredFieldValidator>--%>

            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Please enter the password"></asp:RequiredFieldValidator>--%>
            <asp:Button ID="Button1" runat="server" class="button" Text="Login" OnClick="Login_Click" />
            <p class="message">Not registered?<a href="Register.aspx">Create an account</a></p>
        </div>
    </div>
</asp:Content>
