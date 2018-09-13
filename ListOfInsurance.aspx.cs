using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ListOfInsurance : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var data = db.Insurances.Where(m => m.Status != "Approved").ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.Insurances.Where(d => d.InsuranceId == x).ToList();

            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Type ID!!!')", true);

        }
    }

    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.Insurances.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            var data = db.Insurances.Where(d => d.InsuranceId == eidn).FirstOrDefault();
            db.Insurances.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.Insurances.ToList();
            GridView1.DataSource = data1;
            GridView1.DataBind();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);
        }
        catch (Exception)
        {

            Literal1.Text = "<script>alert('We can not delete record ...');</script>";
        }
    }

    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        var data = db.Insurances.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }
}