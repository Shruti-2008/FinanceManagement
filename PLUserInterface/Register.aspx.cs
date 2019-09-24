using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace PLUserInterface
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BussinessHandler bh = new BussinessHandler();
            if(bh.RegisterFunction
                (name.Text,Convert.ToInt32( phoneno.Text), email.Text, username.Text, address.Text, password.Text, Calendar1.SelectedDate, Convert.ToInt32(RadioButtonList1.SelectedValue),Convert.ToInt32( selectbank.SelectedValue),Convert.ToInt32( accountno.Text),Convert.ToInt32( ifsccode.Text), false, 1234)>1)
            {
                Response.Write("Registered");
            }
            else
            {
                Response.Write("ERRor");

            }
        }
    }
}