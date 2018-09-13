using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_RegisterConfirmaspx : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    private void OnRecordDeleting(Object source, SqlDataSourceCommandEventArgs e)
    {
        
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        //try
        //{
        //    //int eidn = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

        //    var data = db.Users.Where(d => d.UserName.Contains().FirstOrDefault());
        //    //var data = db.Members.Where(d => d.UserName == username).FirstOrDefault();
        //    db.Insurances.Remove(data);
        //    db.SaveChanges();

        //    GridView1.EditIndex = -1;

        //    var data1 = db.Insurances.ToList();
        //    GridView1.DataSource = data1;
        //    GridView1.DataBind();

        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);
        //}
        //catch (Exception)
        //{

        //    Literal1.Text = "<script>alert('We can not delete record ...');</script>";
        //}
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
        //{
        //    (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        //}
        //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);

    }


}