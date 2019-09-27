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
            try
            {
                DataTable dt = SDBA.UserEmiHistory(username);
                return dt;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public int PayInstallment_BLL(int orderid)
        {
            try
            {
                return SDBA.Payment(orderid);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
