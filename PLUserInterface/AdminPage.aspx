<%@ Page Title="" Language="C#" MasterPageFile="~/AuthUser.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="PLUserInterface.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Accordion Demo</title>
    <style>
        .headerCssClass {
            background-color: #082e69;
            color: white;
            border: 1px solid black;
            padding: 10px;
            font-family: cursive;
            text-align:center;
        }

        .contentCssClass {
            background-color: #ccebe9;
            color: black;
            border: 1px dotted black;
            padding: 4px;
            font-family: American Typewriter, serif;
            text-align:center;
            font-size:medium;
        }

        .headerSelectedCss {
            background-color: #3569c4;
            color: white;
            border: 1px solid black;
            padding: 10px;
            font-family: cursive;
            text-align:center;
        }

        body {
            background: #FDFAB3; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #FDFAB3, #8DC26F);
            background: -moz-linear-gradient(right, #FDFAB3, #8DC26F);
            background: -o-linear-gradient(right, #FDFAB3, #8DC26F);
            background: linear-gradient(to left, #FDFAB3, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .padding-class {
            width: 100%;
            margin-left: 30px;
            padding-left: 150px;
            padding-top: 30px;
            align-content: center;
        }
        Columns{
            text-align:center;
            font-family:Algerian;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <ajaxToolkit:Accordion ID="Accordion1" runat="server" HeaderCssClass="headerCssClass" ContentCssClass="contentCssClass" HeaderSelectedCssClass="headerSelectedCss" FadeTransitions="true" TransitionDuration="250" AutoSize="None" SelectedIndex="0">
            <Panes>
                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                    <Header>View Unverified Users
                        </Header>
                    <Content>
                        
                        <div class="padding-class">
                            <asp:GridView ID="GridView1234" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="20" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1234_PageIndexChanging" PageSize="2">
                                <AlternatingRowStyle BackColor="#fffcf2" CssClass="align-items-center" />
                                <Columns>
                                    <asp:BoundField DataField="username" HeaderText="Username"  />
                                    <asp:BoundField DataField="fullname" HeaderText="Full Name" />
                                    <asp:BoundField DataField="phoneno" HeaderText="Phone Number" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="address" HeaderText="Address" />
                                    <asp:BoundField DataField="dateofbirth" HeaderText="Date of birth" />
                                    <asp:BoundField DataField="cardnumber" HeaderText="Card Number" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="TicketCompleted" runat="server" OnCheckedChanged="TicketCompleted_CheckedChanged" AutoPostBack="true" Checked='<%# Convert.ToBoolean(Eval("verified")) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                    </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                    <Header>View Verified Users</Header>
                    <Content>
                        
                        <div class="padding-class">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="15" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="2">
                                <AlternatingRowStyle BackColor="#fffcf2" />
                                <Columns>
                                    <asp:BoundField DataField="username" HeaderText="Username" />
                                    <asp:BoundField DataField="fullname" HeaderText="Full Name" />
                                    <asp:BoundField DataField="phoneno" HeaderText="Phone Number" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="address" HeaderText="Address" />
                                    <asp:BoundField DataField="dateofbirth" HeaderText="Date of birth" />
                                    <asp:BoundField DataField="cardnumber" HeaderText="Card Number" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="TicketCompleted2" runat="server" OnCheckedChanged="TicketCompleted_CheckedChanged2" AutoPostBack="true" Checked='<%# Convert.ToBoolean(Eval("verified")) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                    </Content>
                </ajaxToolkit:AccordionPane>
            </Panes>
        </ajaxToolkit:Accordion>



    </div>


</asp:Content>
