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

        public int RegisterFunction(string FullName, Int64 PhoneNo, string Email, string UserName, string Address, string Password, DateTime DateOfBirth, int CardTypeID, int BankID, int AccountNo, int IFSCCode, bool Verified, int CardNumber)
        {
            try
            {
                DBA = new UserBLL(FullName, PhoneNo, Email, UserName, Address, Password, DateOfBirth, CardTypeID, BankID, AccountNo, IFSCCode, Verified, CardNumber);
                return DBA.SaveinDB();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataTable Authorize(string UserName, string Password)
        {
            try
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
            catch (Exception)
            {
                
                throw;
            }
        }

        public bool UserExists(string p)
        {
            try
            {
                DBA = new UserBLL();
                return DBA.checkfromDB(p);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataSet GetUserFunction()
        {
            try
            {
                DBA = new UserBLL();
                return DBA.GetUser();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public int VerifyFunction(string uname, int check)
        {
            try
            {
                DBA = new UserBLL();
                return DBA.Verify(uname, check);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataSet GetProductsToCart(string username, int categoryid)
        {
            try
            {
                p = new ProductBLL();
                //    int categoryn = Convert.ToInt32(categoryid);
                DataSet ds = p.ProductCart(username, categoryid);
                return ds;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataSet GetCategories()
        {
            try
            {
                cb = new CategoryBLL();
                DataSet ds = cb.GetAllCategories();
                return ds;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataSet GetProductInfo(int productid)
        {
            try
            {
                p = new ProductBLL();
                DataSet ds = p.ProductInfo(productid);
                return ds;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataTable GetCardInfo(string username)
        {
            try
            {
                Card card = new Card();
                return card.GetCardInfo_BLL(username);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataTable GetOrderHistory(string username)
        {
            try
            {
                order = new OrderBLL();
                return order.GetOrderHistory_BLL(username);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public DataTable GetAllEMIHistory(string username)
        {
            try
            {
                transaction = new TransactionBLL();
                return transaction.GetAllEMIHistory_BLL(username);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public int PayInstallment(int orderid)
        {
            try
            {
                transaction = new TransactionBLL();
                return transaction.PayInstallment_BLL(orderid);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public bool OrderProduct(string username, int productid, int schemeid)
        {
            try
            {
                p = new ProductBLL();
                int rows = p.PlaceOrder(username, productid, schemeid);
                if (rows == 4)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public int UpdatePassword(string UserName, string NewPassword)
        {
            try
            {
                DBA = new UserBLL();
                return DBA.updatepasswordinuserbll(UserName, NewPassword);
            }
            catch (Exception)
            {
                
                throw;
            }

        }

        public DataTable GetMobileNumber(string UserName)
        {
            try
            {
                DBA = new UserBLL();
                return DBA.GetMobileNumberinbill(UserName);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }
}
