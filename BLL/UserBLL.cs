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
        public Int64 PhoneNo { get; set; }
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
        public UserBLL(string FullName, Int64 PhoneNo, string Email, string UserName, string Address, string Password, DateTime DateOfBirth, int CardTypeID, int BankID, int AccountNo, int IFSCCode, bool Verified, int CardNumber)
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
            try
            {
                return SDBA.AddUser(this);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal bool ValidateFromDB()
        {
            try
            {
                if (SDBA.Login(this).Rows.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal DataTable GetUserFromDB()
        {
            try
            {
                return SDBA.Login(this);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal bool checkfromDB(string p)
        {
            try
            {
                if (SDBA.CheckUsername(p).Rows.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal DataSet GetUser()
        {
            try
            {
                return SDBA.GetUsers();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal int Verify(string uname, int n)
        {
            try
            {
                return SDBA.AdminUserVerification(uname, n);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal int updatepasswordinuserbll(string username, string newpassword)
        {
            try
            {
                return SDBA.UpdatePassword(username, newpassword);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        internal DataTable GetMobileNumberinbill(string username)
        {
            try
            {
                return SDBA.GetMobileNumber(username);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
