using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class CourseAdd : System.Web.UI.Page
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

                string query = "INSERT INTO Courses (CourseID, Cname, ccredhrs, prereq) VALUES (@CourseID, @Cname, @credhrs, @prereq)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CourseID", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Cname", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@credhrs", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@prereq", TextBox4.Text);
                    cmd.ExecuteNonQuery();
                }
            }
            Label3.Text="DATA ADDED";
        }
    }
}