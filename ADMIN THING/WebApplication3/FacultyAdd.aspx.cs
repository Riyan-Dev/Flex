using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class FacultyAdd : System.Web.UI.Page
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

                string query = "INSERT INTO Faculty (FacultyID, FirstName, LastName, Email, PhoneNumber, CNIC, DOB, JoiningDate, Password) VALUES (@FacultyID, @FirstName, @LastName, @Email, @PhoneNumber, @CNIC, @DOB, @JoiningDate, @Password)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@FacultyID", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@FirstName", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@LastName", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@CNIC", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@DOB", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@JoiningDate", TextBox8.Text);
                    cmd.Parameters.AddWithValue("@Password", TextBox9.Text);

                    cmd.ExecuteNonQuery();
               
                }
                Label3.Text = "DATA IS ADDED";
            }
        }
    }
}