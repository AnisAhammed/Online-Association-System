<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ModifyMemberPage.aspx.cs" Inherits="Manager_ModifyMemberPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 461px;
            width: 702px;
            margin-left: 140px;
            font-size:15px;
        }
        .auto-style20 {
            background-color: #99CCFF;
        }

        .auto-style21 {
            height: 40px;
        }

        .auto-style22 {
            height: 40px;
            width: 340px;
        }
        .auto-style23 {
            height: 40px;
            width: 109px;
        }

        .auto-style24 {
            height: 67px;
        }
        .auto-style25 {
            height: 69px;
        }

        .auto-style26 {
            font-size: 16px;
        }
        .auto-style27 {
            height: 40px;
            width: 109px;
            font-size: 16px;
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
                <div class="col-sm-2" >
      
                </div>
                <div class="col-sm-8" style="background-color:#ecf0f1;">
                 <h2 style="text-align:center;" class="auto-style20">Member Approval</h2>

        <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style24"><span class="auto-style26">Not Approval List:&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp; &nbsp;           
                    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Height="25px" Width="180px">
                        <asp:ListItem Value="0">--Select Member Id--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">Member Id:</td>
                <td class="auto-style22">           
                    <asp:Label ID="lblMemberId" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">Member Name:</td>
                <td class="auto-style27">
                    <asp:Label ID="lblMemberName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style27">Photo:</td>
                <td class="auto-style21">
                    <asp:Image ID="Image1" runat="server" Width="100px" CssClass="x" />
                </td>
            </tr>
            <tr>
                <td class="auto-style23">Phone:</td>
                <td class="auto-style5">
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">Address:</td>
                <td class="auto-style5">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">Status:</td>
                <td class="auto-style5">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Approved" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />                    
&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style25">    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary " Height="30px" Text="Approval" Width="120px" OnClick="btnUpdate_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" class="btn btn-danger" Height="30px" Text="Delete" Width="120px" OnClick="btnDelete_Click" />
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
            </div><hr/>
</asp:Content>

