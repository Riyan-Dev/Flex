<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setWeightages.aspx.cs" Inherits="WebApplication1.setWeightages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 373px;
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
                <div class="row">
                      <div class="col-md-12 school-options-dropdown text-center">
                        <div class="dropdown btn-group">

                            <asp:DropDownList ID="DropDownList1" runat="server" class="btn btn-primary dropdown-toggle"   OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>Set Weightages</asp:ListItem>
                                <asp:ListItem >Main</asp:ListItem>
                                <asp:ListItem>Set Marks</asp:ListItem>
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
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label class = "label" ID="Label1" runat="server" Text="Course" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList class = "dl" ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" Width="153px">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label class = "label" ID="Label2" runat="server" Text="Section" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList class = "dl" ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="secID" DataValueField="secID" style ="border:none">
                </asp:DropDownList>
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
                            <asp:Label class = "label" ID="Label5" runat="server" Text="Selected Record - Weightage"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button class="button" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                    </div>
                </div>
                <div class="row1">
                     <asp:RangeValidator id="RangeValidator1"
                                       ControlToValidate="TextBox1"
                                       MinimumValue="0"
                                       MaximumValue="100"
                                       Type="Integer"
                                       EnableClientScript="false"
                                       Text="Weigthages must be between 0-100"
                                       runat="server" style="color:red"/>
                </div>
                <div class="row1">
                            <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>

                </div>
                <div class="row">   
   
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" DataSourceID="SqlDataSource5" Width="540px" >
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="marktype" HeaderText="marktype" SortExpression="marktype" />
                            <asp:BoundField DataField="Weightage" HeaderText="Weightage" SortExpression="Weightage" />
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
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getAssesments" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList6" Name="sem" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList4" Name="CID" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList5" Name="S" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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

