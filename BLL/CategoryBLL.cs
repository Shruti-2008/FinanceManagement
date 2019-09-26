using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class CategoryBLL
    {
        
        MyDataAccess SDBA;
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }

        public CategoryBLL()
        {
            SDBA = new MyDataAccess("DBConnection");
        }
        public DataSet GetAllCategories()
        {
            DataSet ds = new DataSet();
            ds = SDBA.CategoryList();
            return ds;
        }
        
    }
}
