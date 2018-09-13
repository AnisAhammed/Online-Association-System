<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ModifyUserPage.aspx.cs" Inherits="Manager_ModifyUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 278px;
            width: 551px;
            margin-left: 100px;
        }
        .auto-style2 {
            background-color: #99CCFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><div class="container">
      <div class="row"><br />
        <div class="col-sm-0" style="background-color:gainsboro;">
      
        </div>
        <div class="col-sm-6" style="background-color:#EBDEF0;">
         <h2 style="text-align:center;" class="auto-style2">Modify Loan information</h2><br />    
    <table class="auto-style1">
            <tr>
            <td class="auto-style7">User Id:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtUserId" runat="server" Height="25px" Width="200px"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td class="auto-style7">UserName:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtUserName" runat="server" Height="25px" Width="200px"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td class="auto-style7">Password:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtPassword" runat="server" type="password" Height="25px" Width="200px"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td class="auto-style7">Type:</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" Height="25px" Width="200px">
                    <asp:ListItem Value="0">--Select Type---</asp:ListItem>
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Member</asp:ListItem>
                </asp:DropDownList>
            </td>
            </tr>
            <tr>
            <td class="auto-style7">Date of Join:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtDOJ" runat="server" Height="25px" Width="200px"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td class="auto-style7">Phone:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtPhone" runat="server" Height="25px" Width="200px"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp; &nbsp;
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Height="30px" OnClick="btnSearch_Click" Text="Search" Width="110px" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-warning " Height="30px" OnClick="btnUpdate_Click" Text="Update" Width="110px" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" Height="30px" OnClick="btnDelete_Click" Text="Delete" Width="110px" />
&nbsp;
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                &nbsp;</td>
            </tr>
        </table>
            <br />
        </div>
         <div class="col-sm-0" style="background-color:gainsboro;">
      
        </div>
      </div>
    </div><br/><br/><br/>
</asp:Content>

