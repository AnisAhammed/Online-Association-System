<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="RegisterConfirm.aspx.cs" Inherits="Manager_RegisterConfirmaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.12.4.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
   

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
            background-color: #99CCFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-box">
      <div class="row">
        <div class="col-sm-1">
      
        </div>
        <div class="col-sm-10" style="background-color:#ecf0f1;">
         <h2 style="text-align:center;" class="auto-style1">Confirm Register</h2><br />
    
             <asp:GridView ID="GridView1" class="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="UserName" EmptyDataText="&lt;script&gt;alert('Record Cant Not Delete!!!');&lt;/script&gt;" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" ShowHeaderWhenEmpty="True" Width="810px" Font-Size="15px" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Edit &amp; Dalete" />
                     <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                     <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                     <asp:TemplateField HeaderText="Type" SortExpression="Type">
                         <EditItemTemplate>
                             <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Type") %>' AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Role" DataValueField="Role">
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" SelectCommand="SELECT [Role] FROM [AddRole]"></asp:SqlDataSource>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                     <asp:TemplateField HeaderText="Photo" SortExpression="Photo">
                         <ItemTemplate>                           
                             <asp:Image ID="Image1" Width="80px" runat="server" ImageUrl= '<%# Bind("Photo","../Upload/{0}") %>' />
                             &nbsp;
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                 <EditRowStyle BackColor="#7C6F57" />
                 <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                 <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Next " PreviousPageText="Previous" />
                 <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#E3EAEB" />
                 <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F8FAFA" />
                 <SortedAscendingHeaderStyle BackColor="#246B61" />
                 <SortedDescendingCellStyle BackColor="#D4DFE1" />
                 <SortedDescendingHeaderStyle BackColor="#15524A" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [User] WHERE [UserName] = @UserName" InsertCommand="INSERT INTO [User] ([UserName], [Password], [Type], [Email], [Photo]) VALUES (@UserName, @Password, @Type, @Email, @Photo)" SelectCommand="SELECT [UserName], [Password], [Type], [Email], [Photo] FROM [User]" UpdateCommand="UPDATE [User] SET [Password] = @Password, [Type] = @Type, [Email] = @Email, [Photo] = @Photo WHERE [UserName] = @UserName">
                 <DeleteParameters>
                     <asp:Parameter Name="UserName" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="UserName" Type="String" />
                     <asp:Parameter Name="Password" Type="String" />
                     <asp:Parameter Name="Type" Type="String" />
                     <asp:Parameter Name="Email" Type="String" />
                     <asp:Parameter Name="Photo" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="Password" Type="String" />
                     <asp:Parameter Name="Type" Type="String" />
                     <asp:Parameter Name="Email" Type="String" />
                     <asp:Parameter Name="Photo" Type="String" />
                     <asp:Parameter Name="UserName" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>
 
        </div>
         <div class="col-sm-0">
      
        </div>
      </div>
    </div><hr/><br/>
</asp:Content>

