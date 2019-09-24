using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    public  class SqlDataAccess : IDatabaseHandler
    {
        private string ConnectionString { get; set; }

        public SqlDataAccess(string connectionString)
        {
            ConnectionString = connectionString;
        }

        public int AddUser(dynamic u)
        {
            
            var dbManager = new DBManager("DBConnection");
            var parameters = new List<IDbDataParameter>();
            string error = "";
            parameters.Add(dbManager.CreateParameter("@fullname", u.FullName, DbType.String));
            parameters.Add(dbManager.CreateParameter("@phoneno",u.PhoneNo, DbType.Int32));
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
            parameters.Add(dbManager.CreateParameter("@error", ParameterDirection.Output, DbType.Int32)) ;
            
            return dbManager.Insert("UserRegistration", CommandType.StoredProcedure, parameters.ToArray(), out error);
        }


        public IDbConnection CreateConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        public void CloseConnection(IDbConnection connection)
        {
            var sqlConnection = (SqlConnection)connection;
            sqlConnection.Close();
            sqlConnection.Dispose();
        }

        public IDbCommand CreateCommand(string commandText, CommandType commandType, IDbConnection connection)
        {
            return new SqlCommand
            {
                CommandText = commandText,
                Connection = (SqlConnection)connection,
                CommandType = commandType
            };
        }

        public IDataAdapter CreateAdapter(IDbCommand command)
        {
            return new SqlDataAdapter((SqlCommand)command);
        }

        public IDbDataParameter CreateParameter(IDbCommand command)
        {
            SqlCommand SQLcommand = (SqlCommand)command;
            return SQLcommand.CreateParameter();
        }
    }
}
