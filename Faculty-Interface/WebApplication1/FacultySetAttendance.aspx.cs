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
    public partial class FacultySetAttendance : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           // fillDrop1();
        }

        //private void fillDrop1()
        //{
        //    DropDownList1.DataSource = getUserData();
        //    DropDownList1.DataTextField = "CName";
        //    DropDownList1.DataValueField = "CourseID";
        //    DropDownList1.DataBind();
        //}

        //public DataTable getUserData()
        //{
        //    string un = Session["userName"].ToString();

        //    cmd.CommandText = "getAlocCourse";
        //    cmd.Connection = conn;
           
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@FacultyID", un);
        //    da = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    da.Fill(dt);

        //    return dt;

           
        //}

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedValue != null && (DropDownList4.SelectedValue.ToString() != ""))
            {
                

                Label7.Text = "";
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();

                cmd.Connection = conn;
                cmd.CommandText = "updateAttendance";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sem", DropDownList3.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@CID", DropDownList1.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@DT", TextBox1.Text.ToString());
                cmd.Parameters.AddWithValue("@A", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@ROLLnO", GridView1.SelectedRow.Cells[1].Text.ToString());
                conn.Open();


                da.UpdateCommand = cmd;
                da.UpdateCommand.ExecuteNonQuery();

                cmd.Dispose();
                conn.Close();

                GridView1.DataBind();

            }
            else
            {
                Label7.Text = "Please Select a Row And Presense To Update!";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["FacultyID"] != null)
                {
                    Label7.Text = "";

                    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter da = new SqlDataAdapter();

                    cmd.Connection = conn;
                    cmd.CommandText = "getStudentsforSC";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sec", DropDownList2.Text.ToString());
                    cmd.Parameters.AddWithValue("@FID", Session["FacultyID"].ToString());
                    cmd.Parameters.AddWithValue("@sem", DropDownList3.Text.ToString());
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        System.Diagnostics.Debug.WriteLine(reader.GetValue(0));

                        if (TextBox1.Text != "" && TextBox2.Text != "")
                        {
                            SqlConnection conn1 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");

                            SqlCommand cm = new SqlCommand();
                            cm.Connection = conn1;
                            cm.CommandText = "generateAttendanceSheet";
                            cm.CommandType = CommandType.StoredProcedure;
                            cm.Parameters.AddWithValue("@sem", DropDownList3.Text.ToString());
                            cm.Parameters.AddWithValue("@rollNO", reader.GetValue(0).ToString());
                            cm.Parameters.AddWithValue("@CourseID", DropDownList1.SelectedValue.ToString());
                            cm.Parameters.AddWithValue("@DT", TextBox1.Text.ToString());
                            cm.Parameters.AddWithValue("@CH", TextBox2.Text.ToString());
                            conn1.Open();
                            cm.ExecuteNonQuery();


                            cm.Dispose();
                            conn1.Close();
                        }
                    }
                    cmd.Dispose();
                    conn.Close();

                    GridView1.DataBind();

                }
                else
                {
                    Label7.Text = "Faculty ID not Found";

                }
            } catch (SqlException ex)
            {

            }
        }
    }
}