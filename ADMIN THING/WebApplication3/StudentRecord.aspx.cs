using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class StudentRecord : System.Web.UI.Page
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

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchField = SearchFeildDropDown.SelectedValue;
            string searchTerm = SearchInput.Text;

            switch (searchField)
            {
                case "Roll no":
                    SqlDataSource1.SelectCommand = "SELECT * FROM Student WHERE rollNo = '"+searchTerm+"'" ;
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("rollNo", searchTerm);
                    
                    break;
                case "Fname":
                    SqlDataSource1.SelectCommand = "SELECT * FROM Student WHERE Firstname = '" + searchTerm + "'";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("Firstname", searchTerm);
                    break;
                case "Lname":
                    SqlDataSource1.SelectCommand = "SELECT * FROM Student WHERE Lastname = '" + searchTerm + "'";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("lastname", searchTerm);
                    break;
                case "City":
                    SqlDataSource1.SelectCommand = "SELECT * FROM Student WHERE city = '" + searchTerm + "'";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("City", searchTerm);
                    break;
                default:
                    throw new Exception("Invalid search field");
            }
            GridView2.DataBind();

        }
    }
}