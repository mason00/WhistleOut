<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignProduct.aspx.cs" Inherits="WhistleOut.NewOrder1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <script src="Scripts/knockout-3.1.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="OrderDS" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="OrderDS" runat="server" SelectMethod="GetOrderById" TypeName="WhistleOut.Model.WhistleOutDBFactory">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div>
        <h3>Existing Products</h3>
        <table>
            <tr>
                <th>Name</th>
                <th>Quantity</th>
            </tr>
            <tbody data-bind="foreach: ExistingProducts">
            <tr>
                <td data-bind="text: Name"></td>
                <td data-bind="text: Quantity"></td>
                <td><button data-bind="click: $parent.RemoveP">Remove from Order</button></td>
            </tr>
            </tbody>
        </table>
        <h3>Available Products</h3>
        <table>
            <tr>
                <th>Name</th>
                <th>Quantity</th>
            </tr>
            <tbody data-bind="foreach: Products">
            <tr>
                <td data-bind="text: Name"></td>
                <td data-bind="text: Quantity"></td>
                <td><button data-bind="click: $parent.Assign">Assign to Order</button></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div style="display:none"><asp:Label ID="OrderId" runat="server" Text="Label"></asp:Label></div>
    </form>
    <script type="text/javascript">
        function AvailableProducts()
        {
            var self = this;
            this.Products = ko.observableArray([]);
            this.ExistingProducts = ko.observableArray([]);
            this.OrderId = ko.observable();
            self.LoadProducts = function ()
            {
                $.getJSON("/api/Product/", function (data)
                {
                    self.Products(data);
                });
                $.getJSON("/api/Product/?OrderId=" + self.OrderId(), function (data)
                {
                    self.ExistingProducts(data);
                });
            }
            self.Assign = function (p)
            {
                $.post("/api/Product/", { ProductId: p.id, OrderId: self.OrderId, Remove: false })
                    .done(function (data)
                    {
                        var cloneP = {};
                        cloneP.id = p.id
                        cloneP.Name = p.Name;
                        cloneP.Quantity = p.Quantity;
                        self.ExistingProducts.push(cloneP);
                        self.ExistingProducts.sort(function (left, right) { return left.Name == right.Name ? 0 : (left.Name < right.Name ? -1 : 1) });
                        self.Products.destroy(p);
                    });
            }

            self.RemoveP = function (p)
            {
                $.post("/api/Product/", { ProductId: p.id, OrderId: self.OrderId, Remove: true })
                    .done(function (data)
                    {
                        var cloneP = {};
                        cloneP.id = p.id
                        cloneP.Name = p.Name;
                        cloneP.Quantity = p.Quantity;
                        self.Products.push(cloneP);
                        self.Products.sort(function (left, right) { return left.Name == right.Name ? 0 : (left.Name < right.Name ? -1 : 1) });
                        self.ExistingProducts.destroy(p);
                    });
            }
        }
        var prd = new AvailableProducts()
        prd.OrderId($('#OrderId').text());
        ko.applyBindings(prd);
        prd.LoadProducts();
    </script>
</body>
</html>
