using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class faculty_feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query = "SELECT Teacher_Name, CONVERT(INT, AVG(q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18+q19+q20)) AS avg_marks FROM feedback WHERE Teacher_Name = '" + Session["Faculty_Name"] + "' group by teacher_name";

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-CI8NOOP\\SQLEXPRESS01;Initial Catalog=FLEX_PROJECT;Integrated Security=True");

            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                int avgMarks = Convert.ToInt32(dt.Rows[0]["avg_marks"]);
                lblAvgMarks.Text = avgMarks.ToString() + "%";
            }

            conn.Close();
        }
    }

}