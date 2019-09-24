using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    class DatabaseHandlerFactory
    {
        private ConnectionStringSettings connectionStringSettings;

            public DatabaseHandlerFactory(string connectionStringName)
            {
                connectionStringSettings = ConfigurationManager.ConnectionStrings[connectionStringName];
            }

            public IDatabaseHandler CreateDatabase()
            {
                IDatabaseHandler database = null;

                switch ("System.Data.SqlClient".ToLower())
                {
                    case "system.data.sqlclient":
                        database = new SqlDataAccess("Data Source=INFVA05690;Initial Catalog=FinanceCaseStudy;User ID=sa;Password=Newuser123");
                        break;
                    //case "system.data.oracleclient":
                    //    database = new OracleDataAccess(connectionStringSettings.ConnectionString);
                    //    break;
                    //case "system.data.oleDb":
                    //    database = new OledbDataAccess(connectionStringSettings.ConnectionString);
                    //    break;
                    //case "system.data.odbc":
                    //    database = new OdbcDataAccess(connectionStringSettings.ConnectionString);
                    //    break;
                }

                return database;
            }

            public string GetProviderName()
            {
                //return connectionStringSettings.ProviderName;
                return "System.Data.SqlClient";
            }
        }
    
}
