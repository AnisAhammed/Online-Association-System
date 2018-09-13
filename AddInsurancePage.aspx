<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="AddInsurancePage.aspx.cs" Inherits="Manager_AddInsurancePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

         .auto-style1 {
            height: 320px;
            width: 551px;
            margin-left: 100px;
            font-size:15px;
        }
    .auto-style4 {
        background-color: #99CCFF;
    }
        .auto-style5 {
            width: 169px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-box">
      <div class="row">
        <div class="col-sm-2">
      
        </div>
        <div class="col-sm-7" style="background-color:#ecf0f1;">
         <h2 style="text-align:center;" class="auto-style4">Add New Insurance</h2>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">Insurance Id:</td>
                    <td>
                        <asp:Label ID="lblInsuranceId" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Type:</td>
                    <td>
                        <asp:TextBox ID="txtType" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtType" ErrorMessage="Please Enter Insurance Type" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Monthly Amount:</td>
                    <td>
                        <asp:TextBox ID="txtMonthlyAmount" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMonthlyAmount" ErrorMessage="Please Enter Monthly Amount" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Total Insurance:</td>
                    <td>
                        <asp:TextBox ID="txtTotalInsurance" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTotalInsurance" ErrorMessage="Please Enter Total Insurance" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Total Get Insurance:</td>
                    <td>
                        <asp:TextBox ID="txtTotalGetInsurance" runat="server" Height="25px" Width="180px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalGetInsurance" ErrorMessage="Please Enter Total Get Insurance" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style3"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSave" runat="server" Height="30px" class="btn btn-primary" Text="Save" Width="120px" OnClick="btnSave_Click" />
                        &nbsp;
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </td>
                </tr>
                </table>
            <br /> <br />
        </div>
         <div class="col-sm-0" >
      
        </div>
      </div>
    </div><hr/><br/>

</asp:Content>

