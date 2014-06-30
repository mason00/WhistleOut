using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WhistleOut.Model
{
    public class Order
    {
        public Order()
        {
            Products = new HashSet<Product>();
        }
        public int id { get; set; }
        public string OrderNo { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}