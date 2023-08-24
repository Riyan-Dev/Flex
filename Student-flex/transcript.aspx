<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transcript.aspx.cs" Inherits="flex.transcript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transcript</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            width: 200px;
            background-color: cornflowerblue;
            padding: 20px;
            height: 100vh;
            position: fixed;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar li {
            margin-bottom: 10px;
        }

        .sidebar a {
            display: block;
            padding: 10px;
            font-size: 18px;
            color: white;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: white;
            color: cornflowerblue;
        }

        .sidebar a.active {
            background-color: white;
            color: cornflowerblue;
        }

        .content {
            margin-left: 220px;
            padding: 20px;
            background-color: white;
        }

        h1 {
            margin-top: 0;
        }
    </style>
    <link href="Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <ul>
                <li><a href="studentDash.aspx">Dashboard</a></li>
                <li><a href="transcript.aspx" class="active">Transcript</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>Transcript</h1>
            <!-- Add your transcript content here -->
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" style="margin-left: 220px; margin-top: 20px;">
            <Columns>
                <asp:BoundField DataField="grade" HeaderText="Grade" SortExpression="grade" />
                <asp:BoundField DataField="gradeLB" HeaderText="Grade Lower Bound" SortExpression="gradeLB" />
                <asp:BoundField DataField="gradeUB" HeaderText="Grade Upper Bound" SortExpression="gradeUB" />
                <asp:BoundField DataField="CourseID" HeaderText="Course ID" SortExpression="CourseID" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
            </Columns>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" SelectCommand="SELECT [grade], [gradeLB], [gradeUB], [CourseID], [Semester] FROM [grades]"></asp:SqlDataSource>
                </form>
    </body>
</html>
