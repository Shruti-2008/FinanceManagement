using BLL;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string number;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Button2.Enabled = false;
            Button2.Visible= false;
            if(CompareValidator1.IsValid)
            {
                Button2.Enabled = true;
                Button2.Visible= true;
            }
            else
            {
                Button2.Enabled = false;
                Button2.Visible = false;
            }

        }
        public string sendSMS()
        {
            BussinessHandler bh = new BussinessHandler();

            var x = bh.GetMobileNumber(username.Text);
            if (x == null)
            {
                Response.Write("<script>alert('Invalid UserName');</script>");
            }
            else
            {
                number = x.Rows[0]["phoneno"].ToString();
            }


            Random r = new Random();
            int m = r.Next(100000, 1000000);
            otphidden.Text = m.ToString();

            //String number = Phoneno.Text;
            String message = HttpUtility.UrlEncode("This is your OTP to reset password:" + m + ". OTP expires in 10 minutes.");
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "4r9VhU/eCFY-u6EJaIQawQMcrTuyNS9NoV3XGMDJ9t"},
                {"numbers" , number},
                {"message" , message},
                {"sender" , "TXTLCL"}
                });


                string result = System.Text.Encoding.UTF8.GetString(response);
                return result;
                //return 1;
            }
            
        }


        protected void VerifyOTPClick(object sender, EventArgs e)
        {
            Session["Username"] = username.Text;
            Response.Write(sendSMS());
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (otp.Text == otphidden.Text)
            {
                Response.Redirect("ChangePassword.aspx");
            }
            else
            {
                Response.Write("<script>alert;</script>");
            }
        }
    }       
}