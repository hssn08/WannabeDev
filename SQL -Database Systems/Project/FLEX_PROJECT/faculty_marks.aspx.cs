using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faculty_marks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ddlSec"] = ddlSection.SelectedItem.Text;
        Session["ddlCou"] = ddlCourse.SelectedItem.Text;
        Session["ddlCat"] = ddlCategory.SelectedItem.Text;

        Response.Redirect("faculty_marks_display.aspx");
    }
}