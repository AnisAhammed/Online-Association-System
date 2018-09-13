using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_InsuranceApprovalPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList3.DataSource = db.Insurances.Where(s => s.Status != "Approved").ToList();
            DropDownList3.DataTextField = "InsuranceId";
            DropDownList3.DataValueField = "InsuranceId";
            DropDownList3.DataBind();

            try
            {
                int idn = Int32.Parse(Request.QueryString["id"]);

                var data = db.Insurances.Where(d => d.InsuranceId == idn).FirstOrDefault();

                if (data != null)
                {
                    lblInsuranceId.Text = idn.ToString();
                    lblInsuranceType.Text = data.Type;
                    lblMonthlyAmount.Text = ((decimal)data.MonthlyAmount).ToString(".00");
                    lblTotalIsurance.Text = ((decimal)data.TotalInsurance).ToString(".00");                   
                    CheckBox1.Text = data.Status;
                    lblMemberId.Text = data.MemberId.ToString();


                    Literal1.Text = "";
                }
            }
            catch (Exception)
            {

            }
            btnUpdate.Enabled = false;
        }
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int x = Int32.Parse(lblInsuranceId.Text);
            var data = db.Insurances.Where(d => d.InsuranceId == x).FirstOrDefault();

            if (data != null)
            {
                if (CheckBox1.Checked)
                {
                    data.Status = "Approved";
                }
                else
                {
                    data.Status = "Not Approved";
                }

                db.SaveChanges();

                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();

                if (data != null)
                {

                    mail.To.Add(data.User.Email);


                    mail.From = new System.Net.Mail.MailAddress("diitidb@gmail.com", "Anis", System.Text.Encoding.UTF8);
                    mail.Subject = "Approval";
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.Body = "Dear " + data.UserName + "Account is approved";
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    mail.IsBodyHtml = true;
                    mail.Priority = System.Net.Mail.MailPriority.High;

                    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                    client.Credentials = new System.Net.NetworkCredential("diitidb@gmail.com", "round-27");
                    client.Port = 587;
                    client.Host = "smtp.gmail.com";
                    client.EnableSsl = true;
                    try
                    {
                        client.Send(mail);
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent')", true);

                    }
                    catch (Exception ex)
                    {
                        Literal1.Text = ex.Message;
                    }

                }

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Update Successfully!!!')", true);

                lblInsuranceId.Text = "";
                lblInsuranceType.Text = "";
                lblMemberId.Text = "";
                lblMonthlyAmount.Text = "";
                lblTotalIsurance.Text = "";
                CheckBox1.Text = "";
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
            int x = Int32.Parse(lblInsuranceId.Text);
            var data = db.Insurances.Where(d => d.InsuranceId == x).FirstOrDefault();

            if (data != null)
            {
                db.Insurances.Remove(data);
                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);
            }

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;

        }
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Int32.Parse(DropDownList3.SelectedValue);
        var data = db.Insurances.Where(d => d.InsuranceId == id).FirstOrDefault();

        if (data != null)
        {
            lblInsuranceId.Text = data.InsuranceId.ToString();
            lblInsuranceType.Text = data.Type;
            lblMonthlyAmount.Text = ((decimal)data.MonthlyAmount).ToString(".00");
            lblTotalIsurance.Text = ((decimal)data.TotalInsurance).ToString(".00");
            if (data.Status == "Not Approved")
            {
                CheckBox1.Checked = false;
            }
            else
            {
                CheckBox1.Checked = true;
            }
            lblMemberId.Text = data.MemberId.ToString();
            
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            btnUpdate.Enabled = true;

        }
        else
        {
            btnUpdate.Enabled = false;
        }
    }
}