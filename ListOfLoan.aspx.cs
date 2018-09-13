using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ListOfLoan : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var data = db.Loans.Where(m => m.Status != "Approved").ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.Loans.Where(d => d.LoanId == x).ToList();

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

            var data = db.Loans.Where(d => d.LoanId == eidn).FirstOrDefault();
            db.Loans.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.Loans.ToList();
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

        var data = db.Loans.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblLoanId = (Label)row.FindControl("Label1");
            TextBox txtLoanAmount = (TextBox)row.FindControl("txtLoanAmount");
            TextBox txtInstallmentNo = (TextBox)row.FindControl("txtInstallmentNo");
            TextBox txtInstallmentAmount = (TextBox)row.FindControl("txtInstallmentAmount");
            TextBox txtLoanDate = (TextBox)row.FindControl("txtLoanDate");


            var data = db.Loans.Where(d => d.LoanId == eidn).FirstOrDefault();

            data.LoanAmount = decimal.Parse(txtLoanAmount.Text);
            data.InstallmentNo = Int32.Parse(txtInstallmentNo.Text);
            data.InstallmentAmount = decimal.Parse(txtInstallmentAmount.Text);
            data.LoanDate = DateTime.Parse(txtLoanDate.Text);


            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.Loans.ToList();
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

        var data = db.Loans.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.Loans.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
}