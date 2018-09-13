using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ManagerMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {        

        if (Session["un"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        else
        {
            ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
            lblUser.Text = Session["un"].ToString();

            var pic = db.Users.Where(d => d.UserName == lblUser.Text).FirstOrDefault().Photo;
            Image1.ImageUrl = "../Upload/" + pic;
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["un"] = null;
        Response.Redirect("~/Account/Login.aspx");
    }
}
