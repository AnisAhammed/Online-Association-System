<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="SavingsAccountApprovalPage.aspx.cs" Inherits="Manager_SavingsAccountApprovalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 338px;
            width: 548px;
            margin-left: 140px;
            font-size:15px;
        }
        .auto-style2 {
            height: 53px;
        }
        .auto-style3 {
            width: 402px;
        }
        .auto-style4 {
            width: 178px;
        }
        .auto-style5 {
            background-color: #99CCFF;
        }
        .auto-style6 {
            height: 53px;
            width: 178px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-box">
      <div class="row">
        <div class="col-sm-2">
      
        </div>
        <div class="col-sm-8" style="background-color:#ecf0f1;">
         <h2 style="text-align:center;" class="auto-style5">Approval Savings Account</h2><br />

    <table class="auto-style1">
            <tr>
                <td class="auto-style4">Savings Account No:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" Width="201px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select Savings Account No--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Savings Account No:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblSavingsAccountNo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Total Savings:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblTotalSavings" runat="server" Text="100"></asp:Label>
                </td>
            </tr>
        <tr>
                <td class="auto-style4">Savings Date:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblSavingsDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Status:</td>
                <td class="auto-style3">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Approved" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                </td>
            </tr>
             <tr>
                <td class="auto-style6">Member Id:</td>
                <td>
                    <asp:Label ID="lblMemberId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Height="30px" Text="Update" Width="140px" OnClick="btnUpdate_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" Height="30px" Text="Delete" Width="140px" OnClick="btnDelete_Click" />
                    &nbsp;
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
            <br />
        </div>
         <div class="col-sm-0" style="background-color:gainsboro;">
      
        </div>
      </div>
    </div><br /><br />
</asp:Content>

