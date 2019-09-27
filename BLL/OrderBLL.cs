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
            try
            {
                DataTable dt = SDBA.OrderHistory(username);

                return dt;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
