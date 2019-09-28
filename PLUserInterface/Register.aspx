<%@ Page Title="" Language="C#" MasterPageFile="~/Local.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PLUserInterface.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" xmlns="http://www.w3.org/1999/xhtml">

    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
                    <center><h2><b>Registration Form</b></h2></center>
                </legend>
                <br />

                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Name" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="name" runat="server"></asp:TextBox>
                            </span>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Name" ControlToValidate="name" ValidationGroup="v2"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Phone no" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="phoneno" runat="server"></asp:TextBox>
                            </span>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Your Phone-no" ValidationGroup="v2" ControlToValidate="phoneno"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Email" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                            </span>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ValidationGroup="v2"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="Username" class="col-md-4 control-label"></asp:Label>

                    <asp:ScriptManager ID="ScriptManager2" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                        <ContentTemplate>
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                        <asp:TextBox ID="username" runat="server" AutoPostBack="true" OnTextChanged="CheckUserNameAvailability"></asp:TextBox>
                                    </span>
                                    <asp:Label ID="UpdateMsg" runat="server"></asp:Label>
                                </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="form-group">
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">

                            </div>
                        </div>
                    </div>

                <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="Address" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="address" runat="server"></asp:TextBox>
                            </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Address" ValidationGroup="v2" ControlToValidate="address"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label18" runat="server" Text="Password" class="col-md-4 control-label"></asp:Label>

                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:TextBox ID="password" runat="server"></asp:TextBox>
                            </span>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Password" ValidationGroup="v2" ControlToValidate="password"></asp:RequiredFieldValidator>


                            <ajaxToolkit:PasswordStrength runat="server" TargetControlID="password"></ajaxToolkit:PasswordStrength>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label19" runat="server" Text="Confirm Password" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>
                                <asp:TextBox ID="confirmpassword" runat="server"></asp:TextBox>
                            </span>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Your Password is incorrect" ValidationGroup="v2" ControlToCompare="password" ControlToValidate="confirmpassword"></asp:CompareValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label20" runat="server" Text="Date Of Birth" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>
                                <%--<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>


                               
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox1"  />


                            </span>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientIDMode="Predictable" ErrorMessage="Select Date" ValidationGroup="v2"></asp:CustomValidator>
                            <%--<asp:CustomValidator ID="CustomValidator2" runat="server" ClientIDMode="Predictable" onservervalidate="DateCustVal_Validate" ErrorMessage="Select Date" ValidationGroup="v2"></asp:CustomValidator>--%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label21" runat="server" Text="Card type" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"></span>
                            <span class="input-group-addon">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="False">
                                    
                                    <asp:ListItem Value="1">Gold</asp:ListItem>
                                    <asp:ListItem Value="2">Titanium</asp:ListItem>
                                    
                                </asp:RadioButtonList>
                                </span>
                               
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select Card Type" ValidationGroup="v2" ControlToValidate="RadioButtonList1"></asp:RequiredFieldValidator>
                                 
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label22" runat="server" Text="Select Bank" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 selectContainer">
                        <div class="input-group">
                            

                                <asp:DropDownList ID="selectbank" runat="server" AutoPostBack="False" class="form-control selectpicker">
                                    <asp:ListItem Value="1">ICICI</asp:ListItem>
                                    <asp:ListItem Value="2">HDFC</asp:ListItem>
                                </asp:DropDownList>
                            

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Select Bank Type" ValidationGroup="v2" ControlToValidate="selectbank"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label23" runat="server" Text="Saving Account Bank No." class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i>
                                <asp:TextBox ID="accountno" runat="server"></asp:TextBox>
                            </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Please enter Savings Account No." ValidationGroup="v2" ControlToValidate="accountno"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label24" runat="server" Text="IFSC Code" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i>
                                <asp:TextBox ID="ifsccode" runat="server"></asp:TextBox>
                            </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Please Enter Your IFSC Code" ValidationGroup="v2" ControlToValidate="ifsccode"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="" class="col-md-4 control-label"></asp:Label>
                        <div class="col-md-4">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            <span class="glyphicon glyphicon-send"></span>
                             
                            <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-warning" ValidationGroup="v2" OnClick="Button1_Click" />
                               
                        </div>
                    </div>
                
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="" class="col-md-4 control-label"></asp:Label>
                    <div class="col-md-4">

                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False" ValidationGroup="v2" />

                        <p class="message">Already registered?<a href="Login.aspx">Login</a></p>
                    </div>
                </div>
            </fieldset>

        </div>
    </body>



</asp:Content>
