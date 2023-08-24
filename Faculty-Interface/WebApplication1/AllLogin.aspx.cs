using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class AllLogin : System.Web.UI.Page
    {
        string connection = "Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userName"] = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connection);

            SqlCommand cm  = new SqlCommand();
            conn.Open();
            cm.Connection = conn;
            string un = userIDtxt.Text.ToString();
            string pass = passwordTxt.Text.ToString();

            cm.CommandText = "f_login";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@facultyid", userIDtxt.Text.ToString());
            cm.Parameters.AddWithValue("@password", passwordTxt.Text.ToString());

            string query = "SELECT * FROM Faculty WHERE FacultyID = '" + un + "' AND Password = '" + pass + "'";
            //cm = new SqlCommand(query, conn);
            
            SqlDataReader res = cm.ExecuteReader();
            res.Read();
            if (!res.HasRows)
            {
                //// For Checking STudent login 
                //query = "SELECT * FROM Admin WHERE AdminID = '" + un + "' AND Password = '" + pass + "'";
                //cm = new SqlCommand(query, conn);

                //SqlDataReader res1 = cm.ExecuteReader();
                //if (!res1.HasRows)
                //{
                //    // Checking admin Login credentials
                //    query = "SELECT * FROM Faculty WHERE FacultyID = '" + un + "' AND Password = '" + pass + "'";
                //    cm = new SqlCommand(query, conn);

                //    SqlDataReader res2 = cm.ExecuteReader();

                //    if (!res2.HasRows)
                //    {
                //        // do nothing or print wrong login crediats
                //    }
                //    else
                //    {
                //        // link to admin page 
                //    }
                //}
                //else
                //{
                //    // Link to student Dashboard
                //}

            }
            else
            {
                Session["userName"] = res["FirstName"].ToString() + " " + res["LastName"].ToString();
                Session["facultyID"] = res["FacultyID"].ToString();

                //Session["RollNO"] = res["rollno"].ToString();
                cm.Dispose();
                conn.Close();

                Response.Redirect("~/FacultyDashBoard.aspx");

            }




            System.Diagnostics.Debug.WriteLine("After method call, value of res : {0}", res);
            cm.Dispose();
            conn.Close();
            
        }
    }
}