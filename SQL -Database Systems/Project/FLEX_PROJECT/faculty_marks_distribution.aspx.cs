using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class faculty_marks_distribution : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string course = Session["ddlCoursee"].ToString();
            string section = Session["ddlSectionn"].ToString();

           string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";
            string selectStatement = "SELECT category, weightage FROM marks_distribution WHERE course_Name = @courseName AND Section = @section";
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(selectStatement, connection);
                command.Parameters.AddWithValue("@courseName", course);
                command.Parameters.AddWithValue("@section", section);

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
            }

            ViewState["MarksTable"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string category = CategoryTextBox.Value;
        int weightage = Convert.ToInt32(WeightageTextBox.Value);

        DataTable dt = (DataTable)ViewState["MarksTable"];

        DataRow[] existingRows = dt.Select("Category = '" + category + "'");
        if (existingRows.Length > 0)
        {
            existingRows[0]["Weightage"] = weightage;
        }
        else
        {
           DataRow dr = dt.NewRow();
            dr["Category"] = category;
            dr["Weightage"] = weightage;
            dt.Rows.Add(dr);
        }

        ViewState["MarksTable"] = dt;

        GridView1.DataSource = dt;
        GridView1.DataBind();

        CategoryTextBox.Value = "";
        WeightageTextBox.Value = "";
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["ddlSectionn"] != null)
        {
            string section = Session["ddlSectionn"].ToString();
            string course = Session["ddlCoursee"].ToString();
            string course_id = "";
            string connectionString = "Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True";

            string selectStatement = "SELECT c.course_id FROM courses c join allocated_courses a on a.course_Name=c.Course_Name WHERE a.course_name = @courseName AND a.section = @section";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(selectStatement, connection);
                command.Parameters.AddWithValue("@courseName", course);
                command.Parameters.AddWithValue("@section", section);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    course_id = reader["course_id"].ToString();
                }
                reader.Close();

                int totalWeightage = 0;
                foreach (GridViewRow row in GridView1.Rows)
                {
                    string category = row.Cells[0].Text;
                    int weightage = Convert.ToInt32(row.Cells[1].Text);
                    totalWeightage += weightage;

                    string selectCategoryStatement = "SELECT COUNT(*) FROM marks_distribution WHERE course_Name = @courseName AND Section = @section AND category = @category";
                    SqlCommand selectCategoryCommand = new SqlCommand(selectCategoryStatement, connection);
                    selectCategoryCommand.Parameters.AddWithValue("@courseName", course);
                    selectCategoryCommand.Parameters.AddWithValue("@section", section);
                    selectCategoryCommand.Parameters.AddWithValue("@category", category);
                    int count = Convert.ToInt32(selectCategoryCommand.ExecuteScalar());

                    if (count > 0)
                    {
                        // Update the weightage
                        string updateStatement = "UPDATE marks_distribution SET weightage = @weightage WHERE course_Name = @courseName AND Section = @section AND category = @category";
                        SqlCommand updateCommand = new SqlCommand(updateStatement, connection);
                        updateCommand.Parameters.AddWithValue("@courseName", course);
                        updateCommand.Parameters.AddWithValue("@section", section);
                        updateCommand.Parameters.AddWithValue("@category", category);
                        updateCommand.Parameters.AddWithValue("@weightage", weightage);
                        updateCommand.ExecuteNonQuery();
                    }
                    else
                    {
                        // Insert the category and weightage
                        if (totalWeightage <= 100)
                        {
                            string insertStatement = "INSERT INTO marks_distribution (course_ID, course_Name, Section, category, weightage) VALUES (@course_ID, @courseName, @Section, @category, @weightage)";
                            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);
                            insertCommand.Parameters.AddWithValue("@course_ID", course_id);
                            insertCommand.Parameters.AddWithValue("@courseName", course);
                            insertCommand.Parameters.AddWithValue("@section", section);
                            insertCommand.Parameters.AddWithValue("@category", category);
                            insertCommand.Parameters.AddWithValue("@weightage", weightage);
                            insertCommand.ExecuteNonQuery();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('The total weightage cannot exceed 100');", true);

                            return;
                        }
                    }
                }
            }
        }
    }


}
