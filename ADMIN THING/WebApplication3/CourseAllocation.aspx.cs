using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class CourseAllocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void D_Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "INSERT INTO CourseAlloc (FacultyID, secID, CourseID, Semester) VALUES (@FacultyID, @secID, @CourseID, @Semester)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@FacultyID", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@secID", DropDownList2.SelectedValue);
                    cmd.Parameters.AddWithValue("@CourseID", DropDownList3.SelectedValue);
                    cmd.Parameters.AddWithValue("@Semester", DropDownList4.SelectedValue);
                    cmd.ExecuteNonQuery();
                }
            }
            Label3.Text = "DATA ADDED";
        }
    }
}