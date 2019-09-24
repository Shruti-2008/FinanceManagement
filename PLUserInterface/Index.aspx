<%@ Page Title="" Language="C#" MasterPageFile="~/Local.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PLUserInterface.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <asp:Image ImageUrl="~/App_Data/App_Images/Logo.png" ID="Image2" runat="server" />
        </div>
        <div class="carousel-item">
            <asp:Image ImageUrl="~/App_Data/App_Images/Logo.png" ID="Image3" runat="server" />
        </div>
        <div class="carousel-item">
            <asp:Image ImageUrl="~/App_Data/App_Images/Logo.png" ID="Image4" runat="server" />
        </div>
    </div>
</asp:Content>
