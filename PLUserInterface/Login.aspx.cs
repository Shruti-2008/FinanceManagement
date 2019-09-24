using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
           
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            
            Session["Validated"] = true;
            Session["Verified"] = true;
            Session["Username"] = username.Text;
            Response.Redirect("ProductList.aspx");
        }

      
    }
}