<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="BranchInsertPage.aspx.cs" Inherits="Manager_BranchInsertPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style2 {
            width: 688px;
        }
        .auto-style3 {
            width: 200px;
        }
        .auto-style4 {
            height: 301px;
            width: 551px;
            margin-left: 120px;
            font-size:15px;
        }
        .auto-style5 {
            background-color: #99CCFF;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

               <div class="content-box">    
                          <div class="row">
                                <div class="col-sm-2">
            
                                </div>
                                <div class="col-sm-8" style="background-color:#ecf0f1;">
                                    <h2 style="text-align:center;" class="auto-style5">Add New Branch</h2>
                              
                                <table class="auto-style4">
                                    <tr>
                                        <td class="auto-style3">Branch Id:</td>
                                        <td class="auto-style2" colspan="1">
                                            <asp:Label ID="lblBranchId" runat="server" Height="25px" Width="120px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Branch Name:</td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="txtBranchName" runat="server" Height="25px" Width="200px"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="regBranchName" runat="server" ControlToValidate="txtBranchName" ErrorMessage="You Must Type Name" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Branch Address:</td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="txtBranchAddress" runat="server" Height="25px" Width="200px"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="regBranchAddress" runat="server" ControlToValidate="txtBranchAddress" ErrorMessage="You Must Type Address" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Mobile Phone:</td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="txtPhone" runat="server" Height="25px" MaxLength="11" Width="200px"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="regMobilePhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please Enter Phone No" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Email:</td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="txtEmail" runat="server" Height="25px" Width="200px"></asp:TextBox>            
                                            <br />
                                            <asp:RegularExpressionValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Font-Size="12px"></asp:RegularExpressionValidator>
                                           </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnInsert" runat="server" class="btn btn-primary" Height="30px" OnClick="btnInsert_Click" Text="Save" Width="120px" />
                                            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                        </td>
                                    </tr>            
                                </table>
                                    <br /><br />
      
                                </div>
                                 <div class="col-sm-0">
      
                                </div>
                              </div>
             </div>

						
</asp:Content>

