using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace flex
{
    public partial class marks : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the rollNo value from the session
            string rollNo = Session["rollNo"].ToString();

            // Get the selected values from the dropdowns
            string semester = DropDownList1.SelectedValue.ToString();
            string course = DropDownList2.SelectedValue.ToString();

            // Set up the connection string
            string connectionString = "Data Source=WRAITHEON\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            // Execute the first stored procedure
            string totalAbs = GetTotalAbs(connection, rollNo, semester, course);

            // Assign the first value to Label1
            Label1.Text = "Total Absolutes: " + totalAbs.ToString();

            // Execute the second stored procedure
            string totalObtainedAbs = GetTotalObtainedAbs(connection, rollNo, semester, course);

            // Assign the second value to Label2
            Label2.Text = "Total Obtained Absolutes: " + totalObtainedAbs.ToString();
        }

        private string GetTotalAbs(SqlConnection connection, string rollNo, string semester, string course)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "getTotalAbs";
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@RN", rollNo);
            command.Parameters.AddWithValue("@Sem", semester);
            command.Parameters.AddWithValue("@course", course);
            SqlDataReader reader = command.ExecuteReader();

            string totalAbs;
            reader.Read();
            totalAbs = reader["totalAbs"].ToString();

            reader.Close();
            return totalAbs;
        }

        private string GetTotalObtainedAbs(SqlConnection connection, string rollNo, string semester, string course)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "getTotalObtainedAbs";
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@RN", rollNo);
            command.Parameters.AddWithValue("@Sem", semester);
            command.Parameters.AddWithValue("@course", course);
            SqlDataReader reader = command.ExecuteReader();

            string totalObtainedAbs;
            reader.Read();
            totalObtainedAbs = reader["totalObtainedAbs"].ToString();

            reader.Close();
            return totalObtainedAbs;
        }

    }
}