using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace flex
{
    public partial class courseReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void D_Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/studentDash.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=WRAITHEON\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Fetch the count of courses already registered by the student
                string countCoursesQuery = "SELECT COUNT(*) FROM CourseReg WHERE rollNo = @rollNo";

                using (SqlCommand cmd = new SqlCommand(countCoursesQuery, con))
                {
                    cmd.Parameters.AddWithValue("@rollNo", DropDownList1.SelectedValue);

                    int courseCount = (int)cmd.ExecuteScalar();

                    // Check if the student has registered for less than 6 courses
                    if (courseCount < 6)
                    {
                        // Check if section count is less than 50
                        string countSectionQuery = "SELECT COUNT(*) FROM CourseReg WHERE secID = @secID";
                        using (SqlCommand countSectionCmd = new SqlCommand(countSectionQuery, con))
                        {
                            countSectionCmd.Parameters.AddWithValue("@secID", DropDownList3.SelectedValue);

                            int sectionCount = (int)countSectionCmd.ExecuteScalar();

                            if (sectionCount < 50)
                            {
                                string insertQuery = "INSERT INTO CourseReg (rollNo, CID, secID, Semester) VALUES (@rollNo, @CID, @secID, @Semester)";

                                using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                                {
                                    insertCmd.Parameters.AddWithValue("@rollNo", DropDownList1.SelectedValue);
                                    insertCmd.Parameters.AddWithValue("@CID", DropDownList2.SelectedValue);
                                    insertCmd.Parameters.AddWithValue("@secID", DropDownList3.SelectedValue);
                                    insertCmd.Parameters.AddWithValue("@Semester", DropDownList4.SelectedValue);


                                    // Check if section count is now at least 10
                                    sectionCount = (int)countSectionCmd.ExecuteScalar();

                                    if (sectionCount < 10)
                                    {
                                        Label3.ForeColor = System.Drawing.Color.Red;
                                        Label3.Text = "Registration Failed: Section has less than 10 students";
                                    }
                                    else
                                    {
                                        Label3.ForeColor = System.Drawing.Color.CornflowerBlue;
                                        Label3.Text = "DATA ADDED";
                                        insertCmd.ExecuteNonQuery();
                                    }
                                }
                            }
                            else
                            {
                                Label3.ForeColor = System.Drawing.Color.Red;
                                Label3.Text = "Registration Failed: Section has already 50 students";

                            }
                        }
                    }
                    else
                    {
                        Label3.ForeColor = System.Drawing.Color.Red;
                        Label3.Text = "Registration Failed: Student has already registered for maximum 6 courses";
                    }
                }
            }
        }
    }
}