using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ModifyUserPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = db.Users.ToList();
            DropDownList1.DataTextField = "Type";
            DropDownList1.DataValueField = "Type";
            DropDownList1.DataBind();


            try
            {
                string idn = Request.QueryString["id"];

                var data = db.Users.Where(d => d.UserName == idn).FirstOrDefault();

                if (data != null)
                {
                    txtUserId.Text = idn.ToString();
                    txtUserName.Text = data.UserName;
                    txtPassword.Text = data.Password;
                    DropDownList1.SelectedValue = data.Type;
                   

                    Literal1.Text = "";
                }
            }
            catch (Exception)
            {

            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
       
        var data = db.Users.Where(d => d.UserName == txtUserId.Text).FirstOrDefault();

        if (data != null)
        {
            
            txtUserName.Text = data.UserName;
            txtPassword.Text = data.Password;
            DropDownList1.SelectedValue = data.Type;
           
        }
        else
        {
            Literal1.Text = "<script>alert('Not Found !!!');</script>";
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
           
            var data = db.Users.Where(d => d.UserName== txtUserId.Text).FirstOrDefault();

            if (data != null)
            {
               
                data.UserName = txtUserName.Text;
                data.Password = txtPassword.Text;
                data.Type = DropDownList1.SelectedValue;
              

                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Successfully!!!')", true);

                txtUserId.Text = "";
                txtUserName.Text = "";
                txtPassword.Text = "";
                DropDownList1.SelectedIndex = -1;
                txtDOJ.Text = "";
                txtPhone.Text = "";                
            }

        }
        catch (Exception)
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('UserName Not Update!!!')", true);

        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            try
            {
               
                var data = db.Users.Where(d => d.UserName == txtUserId.Text).FirstOrDefault();

                if (data != null)
                {
                    db.Users.Remove(data);
                    db.SaveChanges();

                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);

                    txtUserId.Text = "";
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    DropDownList1.SelectedIndex = -1;
                    txtDOJ.Text = "";
                    txtPhone.Text = "";
                }

            }
            catch (Exception ex1)
            {

                Literal1.Text = ex1.Message;

            }
        }
    }
}