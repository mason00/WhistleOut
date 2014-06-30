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
    public class CustomerController : ApiController
    {
        // GET api/<controller>
        public HttpResponseMessage Get()
        {
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, "value");
            string result;
            using (var db = new WhistleOutDBContext())
            {
                var cus = from c in db.Customers
                          select c;
                var jss = new JavaScriptSerializer();
                result = jss.Serialize(cus.ToList());
            }
            response.Content = new StringContent(result, Encoding.Unicode);
            return response;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        public HttpResponseMessage Get(string searchString)
        {
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, "value");
            string result;
            using (var db = new WhistleOutDBContext())
            {
                var cus = from c in db.Customers
                          where c.FirstName.Contains(searchString) || c.LastName.Contains(searchString)
                          orderby c.FirstName
                          select new { FirstName = c.FirstName, LastName = c.LastName, id = c.id };
                var jss = new JavaScriptSerializer();
                result = jss.Serialize(cus.ToList());
            }
            response.Content = new StringContent(result, Encoding.Unicode);
            return response;
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
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