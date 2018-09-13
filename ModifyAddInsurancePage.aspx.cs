using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ModifyAddInsurancePage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            try
            {
                int idn = Int32.Parse(Request.QueryString["id"]);

                var data = db.AddInsurances.Where(d => d.Id == idn).FirstOrDefault();

                if (data != null)
                {
                    txtId.Text = idn.ToString();
                    txtType.Text = data.Type;
                    txtMonthlyAmount.Text = data.MonthlyAmount.ToString();
                    txtTotalInsurance.Text = data.TotalInsurance.ToString();
                    txtTotalGetInsurance.Text = data.TotalGetInsurance.ToString();


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
        int x = Int32.Parse(txtId.Text);
        var data = db.AddInsurances.Where(d => d.Id == x).FirstOrDefault();

        if (data != null)
        {
            txtType.Text = data.Type;
            txtMonthlyAmount.Text = data.MonthlyAmount.ToString();
            txtTotalInsurance.Text = data.TotalInsurance.ToString();
            txtTotalGetInsurance.Text = data.TotalGetInsurance.ToString();

        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data Not Found!!!')", true);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //try
        //{
            int x = Int32.Parse(txtId.Text);
            var data = db.AddInsurances.Where(d => d.Id == x).FirstOrDefault();

            if (data != null)
            {
                data.Id = Int32.Parse(txtId.Text);
                data.Type = txtType.Text;
                data.MonthlyAmount = decimal.Parse(txtMonthlyAmount.Text);
                data.TotalInsurance = decimal.Parse(txtTotalInsurance.Text);
                data.TotalGetInsurance = decimal.Parse(txtTotalGetInsurance.Text);


                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Successfully!!!')", true);

                txtId.Text = "";
                txtType.Text = "";
                txtTotalInsurance.Text = "";
                txtMonthlyAmount.Text = "";
                txtTotalGetInsurance.Text = "";
            }

        //}
        //catch (Exception ex1)
        //{

        //    Literal1.Text = ex1.Message;

        //}
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(txtId.Text);
            var data = db.AddInsurances.Where(d => d.Id == x).FirstOrDefault();

            if (data != null)
            {
                db.AddInsurances.Remove(data);
                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);


                txtId.Text = "";
                txtType.Text = "";
                txtTotalInsurance.Text = "";
                txtMonthlyAmount.Text = "";
                txtTotalGetInsurance.Text = "";
            }

        }
        catch (Exception)
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('We can not delete record ...')", true);

        }
    }
}