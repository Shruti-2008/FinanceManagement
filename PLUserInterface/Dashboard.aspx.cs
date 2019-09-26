using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PLUserInterface
{
    public partial class Dashboard : System.Web.UI.Page
    {
       
        protected System.Web.UI.HtmlControls.HtmlGenericControl progressbar1;

        BussinessHandler bh;

        public DataTable allEMI_dt;

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
                lblLogin.Text = "NONE";
            }
            pnlPopup.Visible = false;
            decimal percentage = 0;
            
            bh = new BussinessHandler();
            string username = "shruti";

            DataTable cd = bh.GetCardInfo(username);
            cd.Columns.Add("username", typeof(System.String));
            cd.Columns.Add("creditused", typeof(System.Decimal));
            foreach (DataRow row in cd.Rows)
            {
                row["creditused"] = (decimal)row["creditlimit"] - (decimal)row["creditbalance"];
                row["username"] = username;
            }
            percentage = (decimal)cd.Rows[0]["creditbalance"] / (decimal)cd.Rows[0]["creditlimit"] * 100;
            DetailsView1.DataSource = cd;
            DetailsView1.DataBind();

            DetailsView2.DataSource = cd;
            DetailsView2.DataBind();

            string p = Convert.ToString(percentage) + "%";


            //---------------------------------------------------------------------------------
            DataTable order_dt = bh.GetOrderHistory(username);
            OrderHistory_gridview.DataSource = order_dt;
            OrderHistory_gridview.DataBind();

            allEMI_dt = bh.GetAllEMIHistory(username);

            DataTable activeEMI_dt = order_dt.Clone();
            activeEMI_dt.Columns.Add("EMIduedate", typeof(System.DateTime));
            foreach (DataRow row in order_dt.Rows)
            {
                if (Convert.ToDecimal(row["balance"]) > 1)
                {
                    activeEMI_dt.Rows.Add(row.ItemArray);
                }
            }
            DateTime today = DateTime.Now.Date;
            foreach (DataRow row in activeEMI_dt.Rows)
            {

                row["EMIduedate"] = new DateTime(today.Year, today.Month + 1, 1).AddDays(-1);
            }

            ActiveEMI_gridview.DataSource = activeEMI_dt;
            ActiveEMI_gridview.DataBind();

            //progressbar1.Style.Add("width",p);
            //progressbar1.Attributes.Add("style", "width: p");
            //mybody.Attributes.CssStyle.Add("background", "linear-gradient(#b53e36, #cccccc)");

        }

        protected void MyButtonClick(object sender, System.EventArgs e)
        {

            Button btn = (Button)sender;
            GridViewRow selectedRow = (GridViewRow)btn.NamingContainer;

            int orderid = Convert.ToInt32(selectedRow.Cells[0].Text);
            Response.Write("<script>alert('Fetching details')</script>");
            DataTable orderspecific_dt = allEMI_dt.Clone();

            foreach (DataRow row in allEMI_dt.Rows)
            {
                if (orderid.ToString() == row["orderid"].ToString())
                {
                    orderspecific_dt.Rows.Add(row.ItemArray);
                }
            }
            OrderSpecific_gridview.DataSource = orderspecific_dt;
            OrderSpecific_gridview.DataBind();
            pnlPopup.Visible = true;
        }

        protected void OrderHistory_gridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "ViewEMIHistory") return;
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = OrderHistory_gridview.Rows[index];
            int orderid = Convert.ToInt32(selectedRow.Cells[0].Text);

            DataTable orderspecific_dt = new DataTable();
            //Response.Write(orderid+"AAAAAAAAAAAAAAAAAAAAAAAA");

            foreach (DataRow row in allEMI_dt.Rows)
            {
                if (orderid.ToString() == row["orderid"].ToString())
                {
                    orderspecific_dt.Rows.Add(row);
                }
            }
            OrderSpecific_gridview.DataSource = orderspecific_dt;
            OrderSpecific_gridview.DataBind();
        }

        protected void PayNow_btn_Click(object sender, EventArgs e)
        {
            bh = new BussinessHandler();

            Button btn = (Button)sender;
            GridViewRow selectedRow = (GridViewRow)btn.NamingContainer;
            int orderid = Convert.ToInt32(selectedRow.Cells[0].Text);
            int status = bh.PayInstallment(orderid);
            if (status == 0)
            {
                Response.Write("<script>alert('Payment Successful')</script>");
            }
            else
            {
                Response.Write("<script>alert('Payment Failed')</script>");
            }
        }

        protected void ActiveEMI_gridview_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                return;
            }

            Button button = (Button)e.Row.FindControl("PayNow_btn"); //--------->
            int currmonth = DateTime.Now.Month;
            int curryear = DateTime.Now.Year;

            //int Id = (int)((DataRowView)e.Row.DataItem)["Id"];

            //if (Id == Convert.ToInt32(Session["Id"]))
            //{
            //    button.Enabled = false;
            //}
            //else
            //{
            //    button.Enabled = true;
            //}
        }

        protected void ActiveEMI_gridview_RowCreated(object sender, GridViewRowEventArgs e)
        {
            foreach (DataRow row in allEMI_dt.Rows)
            {

                //if (row[)
                //{
                //    allEMI_dt.Rows.Add(row.ItemArray);
                //}
            }
        }

        
    }
}