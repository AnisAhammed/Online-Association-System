using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_TransactionReport : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        var data = db.Transactions.Where(m => m.Type != "Withdraw").ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();

        var data1 = db.Transactions.Where(m => m.Type != "Deposit").ToList();
        GridView2.DataSource = data1;
        GridView2.DataBind();
    }
}