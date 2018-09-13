using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class Manager_ReportLoan : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var data = db.Loans.ToArray();

            //create datasource
            ReportDataSource rdc = new ReportDataSource("DataSet1", data);

            //report viewer from tools
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rdc);
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("../Report/") + "LReport.rdlc";
            ReportViewer1.SizeToReportContent = true;
        
        }
    }
}