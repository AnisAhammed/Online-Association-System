using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ListOfMember : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var data = db.Members.Where(m => m.Status != "Approved").ToList();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtSearch.Text);
            var data = db.Members.Where(d => d.MemberId == x).ToList();

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

            var data = db.Members.Where(d => d.MemberId == eidn).FirstOrDefault();
            db.Members.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;        

            var data1 = db.Members.ToList();
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

        var data = db.Members.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("Label1");
            TextBox txtName = (TextBox)row.FindControl("txtFirstName");
            TextBox txtLastName = (TextBox)row.FindControl("txtLastName");
            TextBox txtFName = (TextBox)row.FindControl("txtFatherName");
            TextBox txtMName = (TextBox)row.FindControl("txtMotherName");
            TextBox txtDate = (TextBox)row.FindControl("txtDOB");
            TextBox txtGender = (TextBox)row.FindControl("txtGender");
            FileUpload fup = (FileUpload)row.FindControl("FileUpload1");
            TextBox txtNidno = (TextBox)row.FindControl("txtNIdNo");
            TextBox txtPhone = (TextBox)row.FindControl("txtPhone");
            TextBox txtMregFee = (TextBox)row.FindControl("txtMRegFee");
            TextBox txtAddress = (TextBox)row.FindControl("txtAddress");
            TextBox txtStatus = (TextBox)row.FindControl("txtStatus");

            var data = db.Members.Where(d => d.MemberId == eidn).FirstOrDefault();

            data.FirstName = txtName.Text;
            data.LastName = txtLastName.Text;
            data.FatherName = txtFName.Text;
            data.MotherName = txtMName.Text;
            data.DOB = DateTime.Parse(txtDate.Text);
            data.Gender = txtGender.Text;
            if (fup.HasFile)
            {
                data.Photo = fup.FileName;
            }
            data.NIdNo = txtNidno.Text;
            data.Phone = txtPhone.Text;
            data.MRegFee = decimal.Parse(txtMregFee.Text);
            data.Address = txtAddress.Text;
            data.Status = txtStatus.Text;


            db.SaveChanges();

            GridView1.EditIndex = -1;
            

            var data1 = db.Members.ToList();
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

        var data = db.Members.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.Members.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
}