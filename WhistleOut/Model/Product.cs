using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WhistleOut.Model
{
    public class Product
    {
        public int id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public virtual Order MasterOrder { get; set; }
    }
}