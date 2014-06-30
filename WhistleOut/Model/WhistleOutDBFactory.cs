using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WhistleOut.Model
{
    public class WhistleOutDBFactory
    {
        public Customer GetCustomerById(int id)
        {
            using (var db = new WhistleOutDBContext())
            {
                return db.Customers.FirstOrDefault(x => x.id == id);
            }
        }

        public void UpdateCustomer(Customer c)
        {
            using (var db = new WhistleOutDBContext())
            {
                db.Entry(c).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public Product GetProductById(int id)
        {
            using (var db = new WhistleOutDBContext())
            {
                return db.Products.FirstOrDefault(x => x.id == id);
            }
        }

        public void NewProduct(Product p)
        {
            using (var db = new WhistleOutDBContext())
            {
                db.Products.Add(p);
                db.SaveChanges();
            }
        }

        public Order GetOrderById(int id)
        {
            using (var db = new WhistleOutDBContext())
            {
                return db.Orders.FirstOrDefault(x => x.id == id);
            }
        }

        public ICollection<Order> GetOrderByCustomerId(int customerid)
        {
            using (var db = new WhistleOutDBContext())
            {
                return db.Customers.FirstOrDefault(x => x.id == customerid).Orders;
            }
        }

        public void NewOrder(int customerid, string OrderNo)
        {
            using (var db = new WhistleOutDBContext())
            {
                Customer c = db.Customers.FirstOrDefault(x => x.id == customerid);
                if (c != null)
                {
                    c.Orders.Add(new Order() { OrderNo = OrderNo });
                    db.SaveChanges();
                }
            }
        }

        public void UpdateOrder(Order o)
        {
            using (var db = new WhistleOutDBContext())
            {
                db.Entry(o).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }
    }
}