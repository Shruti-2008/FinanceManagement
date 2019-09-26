<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="PLUserInterface.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--<asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                <asp:BoundField DataField="phoneno" HeaderText="phoneno" SortExpression="phoneno" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="dateofbirth" HeaderText="dateofbirth" SortExpression="dateofbirth" />
                <asp:BoundField DataField="cardnumber" HeaderText="cardnumber" SortExpression="cardnumber" />
                <asp:CheckBoxField DataField="verified" HeaderText="verified" SortExpression="verified" />
                <asp:CommandField ShowSelectButton="true" ButtonType="Link" SelectText="Verify" />
            </Columns>
        </asp:GridView>--%>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="True" DataKeyNames="username, fullname, phoneno, email, address, dateofbirth, cardnumber" OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowCancelingEdit="OnRowCancelEdit" OnRowEditing="OnRowEditing" OnRowUpdating="GridView2_RowUpdating">
            <Columns>

                <asp:CheckBoxField DataField="verified" HeaderText="verified" SortExpression="verified" />

                <asp:CommandField ShowEditButton="true" />
            </Columns>
        </asp:GridView>

    </div>


</asp:Content>
