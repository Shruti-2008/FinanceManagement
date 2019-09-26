using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
namespace PLUserInterface
{
    public partial class ProductInfo : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckBox checkbox1 = (CheckBox)FormView1.FindControl("Checkbox1");
            Label lblLogin = (Label)Page.Master.FindControl("Label1");
            //checkbox1.AutoPostBack = true;
            //if (!IsPostBack)
            //    checkbox1.CheckedChanged += CheckBox1_CheckedChanged;
            
            if (!Session.IsNewSession)
            {
                lblLogin.Text = Session["Username"].ToString();
            }
            else
            {
                lblLogin.Text = "{{Anonymous}}";

            }


            BussinessHandler bh = new BussinessHandler();
            Response.Write(Session["ProductId"]);
            DataSet ds = bh.GetProductInfo((int)Session["ProductId"]);
            FormView1.DataSource = ds.Tables[0];
            FormView1.DataBind();



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