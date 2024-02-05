using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class add_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");
        conn.Open();
        Response.Write("Connection Open");
        SqlCommand cm;
        string course_id = TextBox1.Text;
        string course_name = TextBox2.Text;
        string credithrs = TextBox3.Text;
        string semester = TextBox4.Text;
        string prereq = TextBox5.Text;
        SqlCommand cmdd = new SqlCommand("INSERT INTO courses (course_ID, course_Name, credit_hrs,semester,pre_req) VALUES (@course_ID, @course_Name, @credit_hrs,@semester,@pre_req)", conn);
        cmdd.Parameters.AddWithValue("@course_ID", course_id);
        cmdd.Parameters.AddWithValue("@course_Name", course_name);
        cmdd.Parameters.AddWithValue("@credit_hrs", credithrs);
        cmdd.Parameters.AddWithValue("@semester", semester);
        cmdd.Parameters.AddWithValue("@pre_req", prereq);

        cmdd.ExecuteNonQuery();
        cmdd.Dispose();
    }

}