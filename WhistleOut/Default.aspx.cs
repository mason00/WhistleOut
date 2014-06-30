using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WhistleOut.Model;

namespace WhistleOut
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadData();
        }

        private static void LoadData()
        {
            using (var db = new WhistleOutDBContext())
            {
                //var cus = new Customer();
                //cus.FirstName = "Mason";
                //cus.LastName = "Hu";
                //db.Customers.Add(cus);
                for (int i = 0; i < 10; i++)
                {
                    Customer cus = db.Customers.Create();
                    cus.FirstName = String.Format("FName{0}", i);
                    cus.LastName = string.Format("LName{0}", i);
                    for (int j = 0; j < i * 5; j++)
                    {
                        Order order = db.Orders.Create();
                        order.OrderNo = String.Format("OrderNo_{0}{1}", i, j);
                        for (int k = 0; k < j * 2; k++)
                        {
                            Product product = db.Products.Create();
                            product.Name = String.Format("ProductName-{0}", k);
                            product.Quantity = k;
                            order.Products.Add(product);
                        }
                        cus.Orders.Add(order);
                    }
                    db.Customers.Add(cus);
                }
                db.SaveChanges();
            }
        }
    }
}