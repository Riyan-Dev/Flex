using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Login : System.Web.UI.Page
    {
        string connection = "Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connection);

            SqlCommand cm;
            conn.Open();
            string un = userIDtxt.Text.ToString();
            string pass = passwordTxt.Text.ToString();
            //new SqlCommand();
            //  cm.CommandText = "F_login";
            // cm.CommandType = CommandType.StoredProcedure;
            //  cm.Parameters.AddWithValue("@FacultyID", userIDtxt.Text.ToString());
            //  cm.Parameters.AddWithValue("@Password", passwordTxt.Text.ToString());
            string query = "SELECT * FROM Admin WHERE AdminID = '" + un + "' AND Password = '" + pass + "'";
            cm = new SqlCommand(query, conn);
            SqlDataReader res = cm.ExecuteReader();
            res.Read();
            if (!res.HasRows)
            {
                // Response.Redirect("~/FacultyDashBoard.aspx");
                // For Checking STudent login 
               

            }
            else
            {
                
                Session["adminid"] = res["AdminID"].ToString();
                Response.Redirect("~/AdminDashboard.aspx");

            }




            Console.WriteLine("After method call, value of res : {0}", res);
            cm.Dispose();
            conn.Close();
        }
    }

}