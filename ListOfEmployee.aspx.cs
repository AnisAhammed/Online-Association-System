using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ListOfEmployee : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = Session["un"].ToString();
        var data = db.Employees.Where(d => d.UserName  == str).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.Employees.Where(d => d.EmployeeId == x).ToList();

            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Type ID!!!')", true);

        }
    }
   
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            var data = db.Employees.Where(d => d.EmployeeId == eidn).FirstOrDefault();
            db.Employees.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;
           

            var data1 = db.Employees.ToList();
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

        var data = db.Employees.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblEmployeeId = (Label)row.FindControl("Label1");
            TextBox txtName = (TextBox)row.FindControl("txtName");
            TextBox txtAddress = (TextBox)row.FindControl("txtAddress");
            TextBox txtPhone = (TextBox)row.FindControl("txtPhone");
            FileUpload fup = (FileUpload)row.FindControl("FileUpload1");
            TextBox txtSalary = (TextBox)row.FindControl("txtSalary");
            TextBox txtJoinDate = (TextBox)row.FindControl("txtJoinDate");
            TextBox txtBranchId = (TextBox)row.FindControl("txtBranchId");


            var data = db.Employees.Where(d => d.EmployeeId == eidn).FirstOrDefault();

            data.Name = txtName.Text;
            data.Address = txtAddress.Text;
            data.Phone = txtPhone.Text;
            if (fup.HasFile)
            {
                data.Photo = fup.FileName;
            }
            data.Salary = decimal.Parse(txtSalary.Text);
            data.JoinDate = DateTime.Parse(txtJoinDate.Text);
            data.BranchId = Int32.Parse(txtBranchId.Text);


            db.SaveChanges();

            GridView1.EditIndex = -1;
           

            var data1 = db.Employees.ToList();
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

        var data = db.Employees.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.Employees.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
}