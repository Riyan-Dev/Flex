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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string rollNo = Session["rollNo"].ToString();
                string courseID = DropDownList1.SelectedValue as string;
                string semester = DropDownList2.SelectedValue as string;
                int q1 = Convert.ToInt32(Request.Form["q1"]);
                int q2 = Convert.ToInt32(Request.Form["q2"]);
                int q3 = Convert.ToInt32(Request.Form["q3"]);
                int q4 = Convert.ToInt32(Request.Form["q4"]);
                int q5 = Convert.ToInt32(Request.Form["q5"]);
                int q6 = Convert.ToInt32(Request.Form["q6"]);
                int q7 = Convert.ToInt32(Request.Form["q7"]);
                int q8 = Convert.ToInt32(Request.Form["q8"]);
                int q9 = Convert.ToInt32(Request.Form["q9"]);
                int q10 = Convert.ToInt32(Request.Form["q10"]);
                int q11 = Convert.ToInt32(Request.Form["q11"]);
                int q12 = Convert.ToInt32(Request.Form["q12"]);
                int q13 = Convert.ToInt32(Request.Form["q13"]);
                int q14 = Convert.ToInt32(Request.Form["q14"]);
                int q15 = Convert.ToInt32(Request.Form["q15"]);
                int q16 = Convert.ToInt32(Request.Form["q16"]);
                int q17 = Convert.ToInt32(Request.Form["q17"]);
                int q18 = Convert.ToInt32(Request.Form["q18"]);
                int q19 = Convert.ToInt32(Request.Form["q19"]);
                int q20 = Convert.ToInt32(Request.Form["q20"]);

                string connectionString = "Data Source=WRAITHEON\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO feedback (rollNo, CourseID, Semester, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20) " +
                        "VALUES (@rollNo, @courseID, @semester, @q1, @q2, @q3, @q4, @q5, @q6, @q7, @q8, @q9, @q10, @q11, @q12, @q13, @q14, @q15, @q16, @q17, @q18, @q19, @q20)";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@rollNo", rollNo);
                    command.Parameters.AddWithValue("@courseID", courseID);
                    command.Parameters.AddWithValue("@semester", semester);
                    command.Parameters.AddWithValue("@q1", q1);
                    command.Parameters.AddWithValue("@q2", q2);
                    command.Parameters.AddWithValue("@q3", q3);
                    command.Parameters.AddWithValue("@q4", q4);
                    command.Parameters.AddWithValue("@q5", q5);
                    command.Parameters.AddWithValue("@q6", q6);
                    command.Parameters.AddWithValue("@q7", q7);
                    command.Parameters.AddWithValue("@q8", q8);
                    command.Parameters.AddWithValue("@q9", q9);
                    command.Parameters.AddWithValue("@q10", q10);
                    command.Parameters.AddWithValue("@q11", q11);
                    command.Parameters.AddWithValue("@q12", q12);
                    command.Parameters.AddWithValue("@q13", q13);
                    command.Parameters.AddWithValue("@q14", q14);
                    command.Parameters.AddWithValue("@q15", q15);
                    command.Parameters.AddWithValue("@q16", q16);
                    command.Parameters.AddWithValue("@q17", q17);
                    command.Parameters.AddWithValue("@q18", q18);
                    command.Parameters.AddWithValue("@q19", q19);
                    command.Parameters.AddWithValue("@q20", q20);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // Redirect to a thank you page or display a success message
                Response.Redirect("studentDash.aspx");
            }
        }
    }
}