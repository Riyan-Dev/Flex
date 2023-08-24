<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditLog.aspx.cs" Inherits="WebApplication3.AuditLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:BoundField DataField="AuditData" HeaderText="AuditData" SortExpression="AuditData" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="SELECT [AuditData] FROM [AuditLog]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
