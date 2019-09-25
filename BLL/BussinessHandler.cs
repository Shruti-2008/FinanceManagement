using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BussinessHandler
    {
        UserBLL DBA;

        public BussinessHandler()
        {
            DBA = new UserBLL();

        }
        
        public int RegisterFunction(string FullName, int PhoneNo, string Email, string UserName, string Address, string Password, DateTime DateOfBirth, int CardTypeID, int BankID, int AccountNo, int IFSCCode, bool Verified, int CardNumber)
        {
            DBA = new UserBLL(FullName, PhoneNo, Email, UserName, Address, Password, DateOfBirth, CardTypeID, BankID, AccountNo, IFSCCode, Verified, CardNumber);
            return DBA.SaveinDB();
        }

    }
}
