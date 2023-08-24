<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="WebApplication1.Report" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            border-style: double;
            border-color: inherit;
            border-width: medium;
            color: cornflowerblue;
            font-family: Bahnschrift; /* custom text used */;
            text-decoration: none; /* to remove underlines etc */;
            font-size: 20px;
            text-shadow: 1px 1px #000000;
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

                            <asp:Button CssClass="auto-style1" ID="Button1" runat="server" Text="Grade Count" Width="150px" OnClick="Button1_Click" />
                            <asp:Button CssClass="auto-style1" ID="Button2" runat="server" Text="Attendance " Width="150px" OnClick="Button2_Click" />
                            <asp:Button CssClass="auto-style1" ID="Button3" runat="server" Text="Evaluation" Width="150px" OnClick="Button3_Click" />
                            <asp:Button CssClass="auto-style1" ID="Button4" runat="server" Text="Grade" Width="150px" OnClick="Button4_Click" />

                        </div>
                      </div>
                      
                    
                      
                    </div>
            </form>
        </div>
    </div>

                 
                
                
                </body>
</html>

