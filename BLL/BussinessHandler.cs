using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BussinessHandler
    {
        UserBLL DBA;
        ProductBLL p;
        CategoryBLL cb;
        OrderBLL order;
        TransactionBLL transaction;
        public BussinessHandler()
        {
        }

        public int RegisterFunction(string FullName, int PhoneNo, string Email, string UserName, string Address, string Password, DateTime DateOfBirth, int CardTypeID, int BankID, int AccountNo, int IFSCCode, bool Verified, int CardNumber)
        {
            DBA = new UserBLL(FullName, PhoneNo, Email, UserName, Address, Password, DateOfBirth, CardTypeID, BankID, AccountNo, IFSCCode, Verified, CardNumber);
            return DBA.SaveinDB();
        }

        public DataTable Authorize(string UserName, string Password)
        {
            if (UserName == "admin" && Password == "admin")
            {
                return new System.Data.DataTable("admin");
            }
            else
            {
                DBA = new UserBLL(UserName, Password);
                if (DBA.ValidateFromDB())
                {
                    return DBA.GetUserFromDB();
                }
                else
                {
                    return null;
                }
            }
        }

        public bool UserExists(string p)
        {
            DBA = new UserBLL();
            return DBA.checkfromDB(p);
        }

        public DataSet GetUserFunction()
        {
            DBA = new UserBLL();
            return DBA.GetUser();
        }

        public int VerifyFunction(string uname, int n)
        {
            DBA = new UserBLL();
            return DBA.Verify(uname, n);
        }

        public DataSet GetProductsToCart(string username, int categoryid)
        {
            p = new ProductBLL();
            //    int categoryn = Convert.ToInt32(categoryid);
            DataSet ds = p.ProductCart(username, categoryid);
            return ds;
        }
        public DataSet GetCategories()
        {
            cb = new CategoryBLL();
            DataSet ds = cb.GetAllCategories();
            return ds;
        }

        public DataSet GetProductInfo(int productid)
        {
            p = new ProductBLL();
            DataSet ds = p.ProductInfo(productid);
            return ds;
        }

        public DataTable GetCardInfo(string username)
        {
            Card card = new Card();
            return card.GetCardInfo_BLL(username);
        }

        public DataTable GetOrderHistory(string username)
        {
            order = new OrderBLL();
            return order.GetOrderHistory_BLL(username);
        }

        public DataTable GetAllEMIHistory(string username)
        {
            transaction = new TransactionBLL();
            return transaction.GetAllEMIHistory_BLL(username);
        }

        public int PayInstallment(int orderid)
        {
            transaction = new TransactionBLL();
            return transaction.PayInstallment_BLL(orderid);
        }
    }
}
