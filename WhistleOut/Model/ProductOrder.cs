using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WhistleOut.Model
{
    public class ProductOrder
    {
        public int ProductId { get; set; }
        public int OrderId { get; set; }
        public bool Remove { get; set; }
    }
}