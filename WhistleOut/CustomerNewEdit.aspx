<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerNewEdit.aspx.cs" Inherits="WhistleOut.CustomerNewEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="CustomerObjDataSource" Height="50px" Width="125px" AutoGenerateRows="False">
            <Fields>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Text='<%# Bind("id") %>' Visible="false"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="CustomerObjDataSource" runat="server" SelectMethod="GetCustomerById" TypeName="WhistleOut.Model.WhistleOutDBFactory" DataObjectTypeName="WhistleOut.Model.Customer" UpdateMethod="UpdateCustomer">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
