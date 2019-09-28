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
            //Session["validity"] = "2020-03-25";


            if (!IsPostBack)
            {
                BussinessHandler bh = new BussinessHandler();
                //  Response.Write(Session["ProductId"]);
                DataSet ds = bh.GetProductInfo((int)Session["ProductId"]);
                FormView1.DataSource = ds.Tables[0];
                FormView1.DataBind();

            }
            DropDownList DropDownList1 = (DropDownList)FormView1.FindControl("DropDownList1");
            int selectedTenureId = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            DateTime vdate = Convert.ToDateTime(Session["validity"].ToString());
            DateTime newdate = DateTime.Now.Date.AddMonths(selectedTenureId * 3);
            // Response.Write(newdate);
            Label Label3 = (Label)FormView1.FindControl("Label3");
            Label Label7 = (Label)FormView1.FindControl("Label7");
            Label7.Text = "₹ " + (Convert.ToInt32(Session["price"]) / (selectedTenureId * 3)).ToString();
            Button Button1 = (Button)FormView1.FindControl("Button1");
            if (checkbox1 == null || checkbox1.Checked == true)
            {
                Label3.Text = "";
                Button1.Enabled = true;
            }
            if (DateTime.Compare(vdate, newdate) < 0)
            {

                Label3.Text = "Sorry, your EMI tenure exceeds your card validity period. Please select again.";

                Button1.Enabled = false;
            }

            Label Label2 = (Label)FormView1.FindControl("Label2");
            Session["schemeid"] = selectedTenureId;

            //Label2.Text = selectedCategory.ToString();

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkbox1 = (CheckBox)FormView1.FindControl("Checkbox1");
            if (checkbox1.Checked == false)
            {
                Button button1 = (Button)FormView1.FindControl("Button1");
                if (button1.Enabled == true)
                {
                    button1.Enabled = false;
                }
            }



        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentGateway.aspx");
        }



    }
}