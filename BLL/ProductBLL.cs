using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProductBLL
    {
        
        MyDataAccess SDBA;
        public int ProdID { get; set; }
        public string ProdName { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double ProcessingFee { get; set; }
        public int CategoryID { get; set; }
        public dynamic ProdImage { get; set; }
        public ProductBLL Select()
        {
            this.ProdID = 101;
            this.ProdName = "Apple";
            return this;
        }

        public ProductBLL()
        {
            SDBA = new MyDataAccess("DBConnection");
        }

       
        public DataSet ProductCart(string username, int categoryid = 1)
        {
            DataSet ds = new DataSet();
            ds = SDBA.ProductCart(username, categoryid);
            return ds;
        }
        public DataSet ProductInfo(int productid)
        {
            DataSet ds = new DataSet();
            // this.ProdID = productid;
            ds = SDBA.ProductInfo(productid);
            return ds;
        }

    }
}
