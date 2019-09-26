using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{
    public class UserBLL
    {
        static MyDataAccess SDBA;
        public string UserName { get; set; }
        public string FullName { get; set; }
        public int PhoneNo { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public int CardTypeID { get; set; }
        public int CardNumber { get; set; }
        public bool Verified { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Password { get; set; }
        public int AccountNo { get; set; }
        public int BankID { get; set; }
        public int IFSCCode { get; set; }
        public UserBLL(string FullName, int PhoneNo, string Email, string UserName, string Address, string Password, DateTime DateOfBirth, int CardTypeID, int BankID, int AccountNo, int IFSCCode, bool Verified, int CardNumber)
        {
            this.FullName = FullName;
            this.UserName = UserName;
            this.PhoneNo = PhoneNo;
            this.Email = Email;
            this.Address = Address;
            this.CardNumber = CardNumber;
            this.Password = Password;
            this.Verified = Verified;
            this.IFSCCode = IFSCCode;
            this.BankID = BankID;
            this.AccountNo = AccountNo;
            this.DateOfBirth = DateOfBirth;
            this.CardTypeID = CardTypeID;

        }
        static UserBLL()
        {
            SDBA = new MyDataAccess("DBConnection");
        }

        public UserBLL(string UserName, string Password)
        {
            this.UserName = UserName;
            this.Password = Password;

        }

        public UserBLL()
        {
            // TODO: Complete member initialization
        }
        internal int SaveinDB()
        {
            return SDBA.AddUser(this);
        }

        internal bool ValidateFromDB()
        {
            if (SDBA.Login(this).Rows.Count > 0)
                return true;
            else
                return false;
        }

        internal DataTable GetUserFromDB()
        {
            return SDBA.Login(this);
        }

        internal bool checkfromDB(string p)
        {
            
            if (SDBA.CheckUsername(p).Rows.Count > 0)
                return true;
            else
                return false;
        }

        internal DataSet GetUser()
        {
            return SDBA.GetUsers();
        }

        internal int Verify(string uname, int n)
        {
            return SDBA.AdminUserVerification(uname, n);
        }
    }
}
