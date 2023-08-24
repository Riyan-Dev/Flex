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
    public partial class setMarks : System.Web.UI.Page
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedValue != null && TextBox1.Text != "")
            {
                System.Diagnostics.Debug.WriteLine(GridView1.SelectedRow.Cells[4].Text.ToString());
                RangeValidator1.MaximumValue = GridView1.SelectedRow.Cells[4].Text.ToString();
                RangeValidator1.Text = "Marks Obtained Should be in Range 0 to " + GridView1.SelectedRow.Cells[4].Text.ToString();

                if (RangeValidator1.IsValid)
                {
                    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter da = new SqlDataAdapter();

                    cmd.Connection = conn;
                    cmd.CommandText = "updateMarks";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sem", DropDownList6.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@MT", DropDownList7.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@OM", Convert.ToInt32(TextBox1.Text.ToString()));
                    cmd.Parameters.AddWithValue("@ROLLnO", GridView1.SelectedRow.Cells[1].Text.ToString());
                    conn.Open();


                    da.UpdateCommand = cmd;
                    da.UpdateCommand.ExecuteNonQuery();

                    cmd.Dispose();
                    conn.Close();
                    Label6.Text = "";
                    GridView1.DataBind();
                }

            } else
            {
                Label6.Text = "Information Incomplete!! Make sure you have Selected and entered all the required Information.";
                Label6.ForeColor = System.Drawing.Color.Red;
                RangeValidator1.MaximumValue = "1";
                RangeValidator1.Text = "";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();

                cmd.Connection = conn;
                cmd.CommandText = "deleteAssesment";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sem", DropDownList6.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@MT", DropDownList7.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@S", DropDownList5.SelectedValue.ToString());
                conn.Open();


                da.UpdateCommand = cmd;
                da.UpdateCommand.ExecuteNonQuery();

                cmd.Dispose();
                conn.Close();

                GridView1.DataBind();
                DropDownList7.DataBind();
            } catch (SqlException ex)
            {
                
            }

        }
    }
}