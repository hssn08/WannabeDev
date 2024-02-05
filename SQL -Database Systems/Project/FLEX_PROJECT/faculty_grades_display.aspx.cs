using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class faculty_grades_display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string section = Session["ddlSect"].ToString();
            string registered_course = Session["ddlCour"].ToString();

            string query = "SELECT distinct s.Student_Id, s.student_name FROM students s " +
                           "JOIN registered_courses rc ON rc.Student_Id = s.Student_Id " +
                           "WHERE s.section = @Section AND rc.Registered_Course = @registered_course";

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Section", section);
            cmd.Parameters.AddWithValue("@registered_course", registered_course);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            // Add new columns to the DataTable to store the Absolutes and Grade
            dt.Columns.Add("Absolutes", typeof(double));
            dt.Columns.Add("Grade", typeof(string));

            // Iterate over each row in the DataTable and calculate the Absolutes and Grade for each student
            foreach (DataRow row in dt.Rows)
            {
                int studentID = Convert.ToInt32(row["Student_Id"]);

                string gradeQuery = "SELECT SUM(weightage * marks) * 0.01 AS Absolutes, " +
                                    "CASE " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 90 THEN 'A+' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 86 THEN 'A' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 82 THEN 'A-' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 78 THEN 'B+' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 74 THEN 'B' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 70 THEN 'B-' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 66 THEN 'C+' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 62 THEN 'C' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 58 THEN 'C-' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 54 THEN 'D+' " +
                                        "WHEN SUM(weightage * marks) * 0.01 >= 50 THEN 'D' " +
                                        "ELSE 'F' " +
                                    "END AS Grade " +
                                    "FROM marks_distribution md " +
                                    "JOIN marks m ON md.course_Name = m.course_Name AND md.Section = m.Section AND md.category = m.category " +
                                    "WHERE md.course_Name = @CourseName AND md.Section = @Section AND m.Student_ID = @StudentID " +
                                    "GROUP BY m.Student_ID";

                SqlCommand gradeCmd = new SqlCommand(gradeQuery, conn);
                gradeCmd.Parameters.AddWithValue("@CourseName", registered_course);
                gradeCmd.Parameters.AddWithValue("@Section", section);
                gradeCmd.Parameters.AddWithValue("@StudentID", studentID);

                conn.Open();
                SqlDataReader reader = gradeCmd.ExecuteReader();

                if (reader.Read())
                {
                    row["Absolutes"] = reader["Absolutes"];
                    row["Grade"] = reader["Grade"];
                }
                reader.Close();
                conn.Close();

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";
        string selectStatement = "SELECT c.course_id FROM courses c JOIN allocated_courses a ON a.course_Name=c.Course_Name WHERE a.course_name = @courseName AND a.section = @section";
        string section = Session["ddlSect"].ToString();
        string course = Session["ddlCour"].ToString();
        string course_id = "";


        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(selectStatement, conn);
            command.Parameters.AddWithValue("@courseName", course);
            command.Parameters.AddWithValue("@section", section);

            conn.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                course_id = reader["course_id"].ToString();
            }

            reader.Close();

            foreach (GridViewRow row in GridView1.Rows)
            {
                int studentID = Convert.ToInt32(row.Cells[0].Text);
                string studentName = row.Cells[1].Text;
                string grade = row.Cells[3].Text;

                // Check if a record already exists for the same student, course, and section
                string query = "SELECT COUNT(*) FROM grades WHERE course_ID = @CourseID AND Student_ID = @StudentID AND Section = @Section";

                int count = 0;

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CourseID", course_id);
                    cmd.Parameters.AddWithValue("@StudentID", studentID);
                    cmd.Parameters.AddWithValue("@Section", section);

                    count = (int)cmd.ExecuteScalar();
                    
                }


                if (count == 0)
                {
                    // Insert the grade into the grades table
                    query = "INSERT INTO grades (course_ID, course_Name, Student_ID, Student_Name, Section, grade) " +
                            "VALUES (@CourseID, @CourseName, @StudentID, @StudentName, @Section, @Grade)";


                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@CourseID", course_id);
                        cmd.Parameters.AddWithValue("@CourseName", course);
                        cmd.Parameters.AddWithValue("@StudentID", studentID);
                        cmd.Parameters.AddWithValue("@StudentName", studentName);
                        cmd.Parameters.AddWithValue("@Section", section);
                        cmd.Parameters.AddWithValue("@Grade", grade);

                        cmd.ExecuteNonQuery();
                    }

                }
                else
                {
                    // Update the existing record with the new grade
                    query = "UPDATE grades SET grade = @Grade WHERE course_ID = @CourseID AND Student_ID = @StudentID AND Section = @Section";


                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@CourseID", course_id);
                        cmd.Parameters.AddWithValue("@StudentID", studentID);
                        cmd.Parameters.AddWithValue("@Section", section);
                        cmd.Parameters.AddWithValue("@Grade", grade);

                        cmd.ExecuteNonQuery();
                    }

                }
            }
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("faculty_grade_count.aspx");
    }
}