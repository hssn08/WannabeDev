using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class faculty_marks_display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Section = Session["ddlSec"].ToString();
            string registered_course = Session["ddlCou"].ToString();

            string query = "SELECT DISTINCT s.Student_Id, s.student_name FROM students s " +
                           "JOIN registered_courses rc ON rc.Student_Id = s.Student_Id " +
                           "WHERE s.section = @Section AND rc.Registered_Course = @registered_course";

            string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Section", Section);
                cmd.Parameters.AddWithValue("@registered_course", registered_course);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";
        string selectStatement = "SELECT c.course_id FROM courses c JOIN allocated_courses a ON a.course_Name=c.Course_Name WHERE a.course_name = @courseName AND a.section = @section";
        string Section = Session["ddlSec"].ToString();
        string course = Session["ddlCou"].ToString();
        string course_id = "";
        string category = Session["ddlCat"].ToString();


        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(selectStatement, connection);
            command.Parameters.AddWithValue("@courseName", course);
            command.Parameters.AddWithValue("@section", Section);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                course_id = reader["course_id"].ToString();
            }

            reader.Close();

          
            foreach (GridViewRow row in GridView1.Rows)
            {
                int studentId = Convert.ToInt32(row.Cells[0].Text);
                string studentName = row.Cells[1].Text;
                TextBox txtMarks = (TextBox)row.FindControl("txtMarks");

                string marks = txtMarks.Text;

                    string query = "SELECT COUNT(*) FROM marks WHERE Course_Name = @CourseName AND Section = @Section " +
                                   "AND Student_ID = @StudentId AND category=@category";

                    SqlCommand comm = new SqlCommand(query, connection);
                    comm.Parameters.AddWithValue("@CourseName", course);
                    comm.Parameters.AddWithValue("@Section", Section);
                    comm.Parameters.AddWithValue("@StudentId", studentId);
                comm.Parameters.AddWithValue("@category", category);

                int count = (int)comm.ExecuteScalar();

                    if (count > 0)
                    {
                        query = "UPDATE marks SET marks = @Marks WHERE Course_Name = @CourseName AND Section = @Section " +
                                "AND Student_ID = @StudentId AND category=@category";

                        comm = new SqlCommand(query, connection);
                        comm.Parameters.AddWithValue("@CourseName", course);
                        comm.Parameters.AddWithValue("@Section", Section);
                        comm.Parameters.AddWithValue("@StudentId", studentId);
                        comm.Parameters.AddWithValue("@category", category);
                        comm.Parameters.AddWithValue("@Marks", marks);

                        comm.ExecuteNonQuery();
                    }
                    else
                    {
                        query = "INSERT INTO marks (course_ID,Course_Name,Student_ID, Student_Name,Section,category,marks) " +
        "VALUES (@course_ID,@Course_Name,@Student_ID, @Student_Name,@Section,@Category,@marks)";

                        comm = new SqlCommand(query, connection);

                        comm.Parameters.AddWithValue("@course_ID", course_id);
                        comm.Parameters.AddWithValue("@Course_Name", course);
                        comm.Parameters.AddWithValue("@Section", Section);
                        comm.Parameters.AddWithValue("@Student_Id", studentId);
                        comm.Parameters.AddWithValue("@Student_Name", studentName);
                        comm.Parameters.AddWithValue("@Category", category);
                        comm.Parameters.AddWithValue("@marks", marks);

                        comm.ExecuteNonQuery();

                    }
                }
            

        }
    }
}