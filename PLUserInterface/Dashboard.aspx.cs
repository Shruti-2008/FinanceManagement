using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronPdf;


namespace PLUserInterface
{
    public partial class Dashboard : System.Web.UI.Page
    {

        protected System.Web.UI.HtmlControls.HtmlGenericControl progressbar1;

        BussinessHandler bh = new BussinessHandler();

        public DataTable allEMI_dt;

        public DataTable activeEMI_dt;

        public DataTable order_dt;

        public DataTable orderspecific_dt;

        public string username;

        decimal percentage;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            #region usersession
            Label lblLogin = (Label)Page.Master.FindControl("Label1");
            if (!Session.IsNewSession)
            {
                lblLogin.Text = Session["Username"].ToString();
            }
            else
            {
                lblLogin.Text = "NONE";
            }
            
            #endregion

            pnlPopup.Visible = false;

             username = Session["Username"].ToString();

            FillUserCardInfo(username);

            FillOrderHistory(username);

            allEMI_dt = bh.GetAllEMIHistory(username);

            FillActiveEMITable();

        }

        protected void FillActiveEMITable()
        {
            activeEMI_dt = order_dt.Clone();
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
        }

        protected void FillOrderHistory(string username)
        {
            //bh = new BussinessHandler();
            order_dt = bh.GetOrderHistory(username);
            OrderHistory_gridview.DataSource = order_dt;
            OrderHistory_gridview.DataBind();

        }

        public void ShowProgressBar(object sender, System.EventArgs e)
        {
            try
            {
                string total = DetailsView2.Rows[0].Cells[1].Text.ToString();
                Decimal total1 = Convert.ToDecimal(total);
                string used = DetailsView2.Rows[1].Cells[1].Text.ToString();
                Decimal used1 = Convert.ToDecimal(used);
                Decimal YourPercentage = ((total1-used1) * 100) / total1;

                YourPercentagePanel.Attributes["aria-valuemin"] = "0";
                YourPercentagePanel.Attributes["aria-valuemax"] = "100";
                YourPercentagePanel.Attributes["aria-valuenow"] = YourPercentage.ToString();
                YourPercentagePanel.Style["width"] = String.Format("{0}%;", YourPercentage);
                YourPercentagePanel.Controls.Add(new LiteralControl(String.Format("{0}%", YourPercentage)));
            }
            catch (Exception)
            {
                Response.Write("Error in ProgressBar");
                //throw;
            }
        }

        protected void FillUserCardInfo(string username)
        {
            //bh = new BussinessHandler();

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
            Session["validity"] = cd.Rows[0]["validity"].ToString(); 
            DetailsView2.DataSource = cd;
            DetailsView2.DataBind();
        }

        protected void MyButtonClick(object sender, System.EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow selectedRow = (GridViewRow)btn.NamingContainer;

            int orderid = Convert.ToInt32(selectedRow.Cells[0].Text);
            DataTable dt = GetOrderSpecificEMI(orderid);
            Response.Write("<script>alert('Fetching details')</script>");
            OrderSpecific_gridview.DataSource = dt;
            OrderSpecific_gridview.DataBind();
            pnlPopup.Visible = true;

            ActiveEMI_gridview.DataBind();
            OrderHistory_gridview.DataBind();
        }

        protected DataTable GetOrderSpecificEMI(int orderid)
        {
            orderspecific_dt = allEMI_dt.Clone();

            foreach (DataRow row in allEMI_dt.Rows)
            {
                if (orderid.ToString() == row["orderid"].ToString())
                {
                    orderspecific_dt.Rows.Add(row.ItemArray);
                }
            }
            return orderspecific_dt;
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
                Response.Write("<script>alert('Payment Failed')</script>");
            }
            else
            {
                Response.Write("<script>alert('Payment Successful')</script>");
            }

            allEMI_dt = bh.GetAllEMIHistory(username);
            FillActiveEMITable();
            FillOrderHistory(username);
        }

        protected void ActiveEMI_gridview_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
            {
                return;
            }

            Button button = (Button)e.Row.FindControl("PayNow_btn");

            DateTime today = DateTime.Now.Date;
            int currmonth = today.Month;
            int curryear = today.Year;

            int oid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "orderid"));
            DataTable dt = GetOrderSpecificEMI(oid);
            bool flag = false;
            foreach (DataRow r in dt.Rows)
            {
                DateTime transactiondate = Convert.ToDateTime(r["transactiondate"]);
                int month = transactiondate.Month;
                int year = transactiondate.Year;
                if (currmonth == month && curryear == year)
                {
                    flag = true;
                    break;
                }
            }
            if (flag == true)
                button.Enabled = false;
            else
                button.Enabled = true;

            //int Id = (int)((DataRowView)e.Row.DataItem)["Id"];
        }

        protected void Saveaspdf_Click(object sender, EventArgs e)
        {
            IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.InBrowser);
        }

        
       
    }
}