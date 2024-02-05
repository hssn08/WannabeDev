using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Data;
public partial class faculty_attendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }




    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session["ddlSection"] = ddlSection.SelectedItem.Text;
        Session["ddlCourse"] = ddlCourse.SelectedItem.Text;
        Response.Redirect("faculty_attendance_display.aspx");
    }
}