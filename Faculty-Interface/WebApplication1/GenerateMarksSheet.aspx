<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateMarksSheet.aspx.cs" Inherits="WebApplication1.GenerateMarksSheet" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 30%;
            border: 2px solid #000000;
            background-color: #E2E6EA;
        }
        .auto-style2 {
            width: 171px;
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

              

                <div class="row">
                    <div class="col-md-12 school-options-dropdown text-center">
                    <div class="dropdown btn-group">

                        <asp:DropDownList class="btn btn-primary dropdown-toggle" ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>Generate Marks</asp:ListItem>
                            <asp:ListItem>Set Marks</asp:ListItem>
                            <asp:ListItem >Main</asp:ListItem>
                            <asp:ListItem>Set Weightages</asp:ListItem>
                        </asp:DropDownList>

                     
                    </div>
                        
                    </div>
                </div>
                 <div class="row1" style="height: auto">   
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button class ="button" ID="Button1" runat="server" Text="Generate marks Sheet" OnClick="Button1_Click" />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                     <asp:Label ID="Label11" runat="server"></asp:Label>
                     <br />
               
                </div>
                <div class ="row1">
                    <table cellpadding="2" class="auto-style1" style="float:none">
                         <tr>
                             <td>
                                 <asp:Label class = "label" ID="Label7" runat="server" Text="Semester" Font-Bold="True"></asp:Label>
                             </td>
                             <td class="auto-style2">
                                 <asp:DropDownList class = "dl" ID="DropDownList6" runat="server" DataSourceID="SqlDataSource4" DataTextField="SemesterName" DataValueField="SemesterName" AutoPostBack="True" style ="border:none">
                                 </asp:DropDownList>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Label class = "label" ID="Label1" runat="server" Text="Course" Font-Bold="True"></asp:Label>
                             </td>
                             <td class="auto-style2">
                                 <asp:DropDownList class = "dl" ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" Width="153px">
                                 </asp:DropDownList>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Label class = "label" ID="Label6" runat="server" Text="Section" Font-Bold="True"></asp:Label>
                             </td>
                             <td class="auto-style2">
                                 <asp:DropDownList class = "dl" ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="secID" DataValueField="secID" style ="border:none">
                                 </asp:DropDownList>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Label class = "label" ID="Label8" runat="server" Text="Assesment Type" Font-Bold="True"></asp:Label>
                             </td>
                             <td class="auto-style2">
                                 <asp:DropDownList CssClass ="dl" ID="DropDownList7" runat="server">
                                     <asp:ListItem>quiz</asp:ListItem>
                                     <asp:ListItem>assignment</asp:ListItem>
                                     <asp:ListItem>lab</asp:ListItem>
                                     <asp:ListItem>project</asp:ListItem>
                                     <asp:ListItem>sessional</asp:ListItem>
                                     <asp:ListItem>Final</asp:ListItem>
                                 </asp:DropDownList>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Label class = "label" ID="Label9" runat="server" Text="Number" Font-Bold="True" style="vertical-align:top;"></asp:Label>
                             </td>
                             <td class="auto-style2">
                                 <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                                 
                                
                             </td>
                             
                                 
                             
                         </tr>
                         
                         
                         <tr>
                             <td colspan="2">
                                
                             <asp:RangeValidator id="RangeValidator1"
                                       ControlToValidate="TextBox2"
                                       MinimumValue="1"
                                       MaximumValue="15"
                                       Type="Integer"
                                       EnableClientScript="false"
                                       Text="The value must be from 1 to 15!"
                                       runat="server" style="color:red"/>
                              </td>
                                 
                             
                         </tr>
                         
                         
                         <tr>
                             <td>
                                 <asp:Label class = "label" ID="Label10" runat="server" Text="Total Marks" Font-Bold="True"></asp:Label>
                             </td>
                             <td class="auto-style2">
                                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                 
                         </tr>
                        
                         
                         <tr>
                             <td colspan="2">
                                  <asp:RangeValidator id="RangeValidator2"
                                       ControlToValidate="TextBox3"
                                       MinimumValue="1"
                                       MaximumValue="300"
                                       Type="Integer"
                                       EnableClientScript="false"
                                       Text="The value must be from 1 to 300!"
                                       runat="server" style="color:red"/>
                             </td>
                         </tr>
                        
                     </table>
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

