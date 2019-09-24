<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="PLUserInterface.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1"></asp:ListView>--%>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1"></asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL"></asp:ObjectDataSource>
    -
    
</asp:Content>
