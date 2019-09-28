using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class AdminPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblLogin = (Label)Page.Master.FindControl("Label1");

            try
            {
                if (!Session.IsNewSession)
                {
                    lblLogin.Text = Session["Username"].ToString();
                }
                else
                {
                    lblLogin.Text = "{{Anonymous}}";

                }

                if (!IsPostBack)
                {
                    this.BindGrid();
                    this.BindGrid1();
                }
            }
            catch (Exception ex)
            {

                string errormessage = ex.Message;
                Response.Write("<script>alert('Session Expired :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }
            //this.BindGrid();
            //this.BindGrid1();

            //this.BindGrid();
        }

        protected void BindGrid()
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            try
            {
                BussinessHandler bh = new BussinessHandler();
                GridView1234.DataSource = bh.GetUserFunction();
                GridView1234.DataBind();
            }
            catch (Exception ex)
            {
                
                 string errormessage = ex.Message;
                Response.Write("<script>alert('Session Expired :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }
        }
        protected void BindGrid1()
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            try
            {
                BussinessHandler bh = new BussinessHandler();
                GridView1.DataSource = bh.GetVerifiedUserFunction();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                
                 string errormessage = ex.Message;
                Response.Write("<script>alert('Session Expired :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }
        }

        protected void TicketCompleted_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkBx = sender as CheckBox;
                GridViewRow row = chkBx.NamingContainer as GridViewRow;
                CheckBox chk = (CheckBox)row.FindControl("TicketCompleted");

                BussinessHandler bh = new BussinessHandler();
                bool isSelected = chk.Checked;
                //string uname = (row.FindControl("username") as Label).Text;
                string uname = row.Cells[0].Text;
                int check = Convert.ToInt32(isSelected);
                int n = bh.VerifyFunction(uname, check);
                //GridView1234.EditIndex = -1;
                this.BindGrid();
                this.BindGrid1();
            }
            catch (Exception ex)
            {
                
                 
                 string errormessage = ex.Message;
                Response.Write("<script>alert('Session Expired :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }

            //if (n > 0)
            //    Response.Write("Successfully verified");

            //if (chk.Checked)
            //{
            //    Response.Write("<script>alert('checked Called');</script>");
            //    //string ID = ((Label)row.FindControl("supid")).Text;
            //}
        }

        protected void TicketCompleted_CheckedChanged2(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkBx = sender as CheckBox;
                GridViewRow row = chkBx.NamingContainer as GridViewRow;
                CheckBox chk = (CheckBox)row.FindControl("TicketCompleted2");

                BussinessHandler bh = new BussinessHandler();
                bool isSelected = chk.Checked;
                //string uname = (row.FindControl("username") as Label).Text;
                string uname = row.Cells[0].Text;
                int check = Convert.ToInt32(isSelected);
                int n = bh.VerifyFunction(uname, check);
                //GridView1234.EditIndex = -1;
                this.BindGrid1();
                this.BindGrid();
            }
            catch (Exception ex)
            {
                
                 string errormessage = ex.Message;
                Response.Write("<script>alert('Session Expired :" + errormessage + "');</script>");
                Response.Redirect("Index.aspx");
            }
            //if (n > 0)
            //    Response.Write("Successfully verified");

            //if (chk.Checked)
            //{
            //    Response.Write("<script>alert('checked Called');</script>");
            //    //string ID = ((Label)row.FindControl("supid")).Text;
            //}
        }

        protected void GridView1234_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1234.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid1();
        }

    }
}