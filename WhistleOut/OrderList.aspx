<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="WhistleOut.OrderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ListView ID="ListView1" runat="server" DataSourceID="CustomerOrderList">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2;color: #284775;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:HyperLink ID="OrderNoLink" runat="server" Text='<%# Eval("OrderNo") %>' NavigateUrl='<%# String.Format("~/AssignProduct.aspx?id={0}", Eval("id"))%>' />
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Edit Order" NavigateUrl='<%# String.Format("~/EditOrder.aspx?id={0}", Eval("id"))%>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66;color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderNoTextBox" runat="server" Text='<%# Bind("OrderNo") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderNoTextBox" runat="server" Text='<%# Bind("OrderNo") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <%--<asp:Label ID="OrderNoLabel" runat="server" Text='<%# Eval("OrderNo") %>' />--%>
                        <asp:HyperLink ID="OrderNoLink" runat="server" Text='<%# Eval("OrderNo") %>' NavigateUrl='<%# String.Format("~/AssignProduct.aspx?id={0}", Eval("id"))%>' />
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Edit Order" NavigateUrl='<%# String.Format("~/EditOrder.aspx?id={0}", Eval("id"))%>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server">id</th>
                                    <th runat="server">OrderNo</th>
                                    <th></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderNoLabel" runat="server" Text='<%# Eval("OrderNo") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="CustomerOrderList" runat="server" SelectMethod="GetOrderByCustomerId" TypeName="WhistleOut.Model.WhistleOutDBFactory">
            <SelectParameters>
                <asp:QueryStringParameter Name="customerid" QueryStringField="customerid" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
