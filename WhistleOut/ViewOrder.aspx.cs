using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WhistleOut.Model;

namespace WhistleOut
{
    public partial class NewOrder : System.Web.UI.Page
    {
        private int CustomerID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Request.QueryString["customerid"] != null)
                {
                    Int32.TryParse(Request.QueryString["customerid"], out CustomerID);
                }
            }
        }

        protected void OrderDataSource_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            
        }
    }
}