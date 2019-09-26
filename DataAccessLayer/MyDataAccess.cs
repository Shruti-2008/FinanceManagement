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
            dbManager = new DBManager(ConnName);
           
        }
        public DataTable CheckUsername(dynamic username)
        {    
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@uname", username, DbType.String));
            return dbManager.GetDataTable("UserNameExists", CommandType.StoredProcedure, parameters.ToArray());
        }

        public int AdminUserVerification(string uname, int verified)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@uname", uname, DbType.String));
            parameters.Add(dbManager.CreateParameter("@checked", verified, DbType.String));
            parameters.Add(dbManager.CreateParameter("@error", ParameterDirection.Output, DbType.String));
            return dbManager.Update("AdminUserVerification", CommandType.StoredProcedure, parameters.ToArray());
        }

        public int AddUser(dynamic u)
        {
            string error = "";
            parameters = new List<IDbDataParameter>();
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

        public DataSet GetUsers()
        {
            parameters = new List<IDbDataParameter>();
            return dbManager.GetDataSet("GetAllUsers", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataTable UserCardInfo(string u)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@username", u, DbType.String));
            return dbManager.GetDataTable("GetEMICardInfo", CommandType.StoredProcedure, parameters.ToArray());
        }


        public DataTable UserEmiHistory(string u)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@uname", u, DbType.String));
            return dbManager.GetDataTable("GetEMIHistory", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataTable OrderHistory(string u)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@username", u, DbType.String));
            return dbManager.GetDataTable("GetOrderHistory", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataSet ProductCart(dynamic u, dynamic c)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@username", u.UserName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@categoryid", c.CategoryID, DbType.String));
            return dbManager.GetDataSet("GetAllProducts", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataSet CategoryList()
        {
            parameters = new List<IDbDataParameter>();
            return dbManager.GetDataSet("GetAllCategories", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataSet ProductInfo(int productid)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@productid", productid, DbType.Int32));
            return dbManager.GetDataSet("GetProductInfoById", CommandType.StoredProcedure, parameters.ToArray());
        }

        public int PlaceOrder(dynamic username, dynamic productid, dynamic schemeid)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@uname", username, DbType.String));
            parameters.Add(dbManager.CreateParameter("@productid", productid, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@schemeid", schemeid, DbType.Int32));
            // parameters.Add(dbManager.CreateParameter("@error", ParameterDirection.Output, DbType.String));
            return dbManager.Insert("PlaceOrder", CommandType.StoredProcedure, parameters.ToArray());
        }

        public int Payment(dynamic orderid)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@orderID", orderid, DbType.Int32));
            return dbManager.Insert("PayInstallment", CommandType.StoredProcedure, parameters.ToArray());
        }

        public DataTable Login(dynamic u)
        {
            parameters = new List<IDbDataParameter>();
            parameters.Add(dbManager.CreateParameter("@uname", u.UserName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@pwd", u.Password, DbType.String));
            return dbManager.GetDataTable("SignIn", CommandType.StoredProcedure, parameters.ToArray());
        }
    }
}
