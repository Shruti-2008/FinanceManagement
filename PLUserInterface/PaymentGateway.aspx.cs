using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class PaymentGateway : System.Web.UI.Page
    {
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblLogin = (Label)Page.Master.FindControl("Label1");
            if (!Session.IsNewSession)
            {
                lblLogin.Text = Session["Username"].ToString();
                username = Session["Username"].ToString();
            }
            else
            {
                lblLogin.Text = "{{Anonymous}}";

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                BussinessHandler bh = new BussinessHandler();
                bool PaymentSuccessful = bh.OrderProduct(Session["username"].ToString(), Convert.ToInt32(Session["productid"]), Convert.ToInt32(Session["schemeid"]));
                if (PaymentSuccessful)
                {
                    try
                    {
                        MailMessage mail = new MailMessage();
                        mail.To.Add("shruti.sawant@lntinfotech.com");

                        mail.From = new MailAddress("shruti.sawant@lntinfotech.com");
                        mail.Subject = "Update" + username;
                        string Body = "Order by " + username + " Placed successfully";

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
                    catch (SmtpException ex)
                    {
                        string errormessage = ex.Message;
                        Response.Write("<script>alert('Error Sending Mail :" + errormessage + "');</script>");
                    }

                    Response.Redirect("Payment.aspx");
                }
            }
            catch (Exception ex)
            {
                string errormessage = ex.Message;
                Response.Write("<script>alert('Internal Payment Error :" + errormessage + "');</script>");
            }
        }
    }
}