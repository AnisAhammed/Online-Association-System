using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AddInsurancePage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["un"] == null)
        {
            Response.Redirect("./Default.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            AddInsurance adi = new AddInsurance();

            adi.Type = txtType.Text;
            adi.MonthlyAmount = decimal.Parse(txtMonthlyAmount.Text);
            adi.TotalInsurance = decimal.Parse(txtTotalInsurance.Text);
            adi.TotalGetInsurance = decimal.Parse(txtTotalGetInsurance.Text);


            adi.UserName = Session["un"].ToString();

            db.AddInsurances.Add(adi);
            db.SaveChanges();

            lblInsuranceId.Text = adi.Id.ToString();

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data Save Sucessfully!!!')", true);


            lblInsuranceId.Text = "";
            txtType.Text = "";
            txtMonthlyAmount.Text = "";
            txtTotalInsurance.Text = "";
            txtTotalGetInsurance.Text = "";

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;
        }
    }
}