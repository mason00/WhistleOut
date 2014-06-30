0. Folder in Project
Model/
EF entity and DBFactory
Controller/
Web api controller for ajax call

1. /SearchCustomer.aspx
Set to start page
Ajax searching using Asp.Net web api and jQuery
Result databind using Knockout

2. /Default.aspx
LoadData() to create seed data

3. /NewProduct.aspx
web form DetailsView control for creating 
new un-assigned product

4. /OrderList.aspx?customerid=44
After searching the customer
View Order is clickable and point to this page
web form grid control to show all the orders of customer
Click Edit Order will navigate to EditOrder.aspx page

5. /AssignProduct.aspx?id=232
Assign and remove product for one order
ClientSide AvailableProducts.LoadProducts will load
Existing Products of order and all available products without order
Remove/Assign button is provided with ajax call to aps.net web api for processing
ClientSide will also using Knockout to push/destroy product in observable array
to refresh the UI bi-directionly

6. /EditOrder.aspx?id=217
Edit order name using DetailsView control