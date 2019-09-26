using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class TransactionBLL
    {
       

        MyDataAccess SDBA;

        public int TransactionID { get; set; }
        public int OrderID { get; set; }
        public DateTime TransactionDate { get; set; }
        public decimal Amount { get; set; }

        public TransactionBLL()
        {
            SDBA = new MyDataAccess("DBConnection");
        }

        public DataTable GetAllEMIHistory_BLL(string username)
        {
            DataTable dt = SDBA.UserEmiHistory(username);
            //dt.AcceptChanges();
            //this.CardName = (string)dt.Rows[0]["cardname"];
            //this.CardNumber = (long)dt.Rows[0]["cardnumber"];
            //this.CardValidity = (DateTime)dt.Rows[0]["validity"];
            //this.ActivationStatus = (bool)dt.Rows[0]["activationstatus"];
            //this.CreditLimit = (decimal)dt.Rows[0]["creditlimit"];
            //this.CreditBalance = (decimal)dt.Rows[0]["creditbalance"];
            return dt;
        }

        public int PayInstallment_BLL(int orderid)
        {
            return SDBA.Payment(orderid);
        }
    }
}
