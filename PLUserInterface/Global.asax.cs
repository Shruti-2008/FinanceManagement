using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace PLUserInterface
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            
            Session.Add("Username",null);
            Session.Add("ID", null);
            Session.Add("Verified", false);
            Session.Add("Validated", false);
            
        }
        
        protected void Session_End(object sender, EventArgs e)
        {
            
        }

    }
}