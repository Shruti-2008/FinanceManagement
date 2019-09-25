using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class ProductInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckBox checkbox1 = (CheckBox)FormView1.FindControl("Checkbox1");
            checkbox1.AutoPostBack = true;
            if (!IsPostBack)
                checkbox1.CheckedChanged += CheckBox1_CheckedChanged;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Button button1 = (Button)FormView1.FindControl("Button1");
            if (button1.Enabled == true)
            {
                button1.Enabled = false;
            }
            else
            {
                button1.Enabled = true;
            }
        }
    }
}