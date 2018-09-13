<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="AccountApprovalPage.aspx.cs" Inherits="Manager_AccountApprovalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 329px;
            width: 567px;
            margin-left: 120px;
            font-size:15px;
        }
        .auto-style2 {
            width: 132px;
        }
        .auto-style3 {
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
         <h2 style="text-align:center;" class="auto-style3">Modify Account Information</h2><br />

    <table class="auto-style1">
            <tr>
                <td colspan="2">Account Not Approval List:&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select Account---</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Account No:</td>
                <td>
                    <asp:Label ID="lblAccountNo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Start Date:</td>
                <td>
                    <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Status:</td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Approved" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Member Id:</td>
                <td>
                    <asp:Label ID="lblMemberName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Height="30px" Text="Approval" Width="120px" OnClick="btnUpdate_Click" />
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
            <br />
        </div>
         <div class="col-sm-0" style="background-color:gainsboro;">
      
        </div>
      </div>
    </div><br/><br/><br/>
</asp:Content>

