using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AccountReportPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var data = db.MAccounts.Where(m => m.Status != "Approved").ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.MAccounts.Where(d => d.AccountNo == x).ToList();

            GridView1.DataSource = data;
            GridView1.DataBind();

        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Type ID!!!')", true);
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            var data = db.MAccounts.Where(d => d.AccountNo == eidn).FirstOrDefault();
            db.MAccounts.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.MAccounts.ToList();
            GridView1.DataSource = data1;
            GridView1.DataBind();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);
        }
        catch (Exception)
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('We can not delete record ...')", true);
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        var data = db.MAccounts.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label txtAccountNo = (Label)row.FindControl("txtAccountNo");
            TextBox txtBalance = (TextBox)row.FindControl("txtBalance");


            var data = db.MAccounts.Where(d => d.AccountNo == eidn).FirstOrDefault();

            data.Balance = decimal.Parse(txtBalance.Text);


            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.MAccounts.ToList();
            GridView1.DataSource = data1;
            GridView1.DataBind();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Successfully!!!')", true);
        }
        catch (Exception ex1)
        {
            Literal1.Text = ex1.Message;
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;

        var data = db.MAccounts.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.MAccounts.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
}