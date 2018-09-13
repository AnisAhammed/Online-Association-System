<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ModifyBranchPage.aspx.cs" Inherits="Manager_ModifyBranchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 319px;
            width: 524px;
            margin-left: 80px;
            font-size:15px;
        }
        .auto-style2 {
            background-color: #99CCFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
        <div class="content-box">
              <div class="row">
                <div class="col-sm-2">
      
                </div>
                <div class="col-sm-7" style="background-color:#ecf0f1;">
                 <h2 style="text-align:center;" class="auto-style2">Modify Branch Information</h2><br />
 
        <table class="auto-style1">
            <tr>
                <td>Branch Id:</td>
                <td>
                    <asp:TextBox ID="txtBranchId" runat="server" CssClass="col-xs-offset-0" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Branch Name:</td>
                <td>
                    <asp:TextBox ID="txtBranchName" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Branch Address:</td>
                <td>
                    <asp:TextBox ID="txtBranchAddress" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Mobile Phone:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Height="25px" MaxLength="11" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Height="30px" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                     &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" class="btn btn-warning" Height="30px" OnClick="btnUpdate_Click" Text="Update" Width="100px" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" Height="30px" OnClick="btnDelete_Click" Text="Delete" Width="100px" />
                    &nbsp;
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
            
        </table>
                    <br />
                </div>
                 <div class="col-sm-0" >
      
                </div>
              </div>
            </div>

</asp:Content>

