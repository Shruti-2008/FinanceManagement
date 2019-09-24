using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProductBLL
    {
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
    }
}
