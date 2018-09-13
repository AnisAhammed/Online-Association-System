using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AccountApprovalPage : System.Web.UI.Page
{
    ProjectDatabaseEntities2 db = new ProjectDatabaseEntities2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DropDownList1.DataSource = db.MAccounts.Where(m => m.Status != "Approved").ToList();
            DropDownList1.DataTextField = "AccountNo";
            DropDownList1.DataValueField = "AccountNo";
            DropDownList1.DataBind();

            try
            {
                int idn = Int32.Parse(Request.QueryString["id"]);

                var data = db.MAccounts.Where(d => d.AccountNo == idn).FirstOrDefault();

                if (data != null)
                {
                    lblAccountNo.Text = idn.ToString();
                    lblStartDate.Text = ((DateTime)data.StartDate).ToString("yyyy / MM / dd");
                    if (data.Status == "Not Approved")
                    {
                        CheckBox1.Checked = false;
                    }

                    else
                    {
                        CheckBox1.Checked = true;
                    }
                    lblMemberName.Text = data.MemberId.ToString();

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
            int x = Int32.Parse(lblAccountNo.Text);
            var data = db.MAccounts.Where(d => d.AccountNo == x).FirstOrDefault();

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

                lblAccountNo.Text = "";
                lblStartDate.Text = "";
                CheckBox1.Text = "";
                lblMemberName.Text = "";

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
            int x = Int32.Parse(lblAccountNo.Text);
            var data = db.MAccounts.Where(d => d.AccountNo == x).FirstOrDefault();

            if (data != null)
            {
                db.MAccounts.Remove(data);
                db.SaveChanges();

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Delete Successfully!!!')", true);
                lblAccountNo.Text = "";
                lblStartDate.Text = "";
                CheckBox1.Text = "";
                lblMemberName.Text = "";
            }

        }
        catch (Exception ex1)
        {

            Literal1.Text = ex1.Message;

        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Int32.Parse(DropDownList1.SelectedValue);
        var data = db.MAccounts.Where(d => d.AccountNo == id).FirstOrDefault();

        if (data != null)
        {
            lblAccountNo.Text = data.AccountNo.ToString();
            lblStartDate.Text = ((DateTime)data.StartDate).ToString("yyyy / MM / dd");
            lblMemberName.Text = data.MemberId.ToString();

            if (data.Status == "Not Approved")
            {
                CheckBox1.Checked = false;
            }

            else
            {
                CheckBox1.Checked = true;
            }
        }
    }
}