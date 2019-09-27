using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Card
    {
        MyDataAccess SDBA;

        public string CardName { get; set; }
        public long CardNumber { get; set; }
        public DateTime CardValidity { get; set; }
        public bool ActivationStatus { get; set; }
        public decimal CreditLimit { get; set; }
        public decimal CreditBalance { get; set; }

        public Card()
        {
            SDBA = new MyDataAccess("DBConnection");
        }

        public DataTable GetCardInfo_BLL(string username)
        {
            try
            {
                DataTable dt = SDBA.UserCardInfo(username);

                this.CardName = (string)dt.Rows[0]["cardname"];
                this.CardNumber = (long)dt.Rows[0]["cardnumber"];
                this.CardValidity = (DateTime)dt.Rows[0]["validity"];
                this.ActivationStatus = (bool)dt.Rows[0]["activationstatus"];
                this.CreditLimit = (decimal)dt.Rows[0]["creditlimit"];
                this.CreditBalance = (decimal)dt.Rows[0]["creditbalance"];
                return dt;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
