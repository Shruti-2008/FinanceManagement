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
        <asp:GridView ID="GridView2" runat="server" DataKeyNames="username,fullname,phoneno,email,address,dateofbirth,cardnumber,verified" OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowCancelingEdit="OnRowCancelEdit" OnRowEditing="OnRowEditing" OnRowUpdating="GridView2_RowUpdating" OnRowCreated="GridView2_RowCreated" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>

                <%--<asp:CheckBoxField  HeaderText="verified" SortExpression="verified" />--%>
                <asp:templatefield HeaderText="Check to verify">
                    <itemtemplate>
                        <asp:checkbox ID="cbSelect" runat="server" AutoPostBack="True" Checked="True" ></asp:checkbox>
                    </itemtemplate>
                </asp:templatefield>
                <asp:BoundField DataField="verified" HeaderText="Verified" SortExpression="verified" ReadOnly="True" />
               

                <asp:CommandField ShowEditButton="true" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>

    </div>

</asp:Content>
