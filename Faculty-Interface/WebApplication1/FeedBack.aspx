<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="WebApplication1.FeedBack" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 1022px;
        }
        .auto-style2 {
            width: 176px;
        }
        .auto-style3 {
            width: 1022px;
            height: 26px;
        }
        .auto-style4 {
            width: 176px;
            height: 26px;
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
                      <asp:Label class = "label" ID="Label21" runat="server" Text="Semester" Font-Bold="True"></asp:Label>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList class = "dl" ID="DropDownList6" runat="server" DataSourceID="SqlDataSource4" DataTextField="SemesterName" DataValueField="SemesterName" AutoPostBack="True" style ="border:none">
                      </asp:DropDownList>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label class = "label" ID="Label22" runat="server" Text="Course" Font-Bold="True"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp; 
                      <asp:DropDownList class = "dl" ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" Width="153px">
                      </asp:DropDownList>
                      </div>
                <div class="row">
                    <table class="w-100" style="border-color: #3399FF; background-color: #CCFFFF; text-align: justify; vertical-align: middle; word-spacing: 1em; letter-spacing: 0.2em; font-family: 'Bahnschrift SemiBold'; border-bottom-style: double;">
                        <tr>
                            <td class="auto-style1" style="border-color: #3399FF; text-align: center; background-color: #C0C0C0; border-bottom-style: double;">Concern </td>
                            <td class="auto-style2" style="border-color: #3399FF; text-align: center; background-color: #C0C0C0; border-bottom-style: double;">Rating </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher attends class in a well presentable manner</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows enthusiasm when teaching in class</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows initiative and flexibility in teaching</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher is well articulated and shows full knowledge of the subject in teaching</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher speaks loud and clear enough to be heard by the whole class</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows professionalism in class</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows commitment to teaching the class</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher encourages students to engage in class discussions and ask questions</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher handles criticisms and suggestions professionally</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher comes to class on time</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher ends class on time</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows well rounded knowledge over the subject matter</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher has organized the lesson conducive for easy understanding of students</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows dynamism and enthusiasm</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher stimulates the critical thinking of students</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher handles the class environment conducive for learning</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher believes that students can learn from the class</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher shows equal respect to various cultural backgrounds, individuals, religion, and race</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher finds the students strengths as basis for growth and weaknesses for opportunities for&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; improvement</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; border-right-style: solid; border-right-width: 1px;">Teacher understands the weakness of a student and helps in the student&#39;s improvement</td>
                            <td class="auto-style4" style="background-color: #FFFFFF; border-bottom-style: double; border-color: #3399FF; text-align: center;">
                                <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>

                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="SELECT [SemesterName] FROM [semester]"></asp:SqlDataSource>

                 
                
                
                

                 
                
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBProjConnectionString %>" SelectCommand="getAlocCourse" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="FacultyID" SessionField="facultyID" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList6" Name="Sem" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>    
                
                
                </body>
</html>
