﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllLogin.aspx.cs" Inherits="WebApplication1.AllLogin" %>

<!DOCTYPE html>
<script runat="server">



</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css" media="screen">
        #form1 {
            height: 703px;
            width: 1454px;
        }
        body{
            margin:0;
        }
        
    </style>
</head>
<body aria-checked="true" aria-expanded="false">
    <form id="form1" runat="server">
   
   <div style="height: 100px; background-color: #17ADEE; width: 1616px;">
       <asp:Image ID="Image3" runat="server" Height="598px" ImageUrl="~/Bg.jpg" style="margin-left: 780px; margin-top: 102px;" Width="839px" />
        </div>
   
        <div>
            <asp:Image ID="Image1" runat="server" Height="224px" ImageUrl="~/Screenshot 2023-05-07 102213.png" style="margin-left: 206px; margin-top: 53px" Width="460px" />
        </div>
        <div>
            <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" style="margin-left: 307px; margin-top: 0px;" Text="Flex Academic Portal" Width="408px" Font-Size="XX-Large" Height="33px" BorderStyle="None"></asp:Label>
            </p>
        </div>
      <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="Label2" runat="server" Font-Names="Bahnschrift Light" Font-Size="Medium" Text="Username: "></asp:Label>
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="userIDtxt" runat="server" EnableTheming="False" Font-Names="Bahnschrift Light" style="margin-left: 117px; margin-top: 11px" Width="200px" Wrap="False"></asp:TextBox>
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="Label3" runat="server" Font-Names="Bahnschrift Light" Font-Size="Medium" Text="Password"></asp:Label>
          :<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox runat="server" ID="passwordTxt"  Font-Names="Bahnschrift Light" style="margin-left: 95px" Width="200px" TextMode="Password"></asp:TextBox>
          <p style="width: 235px; margin-left: 375px; margin-top: 30px">
&nbsp;&nbsp;
              <asp:Button ID="Button1" runat="server" BackColor="#01247D" BorderColor="#3399FF" BorderStyle="None" BorderWidth="7px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Large" ForeColor="White" Height="40px" Text="Log In" Width="136px" OnClick="Button1_Click" />
          </p>
        </div
    </form>
</body>
</html>
