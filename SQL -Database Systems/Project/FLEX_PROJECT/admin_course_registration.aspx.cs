using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class admin_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string query = "SELECT Registered_Course, COUNT(*) AS Num_Students FROM registered_courses GROUP BY Registered_Course ";

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");

            SqlCommand cmd = new SqlCommand(query, conn);


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

        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
            if (chk.Checked)
            {
                string courseName = row.Cells[1].Text;
                 con.Open();
                string deleteQuery = "DELETE FROM registered_courses WHERE Registered_Course=@CourseName";
                    SqlCommand cmd = new SqlCommand(deleteQuery, con);
                    cmd.Parameters.AddWithValue("@CourseName", courseName);
                    cmd.ExecuteNonQuery();

                deleteQuery = "DELETE FROM courses WHERE course_name=@CourseName";
                SqlCommand cmd2 = new SqlCommand(deleteQuery, con);
                cmd2.Parameters.AddWithValue("@CourseName", courseName);
                cmd2.ExecuteNonQuery();
                con.Close();
                
            }
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_course.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin.aspx");
    }
}
