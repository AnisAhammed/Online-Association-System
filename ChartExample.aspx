<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ChartExample.aspx.cs" Inherits="Manager_ChartExample" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>

        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource2" Width="419px">
                <Series>
                    <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="InstallmentAmount" ChartType="Bubble" YValuesPerPoint="2" YValueMembers="PaymentDate">
                    </asp:Series>
                </Series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" 
        SelectCommand="SELECT * FROM [LoanPayment]"></asp:SqlDataSource>
       
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="419px">
                <Series>
                    <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="LoanId" YValueMembers="LoanAmount">
                    </asp:Series>
                </Series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Width="400px">
                <series>
                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="LoanId" YValueMembers="LoanAmount">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <br />
            <asp:Button ID="btnSaveChart" runat="server" BackColor="#000099" ForeColor="White" OnClick="Button1_Click" Text="Save Chart" />
            <asp:Button ID="btnShowImage" runat="server" OnClick="btnShowImage_Click" Text="Show Image" />
            <br />
            <asp:Image ID="Image1" runat="server" Width="400px" /><br />
            <asp:Image ID="Image2" runat="server" Width="400px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [Loan]"></asp:SqlDataSource>
        </div>
</asp:Content>

