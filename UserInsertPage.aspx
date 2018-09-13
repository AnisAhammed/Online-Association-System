<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="UserInsertPage.aspx.cs" Inherits="Manager_UserInsertPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.4.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
   

    <script>
        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.x').
                        attr('src', e.target.result)
                    .width(150);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#FileUpload1").change(function () {
            readURL(this);
        });
    </script>

    <style type="text/css">
        .auto-style4 {
            height: 379px;
            width: 487px;
            margin-left: 80px;
            font-size:15px;
        }
        .auto-style5 {
            height: 43px;
        }
        .auto-style6 {
            width: 200px;
        }
        .auto-style7 {
            width: 82px;
            text-align: left;
        }
        .auto-style8 {
            background-color: #99CCFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <br /><div class="container">
      <div class="row">
        <div class="col-sm-0" style="background-color:gainsboro;">
      
        </div>
          <div class="col-sm-6" style="background-color:#EBDEF0;">
         <h2 style="text-align:center;" class="auto-style8">Welcome To Register</h2>        
    <table class="auto-style4">
        <tr>
            <td class="auto-style7">UserName:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtUserName" runat="server" Height="25px" Width="180px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="regUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="You Must Type UserName" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Password:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtPassword" runat="server" type="password" Height="25px" Width="180px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="regPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="You Must Type Address" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Confirm Password:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtCPassword" runat="server" type="password" Height="25px" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="regPassword0" runat="server" ControlToValidate="txtCPassword" ErrorMessage="You Must Type Address" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Don't match password" ForeColor="#6666FF">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Type:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" Height="25px" Width="180px">
                    <asp:ListItem Value="0">--Select User---</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Member</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                </asp:DropDownList>
            &nbsp;<asp:RequiredFieldValidator ID="regType" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please select Type" ForeColor="Red" InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Email:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtEmail" runat="server" Height="25px" Width="180px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email" ForeColor="#CC33FF" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Photo:</td>
            <td class="auto-style6">
                <asp:Image ID="Image1" runat="server" Width="100px" CssClass="x" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style6">
                <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" />
                &nbsp;<asp:RequiredFieldValidator ID="regPhoto" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please Upload Photo" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style5">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnInsert" runat="server" class="btn btn-primary" Text="Register" Width="122px" OnClick="btnInsert_Click" />

                &nbsp;&nbsp;

                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    </div>
         <div class="col-sm-0" style="background-color:gainsboro;">
    
        </div>
      </div>
    </div><br /><br /><br />
    
</asp:Content>

