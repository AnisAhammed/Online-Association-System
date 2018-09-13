<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/ManagerMasterPage.master" AutoEventWireup="true" CodeFile="ChartReportPayment.aspx.cs" Inherits="Manager_ChartReport" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            margin-left: 0px;
            background-color: #99CCFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="text-center">
        <h3 class="auto-style1">Member Loan</h3>

        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3" Width="560px" Height="333px">
                <Series>
                    <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="PaymentDate" YValueMembers="InstallmentAmount">
                    </asp:Series>
                </Series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDatabaseConnectionString1 %>" SelectCommand="SELECT [InstallmentAmount], [PaymentDate] FROM [LoanPayment]"></asp:SqlDataSource>
            
            <br />

        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource3" Width="560px" Height="333px">
                <Series>
                    <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="PaymentDate" YValueMembers="InstallmentAmount" ChartType="Line">
                    </asp:Series>
                </Series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            
        <br />
            
            <br />
            <asp:Button ID="btnSaveChart" class="btn btn-primary" runat="server" ForeColor="Black" OnClick="Button1_Click" Text="Save Chart" Height="30px" Width="120px" />
            <asp:Button ID="btnShowImage" class="btn btn-warning" runat="server" OnClick="btnShowImage_Click" Text="Show Image" Height="30px" Width="120px" ForeColor="Black" />
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Width="340px" />
        
        &nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" Width="340px" />
        
        </div>

</asp:Content>

