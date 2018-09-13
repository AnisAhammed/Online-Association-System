using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ModifyEmployeePage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = db.Branches.ToList();
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "BranchId";
            DropDownList1.DataBind();


            try
            {
                int idn = Int32.Parse(Request.QueryString["id"]);

                var data = db.Employees.Where(d => d.EmployeeId == idn).FirstOrDefault();

                if (data != null)
                {
                    txtEmployeeId.Text = idn.ToString();
                    txtName.Text = data.Name;
                    txtAddress.Text = data.Address;
                    txtPhone.Text = data.Phone;
                    Image1.ImageUrl = "../Upload/" + data.Photo;
                    txtSalary.Text = ((decimal)data.Salary).ToString(".00");
                    txtDOJ.Text = ((DateTime)data.JoinDate).ToString("yyyy / MM / dd");
                    DropDownList1.SelectedValue = data.BranchId.ToString();
                

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
        int x = Int32.Parse(txtEmployeeId.Text);
        var data = db.Employees.Where(d => d.EmployeeId == x).FirstOrDefault();

        if (data != null)
        {
            txtName.Text = data.Name;
            txtAddress.Text = data.Address;
            txtPhone.Text = data.Phone;
            Image1.ImageUrl = "../Upload/" + data.Photo;
            txtSalary.Text = data.Salary.ToString();
            txtDOJ.Text = data.JoinDate.ToString();
            DropDownList1.SelectedValue = data.BranchId.ToString();
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
            int x = Int32.Parse(txtEmployeeId.Text);
            var data = db.Employees.Where(d => d.EmployeeId == x).FirstOrDefault();

            if (data != null)
            {
                data.EmployeeId = Int32.Parse(txtEmployeeId.Text);
                data.Name = txtName.Text;
                data.Address = txtAddress.Text;
                data.Phone = txtPhone.Text;
                //Image1.ImageUrl = "../Upload/" + data.Photo;
                if (FileUpload1.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                    Session["Pic"] = FileUpload1.FileName;

                    if (extension == ".jpg" || extension == ".gif")
                    {
                        if (FileUpload1.PostedFile.ContentLength < (500 * 1024))
                        {
                            //mb.Photo = FileUpload1.FileName;
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
                data.JoinDate = DateTime.Parse(txtDOJ.Text);
                data.BranchId = Int32.Parse(DropDownList1.SelectedValue);

                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Successfully!!!')", true);

                txtEmployeeId.Text = "";
                txtName.Text = "";
                txtAddress.Text = "";
                txtPhone.Text = "";
                Image1.ImageUrl = "";
                txtSalary.Text = "";
                txtDOJ.Text = "";
                DropDownList1.SelectedIndex = -1;
            }

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;

        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            try
            {
                int idn = Int32.Parse(txtEmployeeId.Text);
                var data = db.Employees.Where(d => d.EmployeeId == idn).FirstOrDefault();

                if (data != null)
                {
                    db.Employees.Remove(data);
                    db.SaveChanges();

                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);


                    txtEmployeeId.Text = "";
                    txtName.Text = "";
                    txtAddress.Text = "";
                    txtPhone.Text = "";
                    Image1.ImageUrl = "";
                    txtSalary.Text = "";
                    txtDOJ.Text = "";
                    DropDownList1.SelectedIndex = -1;
                }

            }
            catch (Exception ex1)
            {

                Literal1.Text = ex1.Message;

            }
        }
    }
}