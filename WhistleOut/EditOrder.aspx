<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="WhistleOut.EditOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="OrderDS" DefaultMode="Edit" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="true"/>
                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="OrderDS" runat="server" DataObjectTypeName="WhistleOut.Model.Order" SelectMethod="GetOrderById" TypeName="WhistleOut.Model.WhistleOutDBFactory" UpdateMethod="UpdateOrder">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
