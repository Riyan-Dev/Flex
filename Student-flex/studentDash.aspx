<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentDash.aspx.cs" Inherits="flex.studentDash" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 20px;
            margin: 0;
            background-color: cornflowerblue; /* Set the background color to cornflowerblue */
            color: white; /* Set the text color to white */
        }

        .container {
            display: flex;
            margin-top: 20px; /* Add some margin to create spacing below the header */
        }

        .sidebar {
            width: 200px;
            background-color: cornflowerblue;
            padding: 20px;
            height: 100vh;
            position: fixed;
        }

        .content {
            margin-left: 400px;
            padding: 20px;
            background-color: white;
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
            font-size: 18px; /* Increase the font size */
            color: white;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: white; /* Change the background color to white on hover */
            color: cornflowerblue; /* Change the text color to cornflowerblue on hover */
        }

        

        .content p {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <h1>Student Dashboard</h1>

    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="Attendance.aspx">Attendance</a></li>
                <li><a href="Marks.aspx">Marks</a></li>
                <li><a href="courseReg.aspx">Course Registration</a></li>
                <li><a href="transcript.aspx">Transcript</a></li>
                <li><a href="Feedback.aspx">Feedback</a></li>
            </ul>
        </div>

        <div class="content">
            <h2>Welcome, <% Response.Write(studentName); %></h2>

            <p><strong>Roll No:</strong> <% Response.Write(rollNumber); %></p>
            <p><strong>Date of Birth:</strong> <% Response.Write(dateOfBirth); %></p>
            <p><strong>Email:</strong> <% Response.Write(email); %></p>
            <p><strong>CNIC:</strong> <% Response.Write(cnic); %></p>
            <p><strong>Phone Number:</strong> <% Response.Write(phoneNumber); %></p>
            <p><strong>Address:</strong> <% Response.Write(address); %></p>
            <p><strong>City:</strong> <% Response.Write(city); %></p>
            <p><strong>Country:</strong> <% Response.Write(country); %></p>
            <p><strong>Degree:</strong> <% Response.Write(degree); %></p>
            <p><strong>Section:</strong> <% Response.Write(section); %></p>
        </div>
    </div>
</body>
</html>