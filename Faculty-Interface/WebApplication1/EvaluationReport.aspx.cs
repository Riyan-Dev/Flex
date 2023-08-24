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
    public partial class EvaluationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.ForeColor = System.Drawing.Color.CornflowerBlue;
            Button3.ForeColor = System.Drawing.Color.DarkCyan;
            Button4.ForeColor = System.Drawing.Color.CornflowerBlue;
            Button1.ForeColor = System.Drawing.Color.CornflowerBlue;
            GridView1.Columns.Clear();

            try
            {
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");



                SqlCommand cmd = new SqlCommand("drop table temp", conn);

                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                conn.Close();
            }
            catch (SqlException ex)
            {

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dropTableTemp();
            Response.Redirect("~/GradeCount.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            dropTableTemp();
            Response.Redirect("~/AttendanceReport.aspx");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // Response.Redirect("~/EvaluationReport.aspx");


            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
            SqlCommand cmd1 = new SqlCommand("create table temp( Name varchar(100), rollNo varchar(8) )", conn);

            TemplateField customField1 = new TemplateField();

            BoundField test = new BoundField();
            test.DataField = "Name";
            test.HeaderText = "Name";
            GridView1.Columns.Add(test);
            test = new BoundField();
            test.DataField = "rollNo";
            test.HeaderText = "rollNo";
            GridView1.Columns.Add(test);


            conn.Open();
            cmd1.ExecuteNonQuery();
            cmd1.Dispose();
            conn.Close();

            cmd1 = new SqlCommand("insertRandN", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@Sec", DropDownList5.Text.ToString());
            cmd1.Parameters.AddWithValue("@FID", Session["facultyID"].ToString());
            cmd1.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());

            conn.Open();
            cmd1.ExecuteNonQuery();
            cmd1.Dispose();
            conn.Close();


            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();

            cmd.Connection = conn;
            cmd.CommandText = "getAssesments";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@S", DropDownList5.Text.ToString());
            cmd.Parameters.AddWithValue("@CID", DropDownList4.Text.ToString());
            cmd.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            System.Diagnostics.Debug.WriteLine("Hello");
            while (reader.Read())
            {
                SqlConnection conn1 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                string newCol = reader.GetValue(0).ToString();
                System.Diagnostics.Debug.WriteLine(newCol);

                test = new BoundField();
                test.DataField = newCol;
                test.HeaderText = newCol;
                GridView1.Columns.Add(test);

                string query = "Alter Table temp add " + newCol + " int";
                SqlCommand cmd2 = new SqlCommand(query , conn1);

                conn1.Open();
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
                conn1.Close();

                query = "update temp set " + newCol + " = marks.ObtainedMarks from temp inner join marks on temp.rollNo = marks.rollNo inner join CourseReg on marks.rollNo = CourseReg.rollNo AND marks.CourseID = CourseReg.CID and marks.Semester = CourseReg.Semester where Coursereg.Semester = @SEM AND CourseReg.CID = @CID AND Coursereg.secID = @SEC AND marktype = @MT ";

                cmd2 = new SqlCommand(query, conn1);

                cmd2.Parameters.AddWithValue("@SEM", DropDownList6.SelectedValue.ToString());
                cmd2.Parameters.AddWithValue("@SEC", DropDownList5.SelectedValue.ToString());
                cmd2.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                cmd2.Parameters.AddWithValue("@MT", newCol);
                conn1.Open();
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
                conn1.Close();

            }
            cmd.Dispose();
            conn.Close();

            string query1 = "Alter Table temp add Grand_Total decimal(7,2)";
            cmd = new SqlCommand(query1, conn);

            test = new BoundField();
            test.DataField = "Grand_Total";
            test.HeaderText = "Grand_Total";
            GridView1.Columns.Add(test);

            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            cmd = new SqlCommand("insertGT", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SEM", DropDownList6.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());

            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            cmd = new SqlCommand("Select * from temp", conn);
            da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            cmd.Dispose();
            conn.Close();

        }
        
        protected void Button4_Click(object sender, EventArgs e)
        {
            dropTableTemp();
            Response.Redirect("~/GradeReport.aspx");

        }

        public void dropTableTemp()
        {
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");



                SqlCommand cmd = new SqlCommand("drop table temp", conn);

                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                conn.Close();
            }
            catch (SqlException ex)
            {

            }
        }
    }
}