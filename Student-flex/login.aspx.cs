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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=WRAITHEON\\SQLEXPRESS;Initial Catalog=flex;Integrated Security=True");

            SqlCommand cm = new SqlCommand();
            conn.Open();
            cm.Connection = conn;
            string un = TextBox1.Text.ToString();
            string pass = TextBox2.Text.ToString();

            //cm.CommandText = "f_login";
            //cm.CommandType = CommandType.StoredProcedure;
            //cm.Parameters.AddWithValue("@facultyid", TextBox1.Text.ToString());
            //cm.Parameters.AddWithValue("@password", TextBox2.Text.ToString());

            string query = "SELECT * FROM Student WHERE rollNo = '" + un + "' AND Password = '" + pass + "'";
            cm = new SqlCommand(query, conn);

            SqlDataReader res = cm.ExecuteReader();
            res.Read();
            if (!res.HasRows)
            {
                

            }
            else
            {
                Session["userName"] = res["FirstName"].ToString() + " " + res["LastName"].ToString();
                Session["rollNo"] = res["rollNo"].ToString();

                //Session["RollNO"] = res["rollno"].ToString();
                cm.Dispose();
                conn.Close();

                Response.Redirect("~/studentDash.aspx");

            }




            System.Diagnostics.Debug.WriteLine("After method call, value of res : {0}", res);
            cm.Dispose();
            conn.Close();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}