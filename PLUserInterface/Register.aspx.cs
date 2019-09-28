using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Net.Mail;


namespace PLUserInterface
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                BussinessHandler bh = new BussinessHandler();

                if (bh.RegisterFunction
                    (name.Text, Convert.ToInt64(phoneno.Text), email.Text, username.Text, address.Text, password.Text, Convert.ToDateTime(TextBox1.Text), Convert.ToInt32(RadioButtonList1.SelectedValue), Convert.ToInt32(selectbank.SelectedValue), Convert.ToInt32(accountno.Text), Convert.ToInt32(ifsccode.Text), false, 1234) > 1)
                {
                    try
                    {
                        Session["Username"] = username.Text;
                        Response.Write("<script>alert('Registered');</script>");
                        MailMessage mail = new MailMessage();
                        mail.To.Add("shruti.sawant@lntinfotech.com");

                        mail.From = new MailAddress("shruti.sawant@lntinfotech.com");
                        mail.Subject = "Email using Gmail";
                        string Body = username.Text + " succesfully registered";

                        mail.Body = Body;

                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp-mail.outlook.com";//"smtp.gmail.com"; //Or Your SMTP Server Address
                        smtp.Port = 587;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new System.Net.NetworkCredential
                        ("shruti.sawant@lntinfotech.com", "20Aug1997");

                        //Or your Smtp Email ID and Password
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                    catch(SmtpException ex)
                    {
                        string errormessage = ex.Message;
                        Response.Write("<script>alert('Error Sending Mail:" + errormessage + "');</script>");
                        Response.Redirect("Dashboard.aspx");
                    }

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Registeration Error');</script>");
                }
            }
            catch (Exception ex)
            {
                string errormessage = ex.Message;
                Response.Write("<script>alert('Error Registering In :" + errormessage + "');</script>");
            }
        }

        protected void CheckUserNameAvailability(object sender, EventArgs e)
        {
            try
            {
                BussinessHandler bh = new BussinessHandler();
                if (bh.UserExists(username.Text))
                {
                    UpdateMsg.Text = "User Already Exists";
                }
                else
                {
                    UpdateMsg.Text = "Valid Username";
                }
            }
            catch (Exception ex)
            {
                UpdateMsg.Text = "Error Checking in DB:"+ex.Message;
            }
        }
    }
}