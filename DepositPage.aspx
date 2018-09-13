<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="DepositPage.aspx.cs" Inherits="Manager_DepositPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br /><br /><br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong1">
      Savings Payment Deposit
    </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
<!-- Modal -->
<div class="modal fade" id="exampleModalLong1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:800px;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle1">Deposit Report</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="SavingsId" EmptyDataText="There are no data records to display." AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="748px" Font-Size="15px">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="SavingsId" HeaderText="SavingsId" ReadOnly="True" SortExpression="SavingsId" />
                  <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Amount", "৳{0:.00}") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                  <asp:TemplateField HeaderText="Date" SortExpression="Date">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date","{0:MMM yyyy,dd}") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="SavingsAccountNo" HeaderText="Savings Account No" SortExpression="SavingsAccountNo" />
                  <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView>
              
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [Savings] WHERE [SavingsId] = @SavingsId" InsertCommand="INSERT INTO [Savings] ([Amount], [Type], [Date], [SavingsAccountNo], [MemberId], [UserName]) VALUES (@Amount, @Type, @Date, @SavingsAccountNo, @MemberId, @UserName)" ProviderName="<%$ ConnectionStrings:ProjectDatabaseConnectionString1.ProviderName %>" SelectCommand="SELECT [SavingsId], [Amount], [Type], [Date], [SavingsAccountNo], [MemberId], [UserName] FROM [Savings]" UpdateCommand="UPDATE [Savings] SET [Amount] = @Amount, [Type] = @Type, [Date] = @Date, [SavingsAccountNo] = @SavingsAccountNo, [MemberId] = @MemberId, [UserName] = @UserName WHERE [SavingsId] = @SavingsId">
              <DeleteParameters>
                  <asp:Parameter Name="SavingsId" Type="Int32" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="Amount" Type="Decimal" />
                  <asp:Parameter Name="Type" Type="String" />
                  <asp:Parameter DbType="Date" Name="Date" />
                  <asp:Parameter Name="SavingsAccountNo" Type="Int32" />
                  <asp:Parameter Name="MemberId" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="Amount" Type="Decimal" />
                  <asp:Parameter Name="Type" Type="String" />
                  <asp:Parameter DbType="Date" Name="Date" />
                  <asp:Parameter Name="SavingsAccountNo" Type="Int32" />
                  <asp:Parameter Name="MemberId" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
                  <asp:Parameter Name="SavingsId" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>
                
      </div>
      <div class="modal-footer">
       <asp:Button ID="Button1" runat="server" Text="Close" class="btn btn-primary" data-dismiss="modal" aria-label="Close"/>
      </div>
    </div>
  </div>

</div>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
      Savings Payment Withdraw
    </button>

    <!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:800px;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Deposit Report</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

          <asp:GridView ID="GridView2" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="SavingsId" EmptyDataText="There are no data records to display." AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="748px" Font-Size="15px">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="SavingsId" HeaderText="SavingsId" ReadOnly="True" SortExpression="SavingsId" />
                  <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Amount", "৳{0:.00}") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                  <asp:TemplateField HeaderText="Date" SortExpression="Date">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date","{0:MMM yyyy,dd}") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="SavingsAccountNo" HeaderText="Savings Account No" SortExpression="SavingsAccountNo" />
                  <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [Savings] WHERE [SavingsId] = @SavingsId" InsertCommand="INSERT INTO [Savings] ([Amount], [Type], [Date], [SavingsAccountNo], [MemberId], [UserName]) VALUES (@Amount, @Type, @Date, @SavingsAccountNo, @MemberId, @UserName)" ProviderName="<%$ ConnectionStrings:ProjectDatabaseConnectionString1.ProviderName %>" SelectCommand="SELECT [SavingsId], [Amount], [Type], [Date], [SavingsAccountNo], [MemberId], [UserName] FROM [Savings]" UpdateCommand="UPDATE [Savings] SET [Amount] = @Amount, [Type] = @Type, [Date] = @Date, [SavingsAccountNo] = @SavingsAccountNo, [MemberId] = @MemberId, [UserName] = @UserName WHERE [SavingsId] = @SavingsId">
              <DeleteParameters>
                  <asp:Parameter Name="SavingsId" Type="Int32" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="Amount" Type="Decimal" />
                  <asp:Parameter Name="Type" Type="String" />
                  <asp:Parameter DbType="Date" Name="Date" />
                  <asp:Parameter Name="SavingsAccountNo" Type="Int32" />
                  <asp:Parameter Name="MemberId" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="Amount" Type="Decimal" />
                  <asp:Parameter Name="Type" Type="String" />
                  <asp:Parameter DbType="Date" Name="Date" />
                  <asp:Parameter Name="SavingsAccountNo" Type="Int32" />
                  <asp:Parameter Name="MemberId" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
                  <asp:Parameter Name="SavingsId" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>


      </div>
      <div class="modal-footer">
       <asp:Button ID="Button2" runat="server" Text="Close" class="btn btn-primary" data-dismiss="modal" aria-label="Close"/>
      </div>
    </div>
  </div>
</div><hr /><br /><br /><br /><br />

</asp:Content>

