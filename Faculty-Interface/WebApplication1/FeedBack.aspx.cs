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
    public partial class FeedBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList6.DataBind();
                DropDownList4.DataBind();
            }
            if (Session["facultyID"] != null)
            {
                for (int i = 1; i <= 20; i++)
                {
                    string query = "Select sum(q" + i + ") / count(q" + i + ") As Rating from feedback inner join CourseReg on CourseReg.CID = feedback.CourseID and CourseReg.Semester = feedback.Semester and CourseReg.rollNo = feedback.rollNo inner join courseAlloc on CourseReg.CID = courseAlloc.CourseID and CourseReg.Semester = courseAlloc.Semester and coursereg.secID = courseAlloc.secID where feedback.CourseID = @CID AND feedback.Semester = @SEM and FacultyID = @FID";
                   
                    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");


                    SqlCommand cmd1 = new SqlCommand(query, conn);
                    cmd1.Parameters.AddWithValue("@CID", DropDownList4.Text.ToString());
                    cmd1.Parameters.AddWithValue("@FID", Session["facultyID"].ToString());
                    cmd1.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());
                    conn.Open();
                    SqlDataReader reader = cmd1.ExecuteReader();
                    reader.Read();
                    ((Label)(Page.FindControl("Label" + i))).Text = reader["Rating"].ToString();

                    cmd1.Dispose();
                    conn.Close();
                }
            }

            
        }
    }
}