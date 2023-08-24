using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Marks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList1.SelectedValue.ToString();

            System.Diagnostics.Debug.WriteLine("Hello");
            System.Diagnostics.Debug.WriteLine(selectedValue);

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
    }
}