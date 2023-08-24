<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="marks.aspx.cs" Inherits="flex.marks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marks</title>
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
        .auto-style1 {
            position: relative;
            top: -16px;
            left: 535px;
        }
        .auto-style2 {
            position: absolute;
            left: 363px;
            top: 242px;
        }
        .auto-style3 {
            position: absolute;
            left: 417px;
            top: 600px;
            width: 208px;
        }
    </style>
    <link href="Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <ul>
                <li><a href="studentDash.aspx">Dashboard</a></li>
                <li><a href="Marks.aspx" class="active">Marks</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>Marks</h1>
            <!-- Add your attendance content here -->
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="25px" Width="125px" style="position:relative; top: -16px; left: 361px;" DataSourceID="SqlDataSource1" DataTextField="SemesterName" DataValueField="SemesterName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" SelectCommand="SELECT [SemesterName] FROM [semester]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Height="25px" Width="125px" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" CssClass="auto-style1">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" SelectCommand="getRegisteredCourses" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="RN" SessionField="rollNo" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Sem" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" CssClass="auto-style2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="marktype" HeaderText="marktype" SortExpression="marktype" />
                <asp:BoundField DataField="Weightage" HeaderText="Weightage" SortExpression="Weightage" />
                <asp:BoundField DataField="ObtainedMarks" HeaderText="AbsoluteObtainedMarks" SortExpression="ObtainedMarks" ReadOnly="True" />
                <asp:BoundField DataField="TotalMarks" HeaderText="TotalMarks" SortExpression="TotalMarks" />
                <asp:BoundField DataField="ObtainedMarks1" HeaderText="ObtainedMarks" SortExpression="ObtainedMarks1" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" DeleteCommand="DELETE FROM [marks] WHERE [marktype] = @marktype AND [CourseID] = @CourseID AND [rollNo] = @rollNo AND [Semester] = @Semester" InsertCommand="INSERT INTO [marks] ([marktype], [Weightage], [ObtainedMarks], [TotalMarks], [CourseID], [rollNo], [Semester]) VALUES (@marktype, @Weightage, @ObtainedMarks, @TotalMarks, @CourseID, @rollNo, @Semester)" SelectCommand="getStudentMarks" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [marks] SET [Weightage] = @Weightage, [ObtainedMarks] = @ObtainedMarks, [TotalMarks] = @TotalMarks WHERE [marktype] = @marktype AND [CourseID] = @CourseID AND [rollNo] = @rollNo AND [Semester] = @Semester">
            <DeleteParameters>
                <asp:Parameter Name="marktype" Type="String" />
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter Name="rollNo" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="marktype" Type="String" />
                <asp:Parameter Name="Weightage" Type="Int32" />
                <asp:Parameter Name="ObtainedMarks" Type="Int32" />
                <asp:Parameter Name="TotalMarks" Type="Int32" />
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter Name="rollNo" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="RN" SessionField="rollNo" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Sem" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="course" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Weightage" Type="Int32" />
                <asp:Parameter Name="ObtainedMarks" Type="Int32" />
                <asp:Parameter Name="TotalMarks" Type="Int32" />
                <asp:Parameter Name="marktype" Type="String" />
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter Name="rollNo" Type="String" />
                <asp:Parameter Name="Semester" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Total Absolutes"></asp:Label>
        : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Total Obtained Absolutes"></asp:Label>
        :&nbsp;
    <p>
        <asp:Button ID="Button1" runat="server" Text="Generate Total" CssClass="auto-style3" OnClick="Button1_Click"/>
        </p>
    </form>
    </body>
</html>