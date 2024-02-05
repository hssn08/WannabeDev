using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class student_feeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
            int studentId = (int)Session["Student_Id"];
            string courseName = DropDownList1.SelectedItem.Text;
            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");
            conn.Open();
            string updateQuery = "UPDATE registered_courses SET feedback_status = 'submitted' WHERE Student_Id = @Student_Id AND registered_course = @Course_Name";
            SqlCommand cm = new SqlCommand(updateQuery, conn);
            cm.Parameters.AddWithValue("@Student_Id", studentId);
            cm.Parameters.AddWithValue("@Course_Name", courseName);
            int rowsAffected = cm.ExecuteNonQuery();
            cm.Dispose();
         
            if (rowsAffected > 0)
            {
            //studentid && course
            string subquery = "select Teacher_Name from allocated_courses where Section='"+Session["Section"]+"'";
            SqlCommand cmd = new SqlCommand(subquery, conn);

            SqlDataReader read = cmd.ExecuteReader();
            string teacher_name="";
            if (read.Read())
            {
                teacher_name = read["Teacher_Name"].ToString();
            }
            read.Close();

            string date = Request.Form["date"];
            string q1 = Request.Form["q1"];
            string q2 = Request.Form["q2"];
            string q3 = Request.Form["q3"];
            string q4 = Request.Form["q4"];
            string q5 = Request.Form["q5"];
            string q6 = Request.Form["q6"];
            string q7 = Request.Form["q7"];
            string q8 = Request.Form["q8"];
            string q9 = Request.Form["q9"];
            string q10 = Request.Form["q10"];
            string q11 = Request.Form["q11"];
            string q12 = Request.Form["q12"];
            string q13 = Request.Form["q13"];
            string q14 = Request.Form["q14"];
            string q15 = Request.Form["q15"];
            string q16 = Request.Form["q16"];
            string q17 = Request.Form["q17"];
            string q18 = Request.Form["q18"];
            string q19 = Request.Form["q19"];
            string q20 = Request.Form["q20"];
            string comments = Request.Form["comments"];

            string query = "INSERT INTO feedback (Student_Id,Course,date,teacher_name,q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20,comments) VALUES (@Student_Id, @Course_Name,@date,@teacher_name,@q1, @q2, @q3, @q4, @q5, @q6, @q7, @q8, @q9, @q10, @q11, @q12, @q13, @q14, @q15, @q16, @q17, @q18, @q19, @q20,@comments)";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@Student_Id", studentId);
            command.Parameters.AddWithValue("@Course_Name", courseName);
            command.Parameters.AddWithValue("@date", date);
            command.Parameters.AddWithValue("@teacher_name", teacher_name);
            command.Parameters.AddWithValue("@q1", q1);
            command.Parameters.AddWithValue("@q2", q2);
            command.Parameters.AddWithValue("@q3", q3);
            command.Parameters.AddWithValue("@q4", q4);
            command.Parameters.AddWithValue("@q5", q5);
            command.Parameters.AddWithValue("@q6", q6);
            command.Parameters.AddWithValue("@q7", q7);
            command.Parameters.AddWithValue("@q8", q8);
            command.Parameters.AddWithValue("@q9", q9);
            command.Parameters.AddWithValue("@q10", q10);
            command.Parameters.AddWithValue("@q11", q11);
            command.Parameters.AddWithValue("@q12", q12);
            command.Parameters.AddWithValue("@q13", q13);
            command.Parameters.AddWithValue("@q14", q14);
            command.Parameters.AddWithValue("@q15", q15);
            command.Parameters.AddWithValue("@q16", q16);
            command.Parameters.AddWithValue("@q17", q17);
            command.Parameters.AddWithValue("@q18", q18);
            command.Parameters.AddWithValue("@q19", q19);
            command.Parameters.AddWithValue("@q20", q20);
            command.Parameters.AddWithValue("@comments", comments);

            command.ExecuteNonQuery();

        command.Dispose();
            Response.Redirect("student.aspx");
            }
        conn.Close();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}