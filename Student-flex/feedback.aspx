<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="flex.WebForm2" %>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: cornflowerblue;
        }

        h1 {
            text-align: center;
            color: white;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: black;
        }

        .form-group input[type="radio"] {
            margin-right: 10px;
        }

        .form-group input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Feedback Form</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <label>Semester:
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SemesterName" DataValueField="SemesterName">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" ProviderName="<%$ ConnectionStrings:flexConnectionString.ProviderName %>" SelectCommand="SELECT [SemesterName] FROM [semester]"></asp:SqlDataSource>
            <br />
            Course:&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CName" DataValueField="CourseID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flexConnectionString %>" SelectCommand="getRegisteredCourses" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="21I-5550" Name="RN" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Sem" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br>Please fill out the form in evaluating your instructor for the semester. After completion, please press the submit button.</label>
            <label>For Reference, The metrics are as follows:</label>
        </div>
        <div>
            <label>1 - Poor<br>2 - Below Average<br>3 - Average<br>4 - Good<br>5 - Excellent<br><br></label>
        </div>
        <div class="form-group">
            <label for="q1">Teacher attends class in a well-presentable manner:</label>
            <label><input type="radio" name="q1" value="1" required> 1</label>
            <label><input type="radio" name="q1" value="2"> 2</label>
            <label><input type="radio" name="q1" value="3"> 3</label>
            <label><input type="radio" name="q1" value="4"> 4</label>
            <label><input type="radio" name="q1" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q2">Teacher shows enthusiasm when teaching in class:</label>
            <label><input type="radio" name="q2" value="1" required> 1</label>
            <label><input type="radio" name="q2" value="2"> 2</label>
            <label><input type="radio" name="q2" value="3"> 3</label>
            <label><input type="radio" name="q2" value="4"> 4</label>
            <label><input type="radio" name="q2" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q3">Teacher shows initiative and flexibility in teaching:</label>
            <label><input type="radio" name="q3" value="1" required> 1</label>
            <label><input type="radio" name="q3" value="2"> 2</label>
            <label><input type="radio" name="q3" value="3"> 3</label>
            <label><input type="radio" name="q3" value="4"> 4</label>
            <label><input type="radio" name="q3" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q4">Teacher is well articulated and shows full knowledge of the subject in teaching:</label>
            <label><input type="radio" name="q4" value="1" required> 1</label>
            <label><input type="radio" name="q4" value="2"> 2</label>
            <label><input type="radio" name="q4" value="3"> 3</label>
            <label><input type="radio" name="q4" value="4"> 4</label>
            <label><input type="radio" name="q4" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q5">Teacher speaks loud and clear enough to be heard by the whole class:</label>
            <label><input type="radio" name="q5" value="1" required> 1</label>
            <label><input type="radio" name="q5" value="2"> 2</label>
            <label><input type="radio" name="q5" value="3"> 3</label>
            <label><input type="radio" name="q5" value="4"> 4</label>
            <label><input type="radio" name="q5" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q6">Teacher shows professionalism in class:</label>
            <label><input type="radio" name="q6" value="1" required> 1</label>
            <label><input type="radio" name="q6" value="2"> 2</label>
            <label><input type="radio" name="q6" value="3"> 3</label>
            <label><input type="radio" name="q6" value="4"> 4</label>
            <label><input type="radio" name="q6" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q7">Teacher shows commitment to teaching the class:</label>
            <label><input type="radio" name="q7" value="1" required> 1</label>
            <label><input type="radio" name="q7" value="2"> 2</label>
            <label><input type="radio" name="q7" value="3"> 3</label>
            <label><input type="radio" name="q7" value="4"> 4</label>
            <label><input type="radio" name="q7" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q8">Teacher encourages students to engage in class discussions and ask questions:</label>
            <label><input type="radio" name="q8" value="1" required> 1</label>
            <label><input type="radio" name="q8" value="2"> 2</label>
            <label><input type="radio" name="q8" value="3"> 3</label>
            <label><input type="radio" name="q8" value="4"> 4</label>
            <label><input type="radio" name="q8" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q9">Teacher handles criticisms and suggestions professionally:</label>
            <label><input type="radio" name="q9" value="1" required> 1</label>
            <label><input type="radio" name="q9" value="2"> 2</label>
            <label><input type="radio" name="q9" value="3"> 3</label>
            <label><input type="radio" name="q9" value="4"> 4</label>
            <label><input type="radio" name="q9" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q10">Teacher comes to class on time:</label>
            <label><input type="radio" name="q10" value="1" required> 1</label>
            <label><input type="radio" name="q10" value="2"> 2</label>
            <label><input type="radio" name="q10" value="3"> 3</label>
            <label><input type="radio" name="q10" value="4"> 4</label>
            <label><input type="radio" name="q10" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q11">Teacher ends class on time:</label>
            <label><input type="radio" name="q11" value="1" required> 1</label>
            <label><input type="radio" name="q11" value="2"> 2</label>
            <label><input type="radio" name="q11" value="3"> 3</label>
            <label><input type="radio" name="q11" value="4"> 4</label>
            <label><input type="radio" name="q11" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q12">Teacher shows well rounded knowledge over the subject matter:</label>
            <label><input type="radio" name="q12" value="1" required> 1</label>
            <label><input type="radio" name="q12" value="2"> 2</label>
            <label><input type="radio" name="q12" value="3"> 3</label>
            <label><input type="radio" name="q12" value="4"> 4</label>
            <label><input type="radio" name="q12" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q13">Teacher has organized the lesson conducive for easy understanding of students:</label>
            <label><input type="radio" name="q13" value="1" required> 1</label>
            <label><input type="radio" name="q13" value="2"> 2</label>
            <label><input type="radio" name="q13" value="3"> 3</label>
            <label><input type="radio" name="q13" value="4"> 4</label>
            <label><input type="radio" name="q13" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q14">Teacher shows dynamism and enthusiasm:</label>
            <label><input type="radio" name="q14" value="1" required> 1</label>
            <label><input type="radio" name="q14" value="2"> 2</label>
            <label><input type="radio" name="q14" value="3"> 3</label>
            <label><input type="radio" name="q14" value="4"> 4</label>
            <label><input type="radio" name="q14" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q15">Teacher stimulates the critical thinking of students:</label>
            <label><input type="radio" name="q15" value="1" required> 1</label>
            <label><input type="radio" name="q15" value="2"> 2</label>
            <label><input type="radio" name="q15" value="3"> 3</label>
            <label><input type="radio" name="q15" value="4"> 4</label>
            <label><input type="radio" name="q15" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q16">Teacher handles the class environment conducive for learning:</label>
            <label><input type="radio" name="q16" value="1" required> 1</label>
            <label><input type="radio" name="q16" value="2"> 2</label>
            <label><input type="radio" name="q16" value="3"> 3</label>
            <label><input type="radio" name="q16" value="4"> 4</label>
            <label><input type="radio" name="q16" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q17">Teacher believes that students can learn from the class:</label>
            <label><input type="radio" name="q17" value="1" required> 1</label>
            <label><input type="radio" name="q17" value="2"> 2</label>
            <label><input type="radio" name="q17" value="3"> 3</label>
            <label><input type="radio" name="q17" value="4"> 4</label>
            <label><input type="radio" name="q17" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q18">Teacher shows equal respect to various cultural backgrounds, individuals, religion, and race:</label>
            <label><input type="radio" name="q18" value="1" required> 1</label>
            <label><input type="radio" name="q18" value="2"> 2</label>
            <label><input type="radio" name="q18" value="3"> 3</label>
            <label><input type="radio" name="q18" value="4"> 4</label>
            <label><input type="radio" name="q18" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q10">Teacher finds the students strengths as basis for growth and weaknesses for opportunities for improvement:</label>
            <label><input type="radio" name="q19" value="1" required> 1</label>
            <label><input type="radio" name="q19" value="2"> 2</label>
            <label><input type="radio" name="q19" value="3"> 3</label>
            <label><input type="radio" name="q19" value="4"> 4</label>
            <label><input type="radio" name="q19" value="5"> 5</label>
        </div>
        <div class="form-group">
            <label for="q20">Teacher understands the weakness of a student and helps in the student's improvement:</label>
            <label><input type="radio" name="q20" value="1" required> 1</label>
            <label><input type="radio" name="q20" value="2"> 2</label>
            <label><input type="radio" name="q20" value="3"> 3</label>
            <label><input type="radio" name="q20" value="4"> 4</label>
            <label><input type="radio" name="q20" value="5"> 5</label>
        </div>
        <div class="form-group" id="submit" title="Submit Feedback">
            &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Feedback" />
        </div>
    </form>
</body>
</html>