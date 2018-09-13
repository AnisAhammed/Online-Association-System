using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_SavingsAccountApprovalPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = db.SavingsAccounts.Where(s => s.Status != "Approved").ToList();
            DropDownList1.DataTextField = "SavingsAccountNo";
            DropDownList1.DataValueField = "SavingsAccountNo";
            DropDownList1.DataBind();

            try
            {
                int idn = Int32.Parse(Request.QueryString["id"]);

                var data = db.SavingsAccounts.Where(d => d.SavingsAccountNo == idn).FirstOrDefault();

                if (data != null)
                {
                    lblSavingsAccountNo.Text = idn.ToString();
                    lblTotalSavings.Text = ((decimal)data.TotalSavings).ToString(".00");
                    lblSavingsDate.Text = ((DateTime)data.SDate).ToString("yyyy / MM / dd");
                    //CheckBox1.Text = data.Status.ToString();
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
            int x = Int32.Parse(lblSavingsAccountNo.Text);
            var data = db.SavingsAccounts.Where(d => d.SavingsAccountNo == x).FirstOrDefault();

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
                    mail.Body = "Dear " + data.UserName + " Member Savings Account is approved";
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

                DropDownList1.SelectedIndex = -1;
                lblSavingsAccountNo.Text = "";
                lblTotalSavings.Text = "";
                lblSavingsDate.Text = "";
                

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
            int x = Int32.Parse(DropDownList1.Text);
            var data = db.SavingsAccounts.Where(d => d.SavingsAccountNo == x).FirstOrDefault();

            if (data != null)
            {
                db.SavingsAccounts.Remove(data);
                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);

                DropDownList1.SelectedIndex = -1;
                lblSavingsAccountNo.Text = "";
                lblTotalSavings.Text = "";
                lblSavingsDate.Text = "";
            }

        }
        catch (Exception)
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Can not Delete!!!')", true);

        }
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Int32.Parse(DropDownList1.SelectedValue);
        var data = db.SavingsAccounts.Where(d => d.SavingsAccountNo == id).FirstOrDefault();

        if (data != null)
        {

            lblSavingsAccountNo.Text = data.SavingsAccountNo.ToString();
            lblTotalSavings.Text = ((Decimal)data.TotalSavings).ToString(".00");
            lblSavingsDate.Text = ((DateTime)data.SDate).ToString("yyyy / MM / dd");
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