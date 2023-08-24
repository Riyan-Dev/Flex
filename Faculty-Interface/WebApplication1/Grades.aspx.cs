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
    public partial class Grades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();

                cmd.Connection = conn;
                cmd.CommandText = "getStudentsforSC";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sec", DropDownList5.Text.ToString());
                cmd.Parameters.AddWithValue("@FID", Session["FacultyID"].ToString());
                cmd.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    SqlConnection conn1 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");

                    SqlCommand cm = new SqlCommand();
                    cm.Connection = conn1;
                    cm.CommandText = "getTotalObtained";
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());
                    cm.Parameters.AddWithValue("@RN", reader.GetValue(0).ToString());
                    cm.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());

                    conn1.Open();
                    SqlDataReader res = cm.ExecuteReader();
                    res.Read();

                    double TotalObtained = Convert.ToDouble(res.GetValue(0).ToString());

                    System.Diagnostics.Debug.WriteLine(TotalObtained);

                    cm.Dispose();
                    conn1.Close();
                    string grade;
                    if (TotalObtained >= 90)
                        grade = "A+";
                    else if (TotalObtained >= 86)
                        grade = "A";
                    else if (TotalObtained >= 82)
                        grade = "A-";
                    else if (TotalObtained >= 78)
                        grade = "B+";
                    else if (TotalObtained >= 74)
                        grade = "B";
                    else if (TotalObtained >= 70)
                        grade = "B-";
                    else if (TotalObtained >= 66)
                        grade = "C+";
                    else if (TotalObtained >= 62)
                        grade = "C";
                    else if (TotalObtained >= 58)
                        grade = "C-";
                    else if (TotalObtained >= 54)
                        grade = "D+";
                    else if (TotalObtained >= 50)
                        grade = "D";
                    else
                        grade = "F";

                    SqlConnection conn2 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");

                    SqlCommand cm1 = new SqlCommand();
                    cm1.Connection = conn2;
                    cm1.CommandText = "GENERATEGRADES";
                    cm1.CommandType = CommandType.StoredProcedure;
                    cm1.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());
                    cm1.Parameters.AddWithValue("@RN", reader.GetValue(0).ToString());
                    cm1.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                    cm1.Parameters.AddWithValue("@G", grade);

                    conn2.Open();
                    cm1.ExecuteNonQuery();
                    cm1.Dispose();
                    conn2.Close();
                }

                cmd.Dispose();
                conn.Close();
                Label4.Text = "Grades Generated Successfully";
                Label4.ForeColor = System.Drawing.Color.CornflowerBlue;
                GridView1.DataBind();
            } catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    Label4.Text = "Grades Already generated";
                    Label4.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["FacultyID"] == null)
                return;

                try
                {
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();

                cmd.Connection = conn;
                cmd.CommandText = "DropGrades";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sem", DropDownList6.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@FID", Session["facultyID"].ToString());
                cmd.Parameters.AddWithValue("@Sec", DropDownList5.SelectedValue.ToString());
                conn.Open();


                da.UpdateCommand = cmd;
                da.UpdateCommand.ExecuteNonQuery();

                cmd.Dispose();
                conn.Close();
                Label4.Text = "Grades Dropped Successfully";
                Label4.ForeColor = System.Drawing.Color.CornflowerBlue;
                GridView1.DataBind();
              
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    Label4.Text = "Grades Does Not Exists";
                    Label4.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}