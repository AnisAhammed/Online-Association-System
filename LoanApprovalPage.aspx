<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="LoanApprovalPage.aspx.cs" Inherits="Manager_LoanApprovalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .auto-style3 {
             width: 560px;
            height: 400px;
            margin-left: 100px;
            font-size:15px;
         }
        .auto-style4 {
            background-color: #99CCFF;
        }
        .auto-style6 {
            width: 168px;
            height: 47px;
            font-size: 16px;
        }
        .auto-style7 {
            height: 47px;
        }
        .auto-style8 {
            width: 168px;
            font-size: 16px;
        }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-box">
      <div class="row">
        <div class="col-sm-2">
      
        </div>
        <div class="col-sm-7" style="background-color:#ecf0f1;">
         <h2 style="text-align:center;" class="auto-style4">Add New Loan</h2>
            <br />

    <table class="auto-style3">
            <tr>
                <td class="auto-style8">Loan Id:</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="160px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Selected Id--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>          
            <tr>
                <td class="auto-style8">Loan Id:</td>
                <td class="auto-style1">
                    <asp:Label ID="lblLoanId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Loan Amount:</td>
                <td>
                    <asp:Label ID="lblLoanAmount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Installment Amount:</td>
                <td>
                    <asp:Label ID="lblInstallmentAmount" runat="server"></asp:Label>
                </td>
            </tr>            
            <tr>
                <td class="auto-style8">Status<strong>:</strong></td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Approved" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Member Id: </td>
                <td class="auto-style7">
                    <asp:Label ID="lblMemberId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                    &nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" Height="30px" Text="Update" Width="140px" OnClick="btnUpdate_Click" />
                    &nbsp;&nbsp;
                    &nbsp;
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
            <br />
        </div>
         <div class="col-sm-0">
      
        </div>
      </div>
    </div>
</asp:Content>

