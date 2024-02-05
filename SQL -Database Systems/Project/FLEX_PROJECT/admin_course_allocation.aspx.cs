using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
public partial class admin_course_allocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }





    protected void Button1_Click1(object sender, EventArgs e)
    {
        string sectionn = ddlSection.SelectedValue;

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            DropDownList ddlFaculty = (DropDownList)GridView1.Rows[i].FindControl("ddlFaculty");
            string facultyName = ddlFaculty.SelectedValue;
            string courseName = GridView1.Rows[i].Cells[0].Text;

            int count = 0;
            for (int j = 0; j < GridView1.Rows.Count; j++)
            {
                if (i != j)
                {
                    DropDownList ddlFaculty2 = (DropDownList)GridView1.Rows[j].FindControl("ddlFaculty");
                    string facultyName2 = ddlFaculty2.SelectedValue;
                    string courseName2 = GridView1.Rows[j].Cells[0].Text;

                    if (facultyName == facultyName2 && courseName != courseName2)
                    {
                        count++;
                    }
                }
            }

            // If the count is greater than or equal to 3, display an error message
            if (count >= 3)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Error: " + facultyName + " cannot be allocated more than 3 courses for section " + sectionn + "');", true);
                return;
            }
        }
        foreach (GridViewRow row in GridView1.Rows)
        {
            DropDownList ddlFaculty = (DropDownList)row.FindControl("ddlFaculty");
            string course = row.Cells[0].Text;
            string teacher = ddlFaculty.SelectedValue;
            string section = ddlSection.SelectedItem.Text;
            string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";

            // Check if the same course against the same section is already registered
            string checkQuery = "SELECT COUNT(*) FROM allocated_courses WHERE Course_Name = @Course_Name AND Section = @Section";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(checkQuery, connection))
                {
                    command.Parameters.AddWithValue("@Course_Name", course);
                    command.Parameters.AddWithValue("@Section", section);
                    connection.Open();
                    int count = (int)command.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row of the result set
                    connection.Close();

                    if (count > 0)
                    {
                        // If the same course against the same section is already registered, update the existing row
                        string updateQuery = "UPDATE allocated_courses SET Teacher_Name = @Teacher_Name WHERE Course_Name = @Course_Name AND Section = @Section";
                        using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                        {
                            updateCommand.Parameters.AddWithValue("@Course_Name", course);
                            updateCommand.Parameters.AddWithValue("@Teacher_Name", teacher);
                            updateCommand.Parameters.AddWithValue("@Section", section);
                            connection.Open();
                            updateCommand.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                    else
                    {
                        // If the same course against the same section is not registered, insert a new row
                        string insertQuery = "INSERT INTO allocated_courses(Course_Name, Teacher_Name, Section) VALUES (@Course_Name, @Teacher_Name, @Section)";
                        using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                        {
                            insertCommand.Parameters.AddWithValue("@Course_Name", course);
                            insertCommand.Parameters.AddWithValue("@Teacher_Name", teacher);
                            insertCommand.Parameters.AddWithValue("@Section", section);
                            connection.Open();
                            insertCommand.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }
}