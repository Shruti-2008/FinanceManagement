using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class OrderBLL
    {
       MyDataAccess SDBA;

        public int OrderID { get; set; }
        public int ProductName { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal Price { get; set; }
        public decimal Paid { get; set; }
        public decimal Balance { get; set; }

        public int CardNumber { get; set; }
        public int SchemeID { get; set; }

        public OrderBLL()
        {
            SDBA = new MyDataAccess("DBConnection");
        }
        public DataTable GetOrderHistory_BLL(string username)
        {
            DataTable dt = SDBA.OrderHistory(username);
            //dt.AcceptChanges();
            //this.CardName = (string)dt.Rows[0]["cardname"];
            //this.CardNumber = (long)dt.Rows[0]["cardnumber"];
            //this.CardValidity = (DateTime)dt.Rows[0]["validity"];
            //this.ActivationStatus = (bool)dt.Rows[0]["activationstatus"];
            //this.CreditLimit = (decimal)dt.Rows[0]["creditlimit"];
            //this.CreditBalance = (decimal)dt.Rows[0]["creditbalance"];
            return dt;
        }
    }
}
