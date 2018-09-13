<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="AddRolePage.aspx.cs" Inherits="Manager_AddRolePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 112px;
            margin-left: 100px;
            font-size:15px;
            width: 439px;
        }
        .auto-style5 {
            background-color: #99CCFF;
        }

        .auto-style6 {
            height: 24px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-box">
      <div class="row">
        <div class="col-sm-3" >
      
        </div>
        <div class="col-sm-6" style="background-color:#ecf0f1;">
         <h2 style="text-align:center;" class="auto-style5">Add New Role</h2><br />
            <table class="auto-style3">
                <tr>
                    <td class="auto-style6">Role Id:</td>
                    <td class="auto-style6">
                        <asp:Label ID="lblId" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtRole" runat="server" Height="26px" Width="200px"></asp:TextBox>
                    &nbsp;<br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRole" ErrorMessage="Please Enter Role" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">&nbsp;&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-primary" Text="Add" Width="116px" Height="30px" OnClick="btnAdd_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        &nbsp;<br />
                        <br />
                    </td>
                </tr>
            </table>
            <br />

        </div>
         <div class="col-sm-2" >
      
        </div>
      </div>
    </div><hr/><br/>
</asp:Content>

