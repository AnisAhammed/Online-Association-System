using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_UserInsertPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        try
        {
            User us = new User();

            us.UserName = txtUserName.Text;
            us.Password = txtPassword.Text;
            us.Type = DropDownList1.SelectedValue;
            us.Email = txtEmail.Text;
            if (DropDownList1.SelectedIndex == 0)
            {
                Literal1.Text = "<script>alert('Please select Branch !!!');</script>";
                return;
            }

            if (FileUpload1.HasFile)
            {
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                Session["Pic"] = FileUpload1.FileName;

                if (extension == ".jpg" || extension == ".gif")
                {
                    if (FileUpload1.PostedFile.ContentLength < (5000 * 1024))
                    {
                        us.Photo = FileUpload1.FileName;
                        FileUpload1.SaveAs(Server.MapPath("../Upload/") + Session["pic"]);

                        Image1.ImageUrl = "../Upload/" + Session["pic"];
                    }
                    else
                    {
                        Literal1.Text = "<script>alert('Please select below 500 Kb !!!');</script>";
                        return;
                    }
                }
                else
                {
                    Literal1.Text = "<script>alert('Please select jpg or gif file !!!');</script>";
                    return;
                }

            }


            db.Users.Add(us);
            db.SaveChanges();
            

            Literal1.Text = "<script>alert('Data Save Successfully ...');</script>";
            Session["un"]= us.UserName;

            //Response.Redirect("./EmployeeInsertPage.aspx");


            txtUserName.Text = "";
            txtPassword.Text = "";
            DropDownList1.SelectedIndex = -1;
            txtEmail.Text = "";
            Image1.ImageUrl = "";


        }
        catch (Exception)
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Another UserName Enter !!!')", true);
        }
    }
    
}