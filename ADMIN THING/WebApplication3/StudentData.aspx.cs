using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class StudentData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void D_Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string dropdownSelection = SearchFeildDropDown.SelectedValue;

            if (dropdownSelection == "Section")
            {
                SqlDataSource1.SelectCommand = "SELECT rollno, firstname, lastname, secID FROM student";
            }
            else if (dropdownSelection == "Course")
            {
                SqlDataSource1.SelectCommand = "SELECT Student.rollNo, Student.FirstName, Student.LastName, CourseReg.CID, Courses.CName, CourseReg.Semester, CourseReg.secID FROM Student INNER JOIN CourseReg ON Student.rollNo = CourseReg.rollNo INNER JOIN Courses ON Courses.CourseID = CourseReg.CID";
                SqlDataSource1.UpdateCommand = "UPDATE CourseReg SET CID = @CID, CName = @CName, Semester = @Semester, secID = @secID WHERE rollNo = @rollNo";

            }

            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            // Rebind the GridView to show the editing interface in the row being edited
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the new values from the GridView row
            string newCID = (string)e.NewValues["CID"];
            string newCName = (string)e.NewValues["CName"];
            string newSemester = (string)e.NewValues["Semester"];
            string newSecID = (string)e.NewValues["secID"];
            string rollNo = (string)e.Keys["rollNo"];

            // Set the parameters for the UpdateCommand
            SqlDataSource1.UpdateParameters["CID"].DefaultValue = newCID;
            SqlDataSource1.UpdateParameters["CName"].DefaultValue = newCName;
            SqlDataSource1.UpdateParameters["Semester"].DefaultValue = newSemester;
            SqlDataSource1.UpdateParameters["secID"].DefaultValue = newSecID;
            SqlDataSource1.UpdateParameters["rollNo"].DefaultValue = rollNo;

            // Perform the update
            SqlDataSource1.Update();

            // Switch the GridView out of editing mode
            GridView1.EditIndex = -1;

            // Rebind the GridView to reflect the changes
            GridView1.DataBind();
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}