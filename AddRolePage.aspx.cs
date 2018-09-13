using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AddRolePage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["un"] == null)
        {
            Response.Redirect("./Default.aspx");
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            AddRole ar = new AddRole();

            ar.Role = txtRole.Text;


            ar.UserName = Session["un"].ToString();

            db.AddRoles.Add(ar);
            db.SaveChanges();

            lblId.Text = ar.Id.ToString();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data Save Sucessfully!!!')", true);


            lblId.Text = "";
            txtRole.Text = "";

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;
        }
    }
}