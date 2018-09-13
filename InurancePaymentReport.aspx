<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="InurancePaymentReport.aspx.cs" Inherits="Manager_InurancePaymentReport" %>

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
         <h2 style="text-align:center;" class="auto-style1">Insurance Payment Report</h2>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="txtSearch" runat="server" Height="28px" Width="170px"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" Width="102px" OnClick="btnSearch_Click" />
&nbsp;<asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <br />
            <br />
            <asp:GridView ID="GridView1" class="table" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IPaymentNo" EmptyDataText="There are no data records to display." Font-Size="15px" ForeColor="#333333" GridLines="None" Width="820px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IPaymentNo" HeaderText="IPaymentNo" InsertVisible="False" ReadOnly="True" SortExpression="IPaymentNo" />
                    <asp:TemplateField HeaderText="Monthly Amount" SortExpression="MonthlyAmount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MonthlyAmount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MonthlyAmount", "৳{0:.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount", "৳{0:.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Insurance" SortExpression="TotalInsurance">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TotalInsurance") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TotalInsurance", "৳{0:.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IPaymentDate" SortExpression="IPaymentDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("IPaymentDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("IPaymentDate", "{0:MMM yyyy,dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="InsuranceId" HeaderText="Insurance Id" SortExpression="InsuranceId" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [InsurancePayment] WHERE [IPaymentNo] = @IPaymentNo" InsertCommand="INSERT INTO [InsurancePayment] ([MonthlyAmount], [Amount], [TotalInsurance], [IPaymentDate], [InsuranceId], [UserName]) VALUES (@MonthlyAmount, @Amount, @TotalInsurance, @IPaymentDate, @InsuranceId, @UserName)" ProviderName="<%$ ConnectionStrings:ProjectDatabaseConnectionString1.ProviderName %>" SelectCommand="SELECT [IPaymentNo], [MonthlyAmount], [Amount], [TotalInsurance], [IPaymentDate], [InsuranceId], [UserName] FROM [InsurancePayment]" UpdateCommand="UPDATE [InsurancePayment] SET [MonthlyAmount] = @MonthlyAmount, [Amount] = @Amount, [TotalInsurance] = @TotalInsurance, [IPaymentDate] = @IPaymentDate, [InsuranceId] = @InsuranceId, [UserName] = @UserName WHERE [IPaymentNo] = @IPaymentNo">
                <DeleteParameters>
                    <asp:Parameter Name="IPaymentNo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MonthlyAmount" Type="Decimal" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="TotalInsurance" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="IPaymentDate" />
                    <asp:Parameter Name="InsuranceId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MonthlyAmount" Type="Decimal" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="TotalInsurance" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="IPaymentDate" />
                    <asp:Parameter Name="InsuranceId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="IPaymentNo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
         <div class="col-sm-1">
      
        </div>
      </div>
    </div><hr/><br/><br/><br/>
</asp:Content>

