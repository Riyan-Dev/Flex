using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class GradeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.ForeColor = System.Drawing.Color.CornflowerBlue;
            Button4.ForeColor = System.Drawing.Color.DarkCyan;
            Button3.ForeColor = System.Drawing.Color.CornflowerBlue;
            Button1.ForeColor = System.Drawing.Color.CornflowerBlue;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GradeReport.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GradeCount.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AttendanceReport.aspx");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EvaluationReport.aspx");

        }
    }
}