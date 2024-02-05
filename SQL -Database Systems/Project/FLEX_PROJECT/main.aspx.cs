
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Student : System.Web.UI.Page
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
        string un = textbox1.Text;
        string pass = textbox2.Text;
        string query = "SELECT * FROM login WHERE username = '" + un + "' AND password = '" + pass + "'";
        cm = new SqlCommand(query, conn);

        SqlDataReader res = cm.ExecuteReader();



        if (res.HasRows)
        {

            res.Close();
            cm.Dispose();

            query = "SELECT login.id,user_type.users FROM login join user_type on user_type.id = login.type WHERE username = '" + un + "' AND password = '" + pass + "'";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            

            if (reader.Read())
            {

                Session["username"] = un;
                int userId = reader.GetInt32(0);
                Session["user_id"] = userId;
                if (String.Equals(reader["users"].ToString(), "admin", StringComparison.OrdinalIgnoreCase))
                {

                    cmd.Dispose();
                    reader.Close();
                    query = "SELECT a.Admin_Id,a.UserName,a.Admin_Name,a.Campus,a.DOB,a.Blood,a.Gender,a.CNIC,a.Emails,a.Mobile_No,a.Address,a.Home_Contact,a.Guardian_Name FROM Admins a WHERE UserName = '" + un + "'";
                    SqlCommand cmd1 = new SqlCommand(query, conn);

                    SqlDataReader read_data = cmd1.ExecuteReader();
                    if (read_data.Read())
                    {
                        Session["Admin_Id"] = read_data["Admin_Id"];
                        Session["UserName"] = read_data["UserName"];
                        Session["Admin_Name"] = read_data["Admin_Name"];
                        Session["Campus"] = read_data["Campus"];
                        Session["DOB"] = read_data["DOB"];
                        Session["Gender"] = read_data["Gender"];
                        Session["Blood"] = read_data["Blood"];
                        Session["CNIC"] = read_data["CNIC"];
                        Session["Emails"] = read_data["Emails"];
                        Session["Mobile_No"] = read_data["Mobile_No"];
                        Session["Address"] = read_data["Address"];
                        Session["Home_Contact"] = read_data["Home_Contact"];
                        Session["Guardian_Name"] = read_data["Guardian_Name"];
                    }
                    read_data.Close();
                    cmd1.Dispose();
                    Response.Redirect("admin.aspx"); 
                }
                else if (String.Equals(reader["users"].ToString(), "faculty", StringComparison.OrdinalIgnoreCase))
                {



                    cmd.Dispose();
                    reader.Close();
                    query = "SELECT a.Faculty_Id,a.UserName,a.Faculty_Name,a.Campus,a.DOB,a.Blood,a.Gender,a.CNIC,a.Emails,a.Mobile_No,a.Address FROM faculty a WHERE UserName = '" + un + "'";
                    SqlCommand cmd1 = new SqlCommand(query, conn);

                    SqlDataReader read_data = cmd1.ExecuteReader();
                    if (read_data.Read())
                    {
                        Session["Faculty_Id"] = read_data["Faculty_Id"];
                        Session["UserName"] = read_data["UserName"];
                        Session["Faculty_Name"] = read_data["Faculty_Name"];
                        Session["Campus"] = read_data["Campus"];
                        Session["DOB"] = read_data["DOB"];
                        Session["Gender"] = read_data["Gender"];
                        Session["Blood"] = read_data["Blood"];
                        Session["CNIC"] = read_data["CNIC"];
                        Session["Emails"] = read_data["Emails"];
                        Session["Mobile_No"] = read_data["Mobile_No"];
                        Session["Address"] = read_data["Address"];
                    }
                    read_data.Close();
                    cmd1.Dispose();
                    Response.Redirect("faculty.aspx");
                }
                else if (String.Equals(reader["users"].ToString(), "student", StringComparison.OrdinalIgnoreCase))
                {
                    cmd.Dispose();
                    reader.Close();
                    query = "SELECT s.Student_Id,s.UserName,s.Student_Name,s.Section,s.semester,s.Degree,s.Batch,s.Campus,s.DOB,s.Blood,s.Gender,s.CNIC,s.Emails,s.Mobile_No,s.Address,s.Home_Contact,s.Guardian_Name FROM Students s WHERE Student_Id = '" + Session["user_id"] + "'";
                    SqlCommand cmd1 = new SqlCommand(query, conn);

                    SqlDataReader read_data = cmd1.ExecuteReader();
                    if (read_data.Read())
                    {
                        Session["Student_Id"] = read_data["Student_Id"];
                        Session["UserName"] = read_data["UserName"];
                        Session["Student_Name"] = read_data["Student_Name"];
                        Session["Section"] = read_data["Section"];
                        Session["semester"] = read_data["semester"];
                        Session["Degree"] = read_data["Degree"];
                        Session["Batch"] = read_data["Batch"];
                        Session["Campus"] = read_data["Campus"];
                        Session["DOB"] = read_data["DOB"];
                        Session["Gender"] = read_data["Gender"];
                        Session["Blood"] = read_data["Blood"];
                        Session["CNIC"] = read_data["CNIC"];
                        Session["Emails"] = read_data["Emails"];
                        Session["Mobile_No"] = read_data["Mobile_No"];
                        Session["Address"] = read_data["Address"];
                        Session["Home_Contact"] = read_data["Home_Contact"];
                        Session["Guardian_Name"] = read_data["Guardian_Name"];
                    }
                    read_data.Close();
                    cmd1.Dispose();
                    Response.Redirect("student.aspx");
                }
            }
        }

        Console.WriteLine("After method call, value of res : {0}", res);
        cm.Dispose();
        conn.Close();
        //this.Close();
    }
}