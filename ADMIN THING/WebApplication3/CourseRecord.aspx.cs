using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class CourseRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void D_Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string searchField = DropDownList1.SelectedValue;
            string searchTerm = TextBox1.Text;
            if (TextBox1 != null)
            {
                switch (searchField)
                {
                    case "CourseID":
                        SqlDataSource1.SelectCommand = "SELECT * FROM Courses WHERE courseid = '" + searchTerm + "'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("CourseID", searchTerm);

                        break;
                    case "Name":
                        SqlDataSource1.SelectCommand = "SELECT * FROM Courses WHERE Cname = '" + searchTerm + "'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("Cname", searchTerm);
                        break;
                    case "Prereq":
                        SqlDataSource1.SelectCommand = "SELECT * FROM Courses WHERE prereq = '" + searchTerm + "'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("prereq", searchTerm);
                        break;
                    case "":
                        break;
                    default:
                        throw new Exception("Invalid search field");
                }
                GridView1.DataBind();
            }
             if(searchField == "" )
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM Student";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("", searchTerm);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        { 
            
        }
    }
 }
