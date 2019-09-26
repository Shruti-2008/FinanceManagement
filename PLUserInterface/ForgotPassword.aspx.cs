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
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        public string sendSMS()
        {
            Random r = new Random();
            int m = r.Next(100000, 1000000);
            otphidden.Text = m.ToString();
            String number = Phoneno.Text;
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
            }

        }

        protected void VerifyOTPClick(object sender, EventArgs e)
        {
            Response.Write(sendSMS());
        }

    }
}