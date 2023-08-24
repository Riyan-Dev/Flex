<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="flex.attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance</title>
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
        .newStyle2 {
            font-family: Arial;
            font-size: large;
            font-weight: bold;
            color: #000000;
            /*background-color: #6495ED;*/
            top: -35px;
            left: -400px;
        }
    </style>
    <link href="Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <ul>
                <li><a href="studentDash.aspx">Dashboard</a></li>
                <li><a href="Attendance.aspx" class="active">Attendance</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>Attendance</h1>
            <!-- Add your attendance content here -->
        </div>
        <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="125px" style="position:relative; top: -16px; left: 361px;" DataSourceID="SqlDataSource1" DataTextField="SemesterName" DataValueField="SemesterName" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" SelectCommand="SELECT [SemesterName] FROM [semester]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList3" runat="server" Height="25px" Width="125px" style="position:relative; top: -16px; left: 535px;" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" SelectCommand="getRegisteredCourses" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="RN" SessionField="rollNo" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="Sem" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="newStyle2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Percentage: "></asp:Label>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate Percentage" style="position:relative; top: -50px; left: 450px"/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" style="position:relative; top: 87px; left: 400px; margin-top: 0px;" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Datee" HeaderText="Datee" SortExpression="Datee" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                <asp:BoundField DataField="Presence" HeaderText="Presence" SortExpression="Presence" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" DeleteCommand="DELETE FROM [Attendance] WHERE [rollNo] = @rollNo AND [Semester] = @Semester AND [CourseID] = @CourseID AND [Datee] = @Datee" InsertCommand="INSERT INTO [Attendance] ([rollNo], [Semester], [CourseID], [Datee], [Duration], [Presence]) VALUES (@rollNo, @Semester, @CourseID, @Datee, @Duration, @Presence)" SelectCommand="getStudentAttendance" UpdateCommand="UPDATE [Attendance] SET [Duration] = @Duration, [Presence] = @Presence WHERE [rollNo] = @rollNo AND [Semester] = @Semester AND [CourseID] = @CourseID AND [Datee] = @Datee" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="rollNo" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter DbType="Date" Name="Datee" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="rollNo" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter DbType="Date" Name="Datee" />
                <asp:Parameter Name="Duration" Type="Int32" />
                <asp:Parameter Name="Presence" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="RN" SessionField="rollNo" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="Sem" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList3" Name="course" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Duration" Type="Int32" />
                <asp:Parameter Name="Presence" Type="String" />
                <asp:Parameter Name="rollNo" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter DbType="Date" Name="Datee" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>