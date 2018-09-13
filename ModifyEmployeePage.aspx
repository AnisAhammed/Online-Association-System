<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ModifyEmployeePage.aspx.cs" Inherits="Manager_ModifyEmployeePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 501px;
            height: 400px;
            margin-left: 100px;
            font-size:15px;
        }
        .auto-style5 {

        }
        .auto-style6 {
            background-color: #99CCFF;
        }
    </style>
    <script>
        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.x').
                        attr('src', e.target.result)
                    .width(150);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#FileUpload1").change(function () {
            readURL(this);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-box">
      <div class="row">
        <div class="col-sm-2">
      
        </div>
        <div class="col-sm-7" style="background-color:#ecf0f1;">
         <h2 style="text-align:center;" class="auto-style6">Modify Employee Information</h2><br />

        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Employee Id:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmployeeId" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Employee Name:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtName" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Employee Address:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAddress" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Mobile Phone:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Photo:</td>
                <td class="auto-style3">
                    <asp:Image ID="Image1" runat="server" Width="100px" CssClass="x" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5">
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Salary:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtSalary" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Date of Join:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtDOJ" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Branch Id:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" Height="25px" Width="200px">
                        <asp:ListItem Value="0">-- Select Department --</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Height="30px" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                    &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-warning" Height="30px" OnClick="btnUpdate_Click" Text="Update" Width="100px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" Height="30px" OnClick="btnDelete_Click" Text="Delete" Width="100px" />
                    <br />
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
            <br />
        </div>
         <div class="col-sm-0" >
      
        </div>
      </div>
    </div><hr /><br /><br /><br /><br />
</asp:Content>

