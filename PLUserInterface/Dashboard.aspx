<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PLUserInterface.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="ObjectDataSource1" AutoGenerateRows="False">
       <Fields>
           <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
           <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
           <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
           <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
           <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
           <asp:BoundField DataField="ProcessingFee" HeaderText="ProcessingFee" SortExpression="ProcessingFee" />
           <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
       </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL"></asp:ObjectDataSource>
    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" DataSourceID="ObjectDataSource2" AutoGenerateRows="False">
        <Fields>
            <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
            <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="ProcessingFee" HeaderText="ProcessingFee" SortExpression="ProcessingFee" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL"></asp:ObjectDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource3" >
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProdID") %>'>'></asp:Label>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProdName") %>'>'></asp:Label>
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'>'></asp:Label>
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>'>'></asp:Label>
            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'>'></asp:Label>
            <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProcessingFee") %>'>'></asp:Label>
            <asp:Label ID="Label7" runat="server" Text='<%# Eval("CategoryID") %>'>'></asp:Label>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL">

    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource4" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
            <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="ProcessingFee" HeaderText="ProcessingFee" SortExpression="ProcessingFee" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="Select" TypeName="BLL.ProductBLL"></asp:ObjectDataSource>
</asp:Content>
