using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_BranchInsertPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["un"] == null)
        {
            Response.Redirect("./Default.aspx");
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        try
        {
            Branch brch = new Branch();
            
                brch.Name = txtBranchName.Text;
                brch.Address = txtBranchAddress.Text;
                brch.Phone = txtPhone.Text;
                brch.Email = txtEmail.Text;

            brch.UserName = Session["un"].ToString();

            db.Branches.Add(brch);
            db.SaveChanges();

            lblBranchId.Text = brch.BranchId.ToString();

           ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data Save Sucessfully!!!')", true);

           
            lblBranchId.Text = "";
            txtBranchName.Text = "";
            txtBranchAddress.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;
        }
    }

}