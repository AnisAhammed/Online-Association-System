using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ModifyBranchPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            try
            {
                int idn = Int32.Parse(Request.QueryString["id"]);

                var data = db.Branches.Where(d => d.BranchId == idn).FirstOrDefault();

                if (data != null)
                {
                    txtBranchId.Text = idn.ToString();
                    txtBranchName.Text = data.Name;
                    txtBranchAddress.Text = data.Address;
                    txtPhone.Text = data.Phone;
                    txtEmail.Text = data.Email;


                    Literal1.Text = "";
                }
            }
            catch (Exception)
            {

            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int idn = Int32.Parse(txtBranchId.Text);
            var data = db.Branches.Where(d => d.BranchId == idn).FirstOrDefault();

            if (data != null)
            {
                data.BranchId = Int32.Parse(txtBranchId.Text);
                data.Name = txtBranchName.Text;
                data.Address = txtBranchAddress.Text;
                data.Phone = txtPhone.Text;
                data.Email = txtEmail.Text;


                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Successfully!!!')", true);

                txtBranchId.Text = "";
                txtBranchName.Text = "";
                txtBranchAddress.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
            }

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;

        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            int idn = Int32.Parse(txtBranchId.Text);
                var data = db.Branches.Where(d => d.BranchId == idn).FirstOrDefault();

                if (data != null)
                {
                    db.Branches.Remove(data);
                    db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);


                txtBranchId.Text = "";
                txtBranchName.Text = "";
                txtBranchAddress.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
            }

    }
            catch (Exception)
            {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('We can not delete record ...')", true);

        } 

    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        int x = Int32.Parse(txtBranchId.Text);
        var data = db.Branches.Where(d => d.BranchId == x).FirstOrDefault();

        if (data != null)
        {
            txtBranchName.Text = data.Name;
            txtBranchAddress.Text = data.Address;
            txtPhone.Text = data.Phone;
            txtEmail.Text = data.Email;

        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data Not Found!!!')", true);
        }
    }
}