<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="LoanPaymentReport.aspx.cs" Inherits="Manager_LoanPaymentReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
         <h2 style="text-align:center;" class="auto-style1">Loan Payment Report</h2>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSearch" runat="server" Height="28px" Width="170px"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" Width="102px" OnClick="btnSearch_Click" />
&nbsp;<asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <br />
            <br />
            <asp:GridView ID="GridView1" class="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LoanPaymentNoId" EmptyDataText="There are no data records to display." Font-Size="15px" ForeColor="#333333" GridLines="None" Width="820px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="LoanPaymentNoId" HeaderText="LoanPaymentNoId" ReadOnly="True" SortExpression="LoanPaymentNoId" />
                    <asp:BoundField DataField="InstallmentNo" HeaderText="Installment No" SortExpression="InstallmentNo" />
                    <asp:TemplateField HeaderText="Installment Amount" SortExpression="InstallmentAmount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InstallmentAmount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("InstallmentAmount", "৳{0:.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Date" SortExpression="PaymentDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PaymentDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PaymentDate", "{0:MMM yyyy,dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LoanId" HeaderText="Loan Id" SortExpression="LoanId" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [LoanPayment] WHERE [LoanPaymentNoId] = @LoanPaymentNoId" InsertCommand="INSERT INTO [LoanPayment] ([InstallmentNo], [InstallmentAmount], [PaymentDate], [LoanId], [UserName]) VALUES (@InstallmentNo, @InstallmentAmount, @PaymentDate, @LoanId, @UserName)" ProviderName="<%$ ConnectionStrings:ProjectDatabaseConnectionString1.ProviderName %>" SelectCommand="SELECT [LoanPaymentNoId], [InstallmentNo], [InstallmentAmount], [PaymentDate], [LoanId], [UserName] FROM [LoanPayment]" UpdateCommand="UPDATE [LoanPayment] SET [InstallmentNo] = @InstallmentNo, [InstallmentAmount] = @InstallmentAmount, [PaymentDate] = @PaymentDate, [LoanId] = @LoanId, [UserName] = @UserName WHERE [LoanPaymentNoId] = @LoanPaymentNoId">
                <DeleteParameters>
                    <asp:Parameter Name="LoanPaymentNoId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="InstallmentNo" Type="Int32" />
                    <asp:Parameter Name="InstallmentAmount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="PaymentDate" />
                    <asp:Parameter Name="LoanId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InstallmentNo" Type="Int32" />
                    <asp:Parameter Name="InstallmentAmount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="PaymentDate" />
                    <asp:Parameter Name="LoanId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="LoanPaymentNoId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
         <div class="col-sm-0">
      
        </div>
      </div>
    </div><hr/><br/><br/><br/>
</asp:Content>

