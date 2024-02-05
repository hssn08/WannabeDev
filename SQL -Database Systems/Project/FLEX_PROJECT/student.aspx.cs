using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("student.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");
        conn.Open();
        SqlCommand cm;
        string query = "select rc.Registered_Course from registered_courses rc join Students s on s.Student_Id=rc.Student_Id where rc.feedback_status='notsubmitted' AND s.UserName = '" + Session["username"] + "'";
        cm = new SqlCommand(query, conn);

        SqlDataReader res = cm.ExecuteReader();

        if (res.Read())
        {

            Response.Redirect("student_feedback.aspx");
        }
        else
        {
            string message = "Feedback has already been submitted.";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + message + "');", true);
        }

        res.Close();
        cm.Dispose();
        conn.Close();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        using (SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True"))
        {
            conn.Open();
            string query = "SELECT COUNT(*) FROM registered_courses rc " +
                           "JOIN Students s ON s.Student_Id = rc.Student_Id " +
                           "WHERE  s.UserName = '" + Session["username"] + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", Session["username"]);
            int count = (int)cmd.ExecuteScalar();
            if (count > 0)
            {
                string message = "You've already registered courses, Contact admin to make any changes!";
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + message + "');", true);
            }
            else
            {
                Response.Redirect("student_code_registration.aspx");
            }
            cmd.Dispose();
        }


    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_attendance.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_transcript.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_marks.aspx");
    }
}