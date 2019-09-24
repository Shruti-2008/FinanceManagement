using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PLUserInterface
{
    public partial class ProductList : System.Web.UI.Page
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
                lblLogin.Text = "{{Anonymous}}";

            }
           
           
        }
    }
}