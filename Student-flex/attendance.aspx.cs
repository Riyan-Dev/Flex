using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace flex
{
    public partial class attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        

        protected void btn_DashboardClick(object sender, EventArgs e)
        {
            Response.Redirect("studentDash.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the rollNo value from the session
            string rollNo = Session["rollNo"].ToString();

            // Get the selected values from the dropdowns
            string semester = DropDownList2.SelectedValue.ToString();
            string course = DropDownList3.SelectedValue.ToString();

            // Set up the connection string
            string connectionString = "Data Source=WRAITHEON\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True";

            // Create a SqlConnection and SqlCommand objects
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            connection.Open();
            command.CommandText = "getAttendancePercentage";
            command.Connection = connection;
            // Set the command type to stored procedure
            command.CommandType = CommandType.StoredProcedure;

            // Add parameters to the command
            command.Parameters.AddWithValue("@RN", rollNo);
            command.Parameters.AddWithValue("@Sem", semester);
            command.Parameters.AddWithValue("@course", course);
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            Session["percentage"] = reader["percentage"].ToString();
            if (Session["percentage"].ToString() == null)
            {
                double percentage = 0.0;
                Label1.Text = "Percentage: " + percentage.ToString();
            }
            else
            {
                double percentage = Convert.ToDouble(reader["percentage"].ToString());
                Label1.Text = "Percentage: " + percentage.ToString();
            }


            // Close the connection
            connection.Close();
        }
    }
}