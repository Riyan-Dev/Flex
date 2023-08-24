using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace flex
{
    public partial class studentDash : System.Web.UI.Page
    {
        protected string studentName;
        protected string rollNo;
        protected DateTime dateOfBirth;
        protected string email;
        protected string cnic;
        protected string phoneNumber;
        protected string address;
        protected string city;
        protected string country;
        protected string degree;
        protected string section;
        protected string rollNumber;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["rollNo"] != null)
                {
                    string connectionString = "Data Source=WRAITHEON\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True";
                    string rollNo = Session["rollNo"].ToString();

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT rollNo, FirstName, LastName, DateOfBirth, Email, CNIC, PhoneNumber, Address, City, Country, DegreeName, secID FROM Student inner join Degree on Student.DegreeID = Degree.DegreeID WHERE rollNo = @rollNo";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@rollNo", rollNo);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            rollNumber = rollNo;
                            studentName = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                            //System.Diagnostics.Debug.WriteLine(studentName);
                            dateOfBirth = Convert.ToDateTime(reader["DateOfBirth"]);
                            email = reader["Email"].ToString();
                            cnic = reader["CNIC"].ToString();
                            phoneNumber = reader["PhoneNumber"].ToString();
                            address = reader["Address"].ToString();
                            city = reader["City"].ToString();
                            country = reader["Country"].ToString();
                            degree = reader["DegreeName"].ToString();
                            section = reader["secID"].ToString();
                        }

                        reader.Close();
                    }
                }
            }
        }

        protected void btnAttendance_Click(object sender, EventArgs e)
        {
            Response.Redirect("Attendance.aspx");
        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Feedback.aspx");
        }

        protected void btnMarks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Marks.aspx");
        }

        protected void btnTranscript_Click(object sender, EventArgs e)
        {
            Response.Redirect("transcript.aspx");
        }

        protected void btnCourseRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("courseReg.aspx");
        }
    }
}