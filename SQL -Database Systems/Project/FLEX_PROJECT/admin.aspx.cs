using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_course_registration.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_sections.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_new_student.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_new_faculty.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_course_allocation.aspx");
    }
}

