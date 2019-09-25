using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MyDataAccess
    {
        DBManager dbManager;
        List<IDbDataParameter> parameters;
        public MyDataAccess(string ConnName)
        {
            dbManager = new DBManager(ConnName.ToString());
            parameters = new List<IDbDataParameter>();
        }
        public IDataReader CheckUsername(dynamic username)
        {
            IDbConnection connection = null;
            parameters.Add(dbManager.CreateParameter("@uname", username, DbType.String));
            return dbManager.GetDataReader("UserNameExists", CommandType.StoredProcedure, parameters.ToArray(), out connection);
        }

        public int AdminUserVerification(dynamic u)
        {
            parameters.Add(dbManager.CreateParameter("@uname", u.UserName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@checked", u.Verified, DbType.String));
            parameters.Add(dbManager.CreateParameter("@error", ParameterDirection.Output, DbType.String));
            return dbManager.Update("AdminUserVerification", CommandType.StoredProcedure, parameters.ToArray());
        }


        public int AddUser(dynamic u)
        {
            string error = "";
            parameters.Add(dbManager.CreateParameter("@fullname", u.FullName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@phoneno", u.PhoneNo, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@email", u.Email, DbType.String));
            parameters.Add(dbManager.CreateParameter("@username", u.UserName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@address", u.Address, DbType.String));
            parameters.Add(dbManager.CreateParameter("@dateofbirth", u.DateOfBirth, DbType.Date));
            parameters.Add(dbManager.CreateParameter("@password", u.Password, DbType.String));
            parameters.Add(dbManager.CreateParameter("@cardtypeid", u.CardTypeID, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@bankid", u.BankID, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@accountno", u.AccountNo, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@ifsccode", u.IFSCCode, DbType.String));
            parameters.Add(dbManager.CreateParameter("@verified", u.Verified, DbType.Boolean));
            parameters.Add(dbManager.CreateParameter("@error", ParameterDirection.Output, DbType.Int32));

            return dbManager.Insert("UserRegistration", CommandType.StoredProcedure, parameters.ToArray(), out error);
        }

        public IDataReader UserCardInfo(dynamic u)
        {
            IDbConnection connection = null;
            parameters.Add(dbManager.CreateParameter("@username", u.UserName, DbType.String));
            return dbManager.GetDataReader("GetCardInfo", CommandType.StoredProcedure, parameters.ToArray(), out connection);
        }

        public IDataReader UserEmiHistory(dynamic u)
        {
            IDbConnection connection = null;
            parameters.Add(dbManager.CreateParameter("@uname", u.UserName, DbType.String));
            return dbManager.GetDataReader("GetEMIHistory", CommandType.StoredProcedure, parameters.ToArray(), out connection);
        }

        public DataSet OrderHistory(dynamic u)
        {
            parameters.Add(dbManager.CreateParameter("@username", u.UserName, DbType.String));
            return dbManager.GetDataSet("GetOrderHistory", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataSet ProductCart(dynamic u, dynamic c)
        {
            parameters.Add(dbManager.CreateParameter("@username", u.UserName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@categoryid", c.CategoryID, DbType.String));
            return dbManager.GetDataSet("GetAllProducts", CommandType.StoredProcedure, parameters.ToArray());
        }

        public IDataReader CategoryList()
        {
            IDbConnection connection = null;
            return dbManager.GetDataReader("GetAllCategories", CommandType.StoredProcedure, parameters.ToArray(), out connection);
        }

        public IDataReader ProductInfo(dynamic p)
        {
            IDbConnection connection = null;
            parameters.Add(dbManager.CreateParameter("@productid", p.ProductId, DbType.Int32));
            return dbManager.GetDataReader("GetProductInfoById", CommandType.StoredProcedure, parameters.ToArray(), out connection);
        }

        public int PlaceOrder(dynamic username, dynamic productid, dynamic schemeid)
        {
            parameters.Add(dbManager.CreateParameter("@uname", username, DbType.String));
            parameters.Add(dbManager.CreateParameter("@productid", productid, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@schemeid", schemeid, DbType.Int32));
            // parameters.Add(dbManager.CreateParameter("@error", ParameterDirection.Output, DbType.String));
            return dbManager.Insert("PlaceOrder", CommandType.StoredProcedure, parameters.ToArray());
        }

        public int Payment(dynamic orderid)
        {
            parameters.Add(dbManager.CreateParameter("@orderID", orderid, DbType.Int32));
            return dbManager.Insert("PayInstallment", CommandType.StoredProcedure, parameters.ToArray());
        }


        public IDataReader Login(dynamic u)
        {
            IDbConnection connection = null;
            parameters.Add(dbManager.CreateParameter("@uname", u.UserName, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@pwd", u.Password, DbType.Int32));
            return dbManager.GetDataReader("SignIn", CommandType.StoredProcedure, parameters.ToArray(), out connection);
        }
    }
}
