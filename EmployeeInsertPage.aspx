<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeInsertPage.aspx.cs" Inherits="Manager_EmployeeInsertPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.4.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
   
    <script>
        $(function () {
            $("#ContentPlaceHolder1_txtDOJ").datepicker();
        });
    </script>


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
    <style type="text/css">
        .auto-style1 {
            width: 171px;
        }

        .auto-style4 {
            height: 320px;
            width: 551px;
            margin-left: 60px;
            font-size:15px;
        }

        .auto-style8 {
            background-color: #99CCFF;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-box">
        <div class="row">
            <div class="col-sm-3">

            </div>
            <div class="col-sm-6" style="background-color: #ecf0f1;">
                <h2 style="text-align: center;" class="auto-style8">Add New Employee</h2>
                <br />
                <table class="auto-style4">
                    <tr>
                        <td class="auto-style1">Employee Id:</td>
                        <td class="auto-style3">
                            <asp:Label ID="lblEmpId" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Employee Name:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtName" runat="server" Width="180px"></asp:TextBox>
                            <br />
                            &nbsp;<asp:RequiredFieldValidator ID="regEmployeeName" runat="server" ControlToValidate="txtName" ErrorMessage="You Must Type Name" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Employee Address:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtAddress" runat="server" Width="180px"></asp:TextBox>
                            <br />
                            &nbsp;<asp:RequiredFieldValidator ID="regEmployeeAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="You Must Type Address" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Mobile Phone:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" Width="180px"></asp:TextBox>
                            <br />
                            &nbsp;<asp:RequiredFieldValidator ID="regMobilePhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please Enter Phone No" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Photo:</td>
                        <td class="auto-style3">
                            <asp:Image ID="Image1" runat="server" Width="100px" CssClass="x" />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9"></td>
                        <td class="auto-style10">
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" />
                            &nbsp;<asp:RequiredFieldValidator ID="regPhoto" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please Upload Photo" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Salary:</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtSalary" runat="server" Width="180px"></asp:TextBox>
                            &nbsp;&nbsp;
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSalary" ErrorMessage="Please Enter Salary" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtSalary" ErrorMessage="Not negative value Enter" Font-Size="12px" ForeColor="#FF0066" MaximumValue="100000" MinimumValue="1" Type="Currency"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Date of Join:</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtDOJ" runat="server" Width="180px" class="anis"></asp:TextBox>
                            &nbsp;<br />
                            <asp:CompareValidator ID="comDOJ" runat="server" ControlToValidate="txtDOJ" ErrorMessage="Please Enter Date of Join" ForeColor="Red" Operator="DataTypeCheck" Type="Date" Font-Size="12px"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Branch Id:</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" Height="25px">
                                <asp:ListItem Value="0">-- Select Branch Name --</asp:ListItem>
                            </asp:DropDownList>
                        &nbsp;<br />
                            <asp:RequiredFieldValidator ID="regBranchId" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please select Branch Name" ForeColor="Red" InitialValue="0" Font-Size="12px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnInsert" runat="server" class="btn btn-primary" OnClick="btnInsert_Click" Text="Save" Width="127px" Height="31px" />
                            &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
                <br />

            </div>
            <div class="col-sm-0">
            </div>
        </div>
    </div><hr /><br /><br /><br /><br />

</asp:Content>

