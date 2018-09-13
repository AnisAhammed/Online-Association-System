using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ListOfUser : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        var data = db.Users.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
           
            var data = db.Users.Where(d => d.UserName == txtSearch.Text).ToList();

            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Type ID!!!')", true);

        }
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        var data = db.Users.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string eidn = GridView1.DataKeys[e.RowIndex].Value.ToString();

            var data = db.Users.Where(d => d.UserName == eidn).FirstOrDefault();
            db.Users.Remove(data);
            db.SaveChanges();

            GridView1.EditIndex = -1;

            var data1 = db.Users.ToList();
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

        var data = db.Users.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }    
}