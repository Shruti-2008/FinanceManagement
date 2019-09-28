using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string Username;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            try
            {
                if (!Session.IsNewSession)
                {
                    Username = Session["Username"].ToString();
                }
                else
                {
                    Username = "NONE";
                }
            }
            catch (Exception ex)
            {

                string errormessage = ex.Message;
                Response.Write("<script>alert('Session Expired :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                BussinessHandler bh = new BussinessHandler();

                var x = bh.UpdatePassword(Username, confirmpassword.Text);
                if (x > 0)
                {
                    Response.Write("<script>alert('Your Password has been updated');</script>");
                }
                else
                {
                    Response.Write("<script>alert('There was some error');</script>");
                }
            }
            catch (Exception ex)
            {
                string errormessage = ex.Message;
                Response.Write("<script>alert('DB Connection failed :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }

        }
    }
}