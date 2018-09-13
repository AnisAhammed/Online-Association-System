using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_InurancePaymentReport : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        var data = db.InsurancePayments.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.InsurancePayments.Where(d => d.InsuranceId == x).ToList();

            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Type ID!!!')", true);

        }
    }
}