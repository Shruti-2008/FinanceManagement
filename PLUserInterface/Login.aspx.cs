using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

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
            BussinessHandler bh = new BussinessHandler();
            var x = bh.Authorize(username.Text, password.Text);

            if (x == null)
            {
                Response.Write("<script>alert('Invalid UserName or Password');</script>");
            }
            else if (x.TableName == "admin")
            {
                Session["Username"] = "Admin";
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                Session["Username"] = x.Rows[0]["username"].ToString();
                Session["Verified"] = x.Rows[0]["verified"].ToString();
                Session["CardTypeid"] = x.Rows[0]["cardtypeid"].ToString();
                Session["Validated"] = x.Rows[0]["activationstatus"].ToString();

                Response.Write(Session["Username"]);
                Response.Write(Session["Verified"]);
                Response.Write(Session["CardTypeid"]);
                Response.Write(Session["Validated"]);

                Response.Redirect("Dashboard.aspx");
            }

        }
    }
}