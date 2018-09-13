<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ModifyAddInsurancePage.aspx.cs" Inherits="Manager_ModifyAddInsurancePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .auto-style1 {
            height: 322px;
            width: 551px;
            margin-left: 100px;
            font-size:15px;
        }             
        .auto-style2 {
            width: 154px;
            text-align: left;
        }
        .auto-style4 {
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
         <h2 style="text-align:center;" class="auto-style4">Modify Add Insurance</h2><br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Insurance Id:</td>
                    <td>
                        <asp:TextBox ID="txtId" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Insurance Type:</td>
                    <td>
                        <asp:TextBox ID="txtType" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Monthly Amount:</td>
                    <td>
                        <asp:TextBox ID="txtMonthlyAmount" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Total Insurance:</td>
                    <td>
                        <asp:TextBox ID="txtTotalInsurance" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Total Get Insurance:&nbsp;&nbsp;&nbsp; </td>
                    <td>
                        <asp:TextBox ID="txtTotalGetInsurance" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style3"><br />&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Height="30px" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                     &nbsp;&nbsp;&nbsp; <asp:Button ID="btnUpdate" runat="server" class="btn btn-warning" Height="30px" OnClick="btnUpdate_Click" Text="Update" Width="100px" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" Height="30px" OnClick="btnDelete_Click" Text="Delete" Width="100px" />
                    &nbsp;&nbsp;
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                &nbsp;</td>
                </tr>
                </table>
            <br />
        </div>
         <div class="col-sm-0">
      
        </div>
      </div>
    </div><hr/><br/><br/><br/>
</asp:Content>

