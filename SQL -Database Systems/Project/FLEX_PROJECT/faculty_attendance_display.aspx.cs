using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class faculty_attendance_display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Section = Session["ddlSection"].ToString();
            string registered_course = Session["ddlCourse"].ToString();

            string query = "SELECT distinct s.Student_Id, s.student_name FROM students s " +
                           "JOIN registered_courses rc ON rc.Student_Id = s.Student_Id " +
                           "WHERE s.section = @Section AND rc.Registered_Course = @registered_course";

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Section", Section);
            cmd.Parameters.AddWithValue("@registered_course", registered_course);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            dt.Columns.Add("Date", typeof(DateTime));

            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string courseName = Session["ddlCourse"].ToString();
        string section = Session["ddlSection"].ToString();
        DateTime date = Convert.ToDateTime(txtDate.Text);
        string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";

        foreach (GridViewRow row in GridView1.Rows)
        {
            int studentId = Convert.ToInt32(row.Cells[0].Text);
            string studentName = row.Cells[1].Text;
            DropDownList ddlAttendance = (DropDownList)row.FindControl("ddlAttendance");
            string attendanceStatus = ddlAttendance.SelectedValue;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM attendance WHERE Course_Name = @CourseName AND Section = @Section " +
                               "AND Student_ID = @StudentId AND Date = @Date";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CourseName", courseName);
                command.Parameters.AddWithValue("@Section", section);
                command.Parameters.AddWithValue("@StudentId", studentId);
                command.Parameters.AddWithValue("@Date", date);

                connection.Open();
                int count = (int)command.ExecuteScalar();

                if (count > 0)
                {
                    // Update attendance status
                    query = "UPDATE attendance SET Statuss = @Status WHERE Course_Name = @CourseName AND Section = @Section " +
                            "AND Student_ID = @StudentId AND Date = @Date";

                    command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Status", attendanceStatus);
                    command.Parameters.AddWithValue("@CourseName", courseName);
                    command.Parameters.AddWithValue("@Section", section);
                    command.Parameters.AddWithValue("@StudentId", studentId);
                    command.Parameters.AddWithValue("@Date", date);

                    command.ExecuteNonQuery();
                }
                else
                {
                    // new attendance record
                    query = "INSERT INTO attendance (Course_Name, Section, Student_ID, Student_Name, Date, Statuss) " +
                            "VALUES (@CourseName, @Section, @StudentId, @StudentName, @Date, @Status)";

                    command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@CourseName", courseName);
                    command.Parameters.AddWithValue("@Section", section);
                    command.Parameters.AddWithValue("@StudentId", studentId);
                    command.Parameters.AddWithValue("@StudentName", studentName);
                    command.Parameters.AddWithValue("@Date", date);
                    command.Parameters.AddWithValue("@Status", attendanceStatus);

                    command.ExecuteNonQuery();
                }
            }
        }

    }
}
