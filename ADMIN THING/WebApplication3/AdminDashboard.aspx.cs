using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
                string selectedValue = DropDownList4.SelectedValue;
            switch (selectedValue)
                {
                    case "Allocation":
                        Response.Redirect("~/CourseAllocation.aspx");
                        break;
                    case "Record":
                        Response.Redirect("~/CourseRecord.aspx");
                        break;
                    case "Add":
                         Response.Redirect("~/CourseAdd.aspx");
                        break;
                    case "Registration":
                        Response.Redirect("~/CourseRegistration.aspx");
                         break;
                default:
                        break;
                }

        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList6.SelectedValue;
            switch (selectedValue)
            {
                
                case "Record":
                    Response.Redirect("~/FacultyRecord.aspx");
                    break;
                case "Add":
                    Response.Redirect("~/FacultyAdd.aspx");
                    break;
                default:
                    break;
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList5.SelectedValue;
            switch (selectedValue)
            {
                
                case "Record":
                    Response.Redirect("~/StudentRecord.aspx");
                    break;
                case "Add":
                    Response.Redirect("~/StudentAdd.aspx");
                    break;
                case "Data":
                    Response.Redirect("~/StudentData.aspx");
                    break;
                default:
                    break;
            }
        }

       

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AuditLog.aspx");
        }
    }
    
}