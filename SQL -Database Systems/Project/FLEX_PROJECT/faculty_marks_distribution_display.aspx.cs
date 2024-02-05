using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class flex_marks_distribution_display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session["ddlSectionn"] = ddlSection.SelectedItem.Text;
        Session["ddlCoursee"] = ddlCourse.SelectedItem.Text;
        Response.Redirect("faculty_marks_distribution.aspx");
    }
}