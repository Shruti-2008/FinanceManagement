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
    public partial class ProductList : System.Web.UI.Page
    {
       
        int selectedProductId;
        DataSet productset = new DataSet();
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

            BussinessHandler bh = new BussinessHandler();
            DataSet ds = bh.GetCategories();

            // 
            //Response.Write(selectedCategory);
            //
            if (!IsPostBack)
            {
                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    DropDownList1.DataSource = ds.Tables[0];
                    DropDownList1.DataTextField = ds.Tables[0].Columns["categoryname"].ToString();
                    DropDownList1.DataValueField = ds.Tables[0].Columns["categoryid"].ToString();

                    DropDownList1.DataBind();

                }
            }
            int selectedCategory = Convert.ToInt32(DropDownList1.SelectedItem.Value);


            productset = bh.GetProductsToCart(Session["Username"].ToString(), selectedCategory);
            ListView1.DataSource = productset.Tables[0];
            //Label1.Text = DropDownList1.SelectedItem.Value.ToString();
            ListView1.DataBind();

            // 

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            Label1.Text = ListView1.SelectedIndex.ToString();
            Session["SelectedProduct"] = Convert.ToInt32(Label1.Text);
            // Response.Write(Session["SelectedProduct"]);
            int sessionindx = Convert.ToInt32(Session["SelectedProduct"]);
            int productid = Convert.ToInt32(productset.Tables[0].Rows[sessionindx]["productid"]);
            Label5.Text = productid.ToString();
            Session["ProductId"] = productid;
            Response.Redirect("ProductInfo.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BussinessHandler bh = new BussinessHandler();
            //int selectedCategory = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            //Label1.Text = DropDownList1.SelectedItem.Value.ToString();
            //ListView1.DataSource = bh.GetProductsToCart(Session["Username"].ToString(), selectedCategory).Tables[0];

            //ListView1.DataBind();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;



            //Get the listviewitem from button
            // ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;

            //Find the label control
            //  Label1.Text = ListView1.SelectedIndex.ToString();
            //get the value



        }

        protected void ListView1_SelectedIndexChanging1(object sender, ListViewSelectEventArgs e)
        {

            selectedProductId = ListView1.SelectedIndex;

        }
    }
}