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
            if (!IsPostBack)
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
                e.Row.Cells[1].Text = "UserName";
                e.Row.Cells[2].Text = "Full Name";
                e.Row.Cells[3].Text = "Phone Number";
                e.Row.Cells[4].Text = "Email";
                e.Row.Cells[5].Text = "Address";
                e.Row.Cells[6].Text = "Date Of Birth";
                e.Row.Cells[7].Text = "Card Number";
                //e.Row.Cells[8].Text = "Verified";
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
            Response.Write("hello");
            CheckBox checkBox = (CheckBox)GridView2.Rows[e.RowIndex].FindControl("verified");
            bool isSelected = checkBox.Checked;
            int check = Convert.ToInt32(isSelected);
            GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
            string uname = row.Cells[2].Text;
            if (checkBox.Checked)
            {
                BussinessHandler bh = new BussinessHandler();
                int n = bh.VerifyFunction(uname, check);
            }

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

    }
}