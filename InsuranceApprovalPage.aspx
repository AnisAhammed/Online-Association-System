<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="InsuranceApprovalPage.aspx.cs" Inherits="Manager_InsuranceApprovalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 498px;
            height: 375px;
            margin-left: 120px;
            font-size:15px;
        }
    .auto-style2 {
            width: 161px;
        }
        .auto-style3 {
            background-color: #99CCFF;
        }
        .auto-style4 {
            width: 161px;
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
         <h2 style="text-align:center;" class="auto-style3">Insurance Account Approval</h2><br />

    <table class="auto-style1">
            <tr>
                            <td class="auto-style4">Not Approval List:</td>
                            <td class="auto-style8">
                                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="140px">
                                    <asp:ListItem Value="0">--Select Insurance Id--</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
            <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style8">
                                &nbsp;</td>
                        </tr>
            <tr>
                            <td class="auto-style4">Insurance Id:</td>
                            <td class="auto-style8">
                                <asp:Label ID="lblInsuranceId" runat="server"></asp:Label>
                            </td>
                        </tr>
            <tr>
                            <td class="auto-style4">Type:</td>
                            <td class="auto-style8">
                                <asp:Label ID="lblInsuranceType" runat="server"></asp:Label>
                            </td>
                        </tr>
            <tr>
                            <td class="auto-style4">Monthly Amount:</td>
                            <td class="auto-style8">
                                <asp:Label ID="lblMonthlyAmount" runat="server"></asp:Label>
                            </td>
                        </tr>
            <tr>
                            <td class="auto-style4">Total Insurance:</td>
                            <td class="auto-style8">
                                <asp:Label ID="lblTotalIsurance" runat="server"></asp:Label>
                            </td>
                        </tr>
            <tr>
                            <td class="auto-style4">Status:</td>
                            <td class="auto-style8">                         
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Approved" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                            </td>
                        </tr>
            <tr>
                <td class="auto-style4">Member Id:</td>
                <td>
                    <asp:Label ID="lblMemberId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary " Height="30px" Text="Update" Width="140px" OnClick="btnUpdate_Click" />
                    &nbsp;
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
    </div><hr/><br/>
</asp:Content>

