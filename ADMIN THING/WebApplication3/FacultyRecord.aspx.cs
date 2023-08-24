using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class FacultyRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void D_Button1_Click(object sender, EventArgs e)
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
                    case "FacultyID":
                        SqlDataSource1.SelectCommand = "SELECT * FROM Faculty WHERE Facultyid = '" + searchTerm + "'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("Faculty", searchTerm);

                        break;
                    case "First Name":
                        SqlDataSource1.SelectCommand = "SELECT * FROM Faculty WHERE FirstName = '" + searchTerm + "'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("FirstName", searchTerm);
                        break;
                    case "Joining Date":
                        SqlDataSource1.SelectCommand = "SELECT * FROM Faculty WHERE JoiningDate= '" + searchTerm + "'";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("JoiningDate", searchTerm);
                        break;
                    case "":
                        
                    default:
                        throw new Exception("Invalid search field");
                }
                GridView1.DataBind();
            }
            else 
            {

            }
           
        }
    }
}