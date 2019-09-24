using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Label lblLogin = (Label)Page.Master.FindControl("Label1");
            if (!Session.IsNewSession)
            {
                lblLogin.Text = Session["Username"].ToString();
            }
            else
            {
                lblLogin.Text = "NONE";

            }
        }

        
    }
}