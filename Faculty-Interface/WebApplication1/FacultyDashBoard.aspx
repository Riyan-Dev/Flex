<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyDashBoard.aspx.cs" Inherits="WebApplication1.FacultyDashBoard" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Helper/css/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 78px;
            height: 62px;
            margin-top: 1px;
            margin-bottom: 0px;
        }
    </style>
</head>
<body style="background-color: silver; width: 100%; height: 100%; background-attachment: fixed; background-position: top; background-repeat: no-repeat; background-size: cover;">
    <div id="background">
        <div class ="navbar">
            <div>
                <img alt="" class="auto-style1" src="flex-logo-blue%20(1).png" />

            </div>
            <div>
		        <nav>
            

			        <ul id="HomePageItems"> <!-- navigation bar item divison -->
				        <li> <a> <asp:Label runat="server" ID = "txtFName">  </asp:Label> </a></li> <!-- linking to home page -->
				       
                     
					
			        </ul>
		        </nav>
            </div>
        </div>
        <div>
            <form id="form1" runat="server">
                 <div>
                     <h1 class="text2"> Faculty DashBoard</h1>
                 </div>
       
                <div class = "row">
                         <div class ="column">
                         <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" style="margin-left: 0px; margin-top: 20px" Width="100px" ImageUrl="~/pngwing.com.png" OnClick="ImageButton1_Click" /> <!-- grades,  reports, course allocation, marks, attendaance, set Distributions, -->
                              <p class ="text1"> Assignments </p>
                         </div>
                    <div class ="column">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="100px" style="margin-left: 0px; margin-top: 20px;" Width="100px" ImageUrl="~/attendance.png" OnClick="ImageButton2_Click" />
                         <p class ="text1">  Attendance </p>
                    </div>
                     <div class ="column">
                         <asp:ImageButton ID="ImageButton3" runat="server" Height="100px" style="margin-left: 0px; margin-top: 20px;" Width="100px" ImageUrl="~/Distribution.png" OnClick="ImageButton3_Click" />
                          <p class ="text1"> Reports</p>
                     </div>
                     <div class ="column">
                         <asp:ImageButton ID="ImageButton7" runat="server" Height="100px" style="margin-top: 20px;" Width="100px" ImageUrl="~/Grades.png" OnClick="ImageButton4_Click" />
                         <p class ="text1"> Grades genration </p>
                    </div>
                    <div class ="column">
                        <asp:ImageButton ID="ImageButton8" runat="server" Height="100px" style=" margin-top: 20px;" Width="100px" ImageUrl="~/report.png" OnClick="ImageButton8_Click" />
                       <p class ="text1">  FeedBack</p>
                        <p class ="text1">  &nbsp;</p>
                         </div>
                    <div class ="column">
                         <asp:ImageButton ID="ImageButton9" runat="server" Height="100px" style="margin-top: 20px;" Width="100px" ImageUrl="~/CourseAllocation.png" OnClick="ImageButton6_Click" />
                          <p class ="text1"> Courses Allocation </p>
                    </div>
                
               </div>
       

            </form>
        </div>
       
     </div>
   
</body>
</html>
