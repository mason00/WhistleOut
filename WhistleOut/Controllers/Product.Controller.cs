using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Web.Script.Serialization;
using WhistleOut.Model;

namespace WhistleOut.Controllers
{
    public class ProductController : ApiController
    {
        // GET api/<controller>
        public HttpResponseMessage Get()
        {
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, "value");
            string result;
            using (var db = new WhistleOutDBContext())
            {
                var prod = from p in db.Products
                          where p.MasterOrder == null
                          orderby p.Name
                          select new { p.id, p.Name, p.Quantity };
                var jss = new JavaScriptSerializer();
                result = jss.Serialize(prod.ToList());
            }
            response.Content = new StringContent(result, Encoding.Unicode);
            return response;
        }

        public HttpResponseMessage Get(int OrderId)
        {
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, "value");
            string result;
            using (var db = new WhistleOutDBContext())
            {
                var prod = from p in db.Products
                           where p.MasterOrder.id == OrderId
                           orderby p.Name
                           select new { p.id, p.Name, p.Quantity };
                var jss = new JavaScriptSerializer();
                result = jss.Serialize(prod.ToList());
            }
            response.Content = new StringContent(result, Encoding.Unicode);
            return response;
        }

        // POST api/<controller>
        //public void Post([FromBody]string value)
        //{
        //}

        public void Post(ProductOrder po)
        {
            using (var db = new WhistleOutDBContext())
            {
                Order o = db.Orders.First(x => x.id == po.OrderId);
                Product p = db.Products.First(y => y.id == po.ProductId);
                if (!po.Remove)
                {
                    o.Products.Add(p);
                }
                else
                {
                    o.Products.Remove(p);
                }
                db.SaveChanges();
            }
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}