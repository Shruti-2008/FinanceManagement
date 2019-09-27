<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="PLUserInterface.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="thank you for purchasing"></asp:Label>
    <asp:LinkButton PostBackUrl="Dashboard.aspx" runat="server" Text="Dashboard"></asp:LinkButton>
</asp:Content>
