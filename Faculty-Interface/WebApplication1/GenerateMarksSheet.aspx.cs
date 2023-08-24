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
    public partial class GenerateMarksSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList1.SelectedValue;
            switch (selectedValue)
            {
                case "Main":
                    Response.Redirect("~/Marks.aspx");
                    break;
                case "Set Marks":
                    Response.Redirect("~/setMarks.aspx");
                    break;
                case "Set Weightages":
                    Response.Redirect("~/setWeightages.aspx");
                    break;
                case "Generate Marks":
                    Response.Redirect("~/GenerateMarksSheet.aspx");
                    break;
                default:
                    break;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox2.Text != "" && TextBox3.Text != "" && Session["FacultyID"] != null && RangeValidator1.IsValid && RangeValidator2.IsValid)
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
                        System.Diagnostics.Debug.WriteLine(reader.GetValue(0));

                        SqlConnection conn1 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                        string markType = DropDownList7.SelectedValue.ToString() + TextBox2.Text.ToString();

                        SqlCommand cm = new SqlCommand();
                        cm.Connection = conn1;
                        cm.CommandText = "GenerateMarkSheet";
                        cm.CommandType = CommandType.StoredProcedure;
                        cm.Parameters.AddWithValue("@sem", DropDownList6.Text.ToString());
                        cm.Parameters.AddWithValue("@RN", reader.GetValue(0).ToString());
                        cm.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                        cm.Parameters.AddWithValue("@TM", Convert.ToInt32(TextBox3.Text.ToString()));
                        cm.Parameters.AddWithValue("@MT", markType);
                        conn1.Open();
                        cm.ExecuteNonQuery();


                        cm.Dispose();
                        conn1.Close();

                    }
                    Label11.Text = "Mark Sheet Generated Successfully";
                    Label11.ForeColor = System.Drawing.Color.CornflowerBlue;
                    
                }
                else
                {
                    Label11.Text = "Information Incomplete!! Make sure you have entered all the required Information.";
                    Label11.ForeColor = System.Drawing.Color.Red;
                }
            } catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    Label11.Text = "This Assesment Already Existss.";
                    Label11.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}