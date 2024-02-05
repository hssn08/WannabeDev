using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class admin_new_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");
        conn.Open();

        string query = "select max(id) from login";
        SqlCommand cmd = new SqlCommand(query, conn);

        int id = 0;
        SqlDataReader read_data = cmd.ExecuteReader();
        if (read_data.Read())
        {
            id = Convert.ToInt32(read_data[""]);
        }
        read_data.Close();
        id = id + 1;

        string username = TextBox1.Text;
        string password = TextBox2.Text;
        int user_type = 3;
        string student_name = TextBox3.Text;
        string section = TextBox4.Text;
        int semester = 1;
        string degree = TextBox6.Text;
        int batch = 22;
        string campus = TextBox8.Text;
        string dob = TextBox9.Text;
        string blood_group = TextBox10.Text;
        string gender = DropDownList1.SelectedItem.Text;
        string cnic = TextBox11.Text;
        string email = TextBox12.Text;
        string mobile_no = TextBox13.Text;
        string Address = TextBox14.Text;
        string home_contact = TextBox15.Text;
        string guardian_name = TextBox16.Text;

        SqlCommand cmdd = new SqlCommand("INSERT INTO login (id, username, password, type) VALUES (@id, @username, @password, @type)", conn);
        cmdd.Parameters.AddWithValue("@id", id);
        cmdd.Parameters.AddWithValue("@username", username);
        cmdd.Parameters.AddWithValue("@password", password);
        cmdd.Parameters.AddWithValue("@type", user_type);
        cmdd.ExecuteNonQuery();
        cmdd.Dispose();

        SqlCommand cm = new SqlCommand("INSERT INTO Students (Student_Id, UserName, Student_Name, Section, semester, Degree, Batch, Campus, DOB, Blood, Gender, CNIC, Emails, Mobile_No, Address, Home_Contact, Guardian_Name) VALUES (@Student_Id, @UserName, @Student_Name, @Section, @semester, @Degree, @Batch, @Campus, @DOB, @Blood, @Gender, @CNIC, @Emails, @Mobile_No, @Address, @Home_Contact, @Guardian_Name)", conn);
        cm.Parameters.AddWithValue("@Student_Id", id);
        cm.Parameters.AddWithValue("@UserName", username);
        cm.Parameters.AddWithValue("@Student_Name", student_name);
        cm.Parameters.AddWithValue("@Section", section);
        cm.Parameters.AddWithValue("@semester", semester);
        cm.Parameters.AddWithValue("@Degree", degree);
        cm.Parameters.AddWithValue("@Batch", batch);
        cm.Parameters.AddWithValue("@Campus", campus);
        cm.Parameters.AddWithValue("@DOB", dob);
        cm.Parameters.AddWithValue("@Blood", blood_group);
        cm.Parameters.AddWithValue("@Gender", gender);
        cm.Parameters.AddWithValue("@CNIC", cnic);
        cm.Parameters.AddWithValue("@Emails", email);
        cm.Parameters.AddWithValue("@Mobile_No", mobile_no);
        cm.Parameters.AddWithValue("@Address", Address);
        cm.Parameters.AddWithValue("@Home_Contact", home_contact);
        cm.Parameters.AddWithValue("@Guardian_Name", guardian_name);
        cm.ExecuteNonQuery();
        cm.Dispose();

        conn.Close();
    }

}