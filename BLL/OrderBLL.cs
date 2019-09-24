using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class OrderBLL
    {
        public int OrderID { get; set; }
        public int CardNumber { get; set; }
        public int ProductID { get; set; }
        public int SchemeID { get; set; }
        public DateTime OrderDate { get; set; }
        public double MonthlyInstallment { get; set; }
        public double Balance { get; set; }

    }
}
