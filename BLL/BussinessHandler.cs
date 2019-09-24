using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BussinessHandler
    {
        Object DBA = null;

        public BussinessHandler()
        {
            DBA = new Object();

        }
        enum cardtype
        {
            Platinum = 1,
            Gold = 2
        }
        enum banktype
        {
            HDFC = 1,
            ICICI = 2
        }
    }
}
