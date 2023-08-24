<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setMarks.aspx.cs" Inherits="WebApplication1.setMarks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 225px;
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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <div class="row1">
                    <div class="col-md-12 school-options-dropdown text-center">
                    <div class="dropdown btn-group">

                        <asp:DropDownList class="btn btn-primary dropdown-toggle" ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>Set Marks</asp:ListItem>
                            <asp:ListItem >Main</asp:ListItem>
                            <asp:ListItem>Set Weightages</asp:ListItem>
                            <asp:ListItem>Generate Marks</asp:ListItem>
                        </asp:DropDownList>

                     
                    </div>
                        
                    </div>
                </div>

                 <div class="row1">   
                      <div class="col-md-12 school-options-dropdown text-center">

                <asp:Label class = "label" ID="Label3" runat="server" Text="Semester" Font-Bold="True"></asp:Label>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList class = "dl" ID="DropDownList6" runat="server" DataSourceID="SqlDataSource4" DataTextField="SemesterName" DataValueField="SemesterName" AutoPostBack="True" style ="border:none">
                </asp:DropDownList>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   
                
                <asp:Label class = "label" ID="Label1" runat="server" Text="Course" Font-Bold="True"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList class = "dl" ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" Width="153px">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label2" runat="server" Text="Section" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList class = "dl" ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="secID" DataValueField="secID" style ="border:none">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label4" runat="server" Text="Assesment Type" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList class = "dl" ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="marktype" DataValueField="marktype">
                        <asp:ListItem>quiz</asp:ListItem>
                        <asp:ListItem>assignment</asp:ListItem>
                        <asp:ListItem>lab</asp:ListItem>
                        <asp:ListItem>project</asp:ListItem>
                        <asp:ListItem>sessional</asp:ListItem>
                        <asp:ListItem>Final</asp:ListItem>
                    </asp:DropDownList>
                    
                     &nbsp;&nbsp;
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getAssesments" SelectCommandType="StoredProcedure">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList6" Name="sem" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList4" Name="CID" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList5" Name="S" PropertyName="SelectedValue" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     </div>
                   </div>
                 <div class="row1">   
                      <div class="col-md-12 school-options-dropdown text-center">
                            <asp:Label class = "label" ID="Label5" runat="server" Text="Selected Record - Obtained Marks"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button class="button" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                                <asp:Button class="button" ID="Button3" runat="server" Text="Delete" style="float:right; margin-right:100px" OnClick="Button3_Click" />
                    </div>
                </div>
                <div class="row1">   
                      <div class="col-md-12 school-options-dropdown text-center">
                            <asp:RangeValidator id="RangeValidator1"
                                       ControlToValidate="TextBox1"
                                       MinimumValue="0"
                                       MaximumValue="0"
                                       Type="Integer"
                                       EnableClientScript="false"
                                       Text=""
                                       runat="server" style="color:red"/>
                    </div>
                </div>
                <div class ="row1">
                            <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>

                </div>
                <div class="row">
                      <%--<div class="col-md-12 school-options-gridview text-center">--%>

                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="rollNo" DataSourceID="SqlDataSource5" CssClass="auto-style1" Width="822px">
                         <Columns>
                             <asp:CommandField ShowSelectButton="True" />
                             <asp:BoundField DataField="rollNo" HeaderText="rollNo" ReadOnly="True" SortExpression="rollNo" />
                             <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                             <asp:BoundField DataField="ObtainedMarks" HeaderText="ObtainedMarks" SortExpression="ObtainedMarks" />
                             <asp:BoundField DataField="TotalMarks" HeaderText="TotalMarks" SortExpression="TotalMarks" />
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
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getMarksSheet" SelectCommandType="StoredProcedure">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="DropDownList6" Name="sem" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList4" Name="CID" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList5" Name="S" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="DropDownList7" Name="MT" PropertyName="SelectedValue" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
               
                    <%--</div>--%>
               </div>
            </form>
        </div>
    </div>
                
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getSection" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="FacultyID" SessionField="facultyID" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList4" Name="CourseID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList6" Name="Sem" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="SELECT SemesterName FROM semester"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getAlocCourse" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="FacultyID" SessionField="facultyID" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList6" Name="Sem" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="SELECT [SemesterName] FROM [semester]"></asp:SqlDataSource>
</body>
</html>

