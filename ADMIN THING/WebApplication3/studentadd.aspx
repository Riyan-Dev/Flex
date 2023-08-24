<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentadd.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 809px;
        }
        .auto-style1 {
            width: 27%;
            height: 468px;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .auto-style2 {
            width: 233px;
        }
        .auto-style4 {
            width: 334px;
        }
        .auto-style5 {
            width: 233px;
            height: 29px;
        }
        .auto-style6 {
            width: 334px;
            height: 29px;
        }
        .auto-style8 {
            height: 232px;
        }
    </style>
</head>
<body style="height: 825px">
    <form id="form1" runat="server" class="auto-style8">
          <div style="font-family: Bahnschrift; font-size: xx-large; text-transform: uppercase; font-weight: bold; position: relative; top: -4px; left: 4px; height: 75px; width: 1508px;" accesskey="C">
            &nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" Height="65px" ImageUrl="~/NU-logo.jpg" Width="212px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" Text="flex"></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="D_Button1" runat="server" BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Names="Bahnschrift Light" Font-Size="Small" ForeColor="#0066FF" Height="28px" PostBackUrl="~/AdminDashboard.aspx" Text="Dashboard" Width="119px" OnClick="D_Button1_Click" />
              <br />
              <br />
              <br />
           </div>
          <br />
          <br />
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#3399FF" Text="Add a Student"></asp:Label>
          <asp:Button ID="Button1" runat="server" Text="ADD" style="position:relative; top: 235px; left: 2px; height: 56px; width: 138px;" BorderStyle="None" Font-Bold="True" Font-Names="Bahnschrift Light" Font-Size="Medium" ForeColor="#0066FF" OnClick="Button1_Click1"/>
          <table class="auto-style1" draggable="true" style="font-family: 'Bahnschrift Light'; font-size: medium; font-weight: bolder; position: relative; z-index: auto; top: 23px; left: 352px;">
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #FFFFFF;">&nbsp;</td>
                  <td class="auto-style4" draggable="true">&nbsp;</td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">ROLLNO</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">First name</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Last name</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">DOB</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 1px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Email</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox5" runat="server" style="margin-left: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">CNIC</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox6" runat="server" style="margin-left: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Phone no</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox7" runat="server" style="margin-left: 0px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Address</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox8" runat="server" style="margin-left: 0px" Width="158px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style5" style="color: #FFFFFF; background-color: #0066FF;">City</td>
                  <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Country</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Password</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style5" style="color: #FFFFFF; background-color: #0066FF;">Degree</td>
                  <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td aria-checked="mixed" class="auto-style2" style="color: #FFFFFF; background-color: #0066FF;">Section</td>
                  <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                  </td>
              </tr>
          </table>
&nbsp;&nbsp;
    </form>
</body>
</html>
