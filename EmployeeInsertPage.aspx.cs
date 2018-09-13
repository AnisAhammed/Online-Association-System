using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_EmployeeInsertPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["un"]==null)
        {
            Response.Redirect("./Default.aspx");
        }

        if (!IsPostBack)
        {
            DropDownList1.DataSource = db.Branches.ToList();
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "BranchId";
            DropDownList1.DataBind();
        }

    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        try
        {
            Employee emp = new Employee();

            emp.Name = txtName.Text;
            emp.Address = txtAddress.Text;
            emp.Phone = txtPhone.Text;

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
                        emp.Photo = FileUpload1.FileName;
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
           
            emp.Salary = decimal.Parse(txtSalary.Text);
            emp.JoinDate = DateTime.Parse(txtDOJ.Text);

            emp.BranchId = Int32.Parse(DropDownList1.SelectedValue);

            emp.UserName = Session["un"].ToString();

            db.Employees.Add(emp);
            db.SaveChanges();
            
            lblEmpId.Text = emp.EmployeeId.ToString();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data Save Successfully!!!')", true);

            lblEmpId.Text = "";
            txtName.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
            Image1.ImageUrl = "";
            txtSalary.Text = "";
            txtDOJ.Text = "";
            DropDownList1.SelectedIndex = -1;

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;
        }
    }   
}