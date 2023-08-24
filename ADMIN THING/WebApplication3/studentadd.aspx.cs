using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void D_Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "INSERT INTO Student (ROLLNO, FirstName, LastName, DateOfBirth, Email, CNIC, PhoneNumber, Address, City, Country, Password, DegreeID, SecID) VALUES (@ROLLNO, @FirstName, @LastName, @DOB, @Email, @CNIC, @PhoneNo, @Address, @City, @Country, @Password, @Degree, @Section)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ROLLNO", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@FirstName", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@LastName", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@DOB", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@CNIC", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@PhoneNo", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@Address", TextBox8.Text);
                    cmd.Parameters.AddWithValue("@City", TextBox9.Text);
                    cmd.Parameters.AddWithValue("@Country", TextBox10.Text);
                    cmd.Parameters.AddWithValue("@Password", TextBox11.Text);
                    cmd.Parameters.AddWithValue("@Degree", TextBox12.Text);
                    cmd.Parameters.AddWithValue("@Section", TextBox13.Text);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}