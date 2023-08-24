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
    public partial class setWeightages : System.Web.UI.Page
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
            if (TextBox1.Text != "")
            {
                




                if (RangeValidator1.IsValid)
                {
                    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter da = new SqlDataAdapter();

                    int temp = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text.ToString());

                    cmd.Connection = conn;
                    cmd.CommandText = "updateWeightage";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sem", DropDownList6.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@S", DropDownList5.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@W", Convert.ToInt32(TextBox1.Text.ToString()));
                    cmd.Parameters.AddWithValue("@MT", GridView1.SelectedRow.Cells[1].Text.ToString());
                    conn.Open();


                    da.UpdateCommand = cmd;
                    da.UpdateCommand.ExecuteNonQuery();

                    cmd.Dispose();
                    conn.Close();
                    Label6.Text = "";

                    SqlConnection conn1 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                    SqlCommand cm = new SqlCommand();

                    cm.Connection = conn1;
                    cm.CommandText = "getTotalWeightage";
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@sem", DropDownList6.SelectedValue.ToString());
                    cm.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                    cm.Parameters.AddWithValue("@S", DropDownList5.SelectedValue.ToString());

                    conn1.Open();


                    SqlDataReader res = cm.ExecuteReader();
                    res.Read();
                    int newTW = Convert.ToInt32(res["Total"].ToString());


                    cm.Dispose();
                    conn1.Close();

                    if (newTW > 100)
                    {
                        SqlConnection conn2 = new SqlConnection("Data Source=DESKTOP-0NM1N30\\RIYAN_SQL;Initial Catalog=DBProj;Integrated Security=True");
                        SqlCommand cmd1 = new SqlCommand();
                        SqlDataAdapter da1 = new SqlDataAdapter();


                        cmd1.Connection = conn2;
                        cmd1.CommandText = "updateWeightage";
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.Parameters.AddWithValue("@sem", DropDownList6.SelectedValue.ToString());
                        cmd1.Parameters.AddWithValue("@CID", DropDownList4.SelectedValue.ToString());
                        cmd1.Parameters.AddWithValue("@S", DropDownList5.SelectedValue.ToString());
                        cmd1.Parameters.AddWithValue("@W", temp);
                        cmd1.Parameters.AddWithValue("@MT", GridView1.SelectedRow.Cells[1].Text.ToString());
                        conn2.Open();


                        da1.UpdateCommand = cmd1;
                        da1.UpdateCommand.ExecuteNonQuery();

                        cmd1.Dispose();
                        conn2.Close();
                        Label6.Text = "Total Weightage for this Section Exceeds 100 kindly add Relevant Weightages";
                    }
                    


                    GridView1.DataBind();
                }
            } else
            {
                Label6.Text = "Information Incomplete!! Make sure you have Selected and entered all the required Information.";
      
            }

        }
    }
}