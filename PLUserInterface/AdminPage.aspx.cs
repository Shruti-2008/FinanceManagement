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
            if (!Session.IsNewSession)
            {
                lblLogin.Text = Session["Username"].ToString();
            }
            else
            {
                lblLogin.Text = "{{Anonymous}}";

            }
            if (IsPostBack)
                this.BindGrid();
            this.BindGrid();
        }

        protected void BindGrid()
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            BussinessHandler bh = new BussinessHandler();
            GridView2.DataSource = bh.GetUserFunction();
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowCancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            this.BindGrid();
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = "Verified";
                e.Row.Cells[4].Text = "UserName";
                e.Row.Cells[5].Text = "Full Name";
                e.Row.Cells[6].Text = "Phone Number";
                e.Row.Cells[7].Text = "Email";
                e.Row.Cells[8].Text = "Address";
                e.Row.Cells[9].Text = "Date Of Birth";
                e.Row.Cells[10].Text = "Card Number";
                
            }
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    CheckBox checkBox = e.Row.Cells[8].Controls[0] as CheckBox;
            //    checkBox.Enabled = true;
            //    checkBox.AutoPostBack = true;
            //    bool isSelected = (e.Row.Cells[8].Controls[0] as CheckBox).Checked;
            //    if (isSelected == false)
            //    {
            //        checkBox.CheckedChanged += new EventHandler(this.Check_Clicked);
            //    }
            //    if (checkBox.Checked)
            //    {
            //        BussinessHandler bh = new BussinessHandler();

            //    }
            //}
        }

        protected void Check_Clicked(Object sender, EventArgs e)
        {
            Response.Write("1");
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Response.Write("hello");
            CheckBox checkBox = (CheckBox)GridView2.Rows[e.RowIndex].FindControl("cbSelect");
            //if(checkBox.Checked)
            //{

            //}
            bool isSelected = checkBox.Checked;
            int check = Convert.ToInt32(isSelected);
            GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
            string uname = row.Cells[4].Text;
            //Response.Write(uname+" "+ check);


            //if (checkBox.Checked)
            //{
            BussinessHandler bh = new BussinessHandler();
            int n = bh.VerifyFunction(uname, check);
            this.BindGrid();
            if (n > 0)
                Response.Write("Successfully verified");
            //}

            //checkBox.CheckedChanged += new EventHandler(this.Check_Clicked);

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    CheckBox checkBox = e.Row.Cells[8].Controls[0] as CheckBox;
            //    checkBox.Enabled = true;
            //    checkBox.AutoPostBack = true;
            //    bool isSelected = (e.Row.Cells[8].Controls[0] as CheckBox).Checked;
            //    if (isSelected == false)
            //    {
            //        checkBox.CheckedChanged += new EventHandler(this.Check_Clicked);
            //    }
            //    if (checkBox.Checked)
            //    {
            //        BussinessHandler bh = new BussinessHandler();

            //    }
            //}
        }

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 3)
                e.Row.Cells[3].Visible = false;
        }


    }
}