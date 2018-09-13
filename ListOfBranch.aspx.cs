using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ListOfBranch : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        var data = db.Branches.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.Branches.Where(d => d.BranchId == x).ToList();

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

            var data = db.Branches.Where(d => d.BranchId == eidn).FirstOrDefault();
            db.Branches.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Delete Sucessfully!!!')", true);

            var data1 = db.Branches.ToList();
            GridView1.DataSource = data1;
            GridView1.DataBind();
        }
        catch (Exception)
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('We can not delete record ...')", true);
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        var data = db.Branches.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblBranchId = (Label)row.FindControl("Label1");
            TextBox txtName = (TextBox)row.FindControl("txtName");
            TextBox txtAddress = (TextBox)row.FindControl("txtAddress");
            TextBox txtPhone = (TextBox)row.FindControl("txtPhone");
            TextBox txtEmail = (TextBox)row.FindControl("txtEmail");


            var data = db.Branches.Where(d => d.BranchId == eidn).FirstOrDefault();

            data.Name = txtName.Text;
            data.Address = txtAddress.Text;
            data.Phone = txtPhone.Text;
            data.Email = txtEmail.Text;


            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.Branches.ToList();
            GridView1.DataSource = data1;
            GridView1.DataBind();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Sucessfully!!!')", true);
        }
        catch (Exception ex1)
        {
            Literal1.Text = ex1.Message;
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;

        var data = db.Branches.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.Branches.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
}