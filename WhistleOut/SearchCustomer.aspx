<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchCustomer.aspx.cs" Inherits="WhistleOut.SearchCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Customer</title>
    <script src="Scripts/knockout-3.1.0.js"></script>
    <script src="Scripts/jquery-1.7.1.min.js"></script>
</head>
    
<body>
    <form action="#" method="post">
    <div>
        <input data-bind='value: searchValue'/><button data-bind='click: SearchCustomer'>Search</button>
        <a href="NewProduct.aspx">New Product</a>
        <table data-bind="foreach: customers">
            <tr>
                <td data-bind="text: FirstName + ' ' + LastName"></td>
                <td><a data-bind="attr: {href: 'OrderList.aspx?customerid=' + id}">View Order</a></td>
            </tr>
        </table>
    </div>
    </form>
</body>
    <script type="text/javascript">
        function searchObj()
        {
            var self = this;
            this.searchValue = ko.observable("Name");
            this.customers = ko.observableArray();
            this.SearchCustomer = function ()
            {
                $.getJSON("/api/Customer/?searchString=" + self.searchValue(), function (data)
                {
                    self.customers(data);
                });
            }
        }
        var so = new searchObj()
        ko.applyBindings(so);
    </script>
</html>
