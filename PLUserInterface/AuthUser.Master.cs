using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class AuthUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            
            Session.Abandon();
            
            Response.Redirect("Index.aspx");
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        
    }
}