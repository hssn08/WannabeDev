using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int semester = int.Parse(Session["semester"].ToString());
            string studentId = Session["Student_Id"].ToString();

            string query = "SELECT c.course_id, c.course_name, c.credit_hrs " +
                           "FROM courses c " +
                           "WHERE c.course_ID NOT IN (SELECT pc.course_id FROM previous_courses pc WHERE pc.student_id = @StudentId) " +
                           "AND c.semester <= @Semester " +
                           "AND NOT EXISTS (SELECT 1 FROM courses pre WHERE pre.course_id = c.pre_req " +
                           "AND pre.course_id NOT IN (SELECT pc.course_id FROM previous_courses pc WHERE pc.student_id = @StudentId))";

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@StudentId", studentId);
            cmd.Parameters.AddWithValue("@Semester", semester);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");
        con.Open();

        int studentId = (int)Session["Student_Id"];

        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
            if (chk.Checked)
            {
                string courseName = row.Cells[2].Text;
                SqlCommand cmdd = new SqlCommand("INSERT INTO registered_courses (Student_Id, Registered_Course, feedback_status) VALUES (@Student_Id, @CourseName, 'notsubmitted')", con);
                cmdd.Parameters.AddWithValue("@Student_Id", studentId);
                cmdd.Parameters.AddWithValue("@CourseName", courseName);
                cmdd.ExecuteNonQuery();
                cmdd.Dispose();
            }
        }

        con.Close();
        Response.Redirect("student.aspx");
    }
}