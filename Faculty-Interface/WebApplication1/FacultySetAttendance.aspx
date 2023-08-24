<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultySetAttendance.aspx.cs" Inherits="WebApplication1.FacultySetAttendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 570px;
        }
    </style>
</head>
<body style="background-color: silver; width: 100%; height: 100%; background-attachment: fixed; background-position: top; background-repeat: no-repeat; background-size: cover;">
    <div class="bg" >
        <div class ="navbar">
            <div = "column" >
                <a href="FacultyDashBoard.aspx"> <img alt="" class="img" src="flex-logo-blue%20(1).png" /> </a>

            </div>
            <div>
		        <nav>
            

			        <ul id="HomePageItems"> <!-- navigation bar item divison -->
				        <li><a href="FacultySetAttendance.aspx"> <img class="img" src="attendance.png"/></a></li> <!-- linking to Attendance page -->
                        <li><a href="Grades.aspx"> <img class="img" src="Grades.png"/></a></li> <!-- linking to grades page -->
                        <li><a href="FeedBack.aspx"> <img class="img" src="report.png"/></a></li> <!-- linking to cart page -->
                        <li><a href="Report.aspx"> <img class="img" src="Distribution.png"/></a></li> <!-- linking to cart page -->
                        <li><a href="CourseAllocationView.aspx"> <img class="img" src="CourseAllocation.png"/></a></li> <!-- linking to CourseAllocation page -->
                        <li><a href="marks.aspx"> <img class="img" src="pngwing.com.png"/></a></li> <!-- linking to Marks page -->
				        
                     
					
			        </ul>
		        </nav>
            </div>
        </div>
        <div id ="form">
            <form id="form1" runat="server">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label3" runat="server" Text="Semester" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList class = "dl" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="SemesterName" DataValueField="SemesterName" AutoPostBack="True" style ="border:none">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label1" runat="server" Text="Course" Font-Bold="True"></asp:Label>
&nbsp;&nbsp; <asp:DropDownList class = "dl" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" Width="153px">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label2" runat="server" Text="Section" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;
                <asp:DropDownList class = "dl" ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="secID" DataValueField="secID" style ="border:none">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label4" runat="server" Text="Date" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged1" AutoPostBack="True" TextMode="Date" placeholder="YYYY-MM-DD" ></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="SELECT SemesterName FROM semester"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getAlocCourse" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="FacultyID" SessionField="facultyID" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="Sem" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label6" runat="server" Text="Credit Hours" Font-Bold="True"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button class = "button" ID="Button2" runat="server" OnClick="Button2_Click" Text="generate Attendance Sheet" />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label5" runat="server" Font-Bold="True" Font-Overline="False" Text="Presense"></asp:Label>
&nbsp;<asp:DropDownList class = "dl" ID="DropDownList4" runat="server" AutoPostBack="True" style ="border:none">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>P</asp:ListItem>
                    <asp:ListItem>A</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button class = "button" ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getSection" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="FacultyID" SessionField="facultyID" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="CourseID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="Sem" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;
                <div style="margin-left: 600px">
                    <asp:Label class = "label" ID="Label7" runat="server" Font-Bold="True" style="color: red"></asp:Label>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="rollNo" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="auto-style1" Width="628px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="rollNo" HeaderText="rollNo" ReadOnly="True" SortExpression="rollNo" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                        <asp:BoundField DataField="Presence" HeaderText="Presence" SortExpression="Presence" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getAttendance" SelectCommandType="StoredProcedure" UpdateCommand="getAttendance" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="sem" PropertyName="SelectedValue" Type="String" DefaultValue="Fall 2022" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="CID" PropertyName="SelectedValue" Type="String" DefaultValue="CS102" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="S" PropertyName="SelectedValue" Type="String" DefaultValue="G" />
                        <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="DT" PropertyName="Text" DefaultValue="2023-11-05" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sem" Type="String" />
                        <asp:Parameter Name="CID" Type="String" />
                        <asp:Parameter Name="S" Type="String" />
                        <asp:Parameter DbType="Date" Name="DT" />
                    </UpdateParameters>
                </asp:SqlDataSource>
             
       

            </form>
        </div>
       
     </div>
</body>
</html>
