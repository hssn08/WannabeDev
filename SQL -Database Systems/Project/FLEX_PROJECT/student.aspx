<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="student" %>

<!DOCTYPE html>
<html>
<head>
	<title>Student Page</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form id="form1" runat="server">
	<style>
	body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}

		header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			background-color: #3F51B5;
			color: #FFF;
			padding: 10px 20px;
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			z-index: 1;
		}

		.logo img {
			height: 50px;
		}

		.user-profile {
			display: flex;
			align-items: center;
		}

		.user-profile img {
			height: 30px;
			margin-left: 10px;
			border-radius: 50%;
		}
nav {
			background-color: lightgrey;
			padding: 10px 20px;
			box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
			position: fixed;
			top: 60px;
			left: 0;
			bottom: 0;
			width: 200px;
			z-index: 1;
			overflow: auto;

		}

		.nav-container {
			display: flex;
			align-items: center;
			justify-content: space-between;
			max-width: 1200px;
			margin: 0 auto;
		}

		.logo-container {
			display: flex;
			align-items: center;
		}


		nav ul {
			margin: 0;
			padding: 0;
			list-style: none;
			display: flex;
			flex-direction: column;
		}

		nav ul li {
			margin-right: 0;
			margin-bottom: 10px;
		}

		nav ul li a {
			color: #333;
			text-decoration: none;
			font-weight: bold;
			font-size: 16px;
			display: block;
			padding: 10px 20px;
			border-radius: 10px;
			transition: all 0.3s ease 0s;
			border: 2px solid transparent;
		}

		nav ul li a:hover {
			color: #3F51B5;
			background-color: #EDEDED;
			border-color: #3F51B5;
		}

		main {
			padding: 100px 20px 20px 220px;
		
			margin: 0 auto;
		}
.university-info {
background-color: #F2F2F2;
border-left: 5px solid #3F51B5;
padding: 15px; 
font-family: Arial, sans-serif;
font-size: 16px; 
line-height: 1.5; 
color: #333; 
box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
transition: all 0.3s ease;
}

.university-info:hover {
background-color: #fff; 
box-shadow: 0 4px 6px rgba(0,0,0,0.1); 
transform: translateY(-2px);
}
		section {
  margin-bottom: 20px;
  border: 1px solid #DDD;
  padding: 20px;
  background-color: #F8F8F8;
  height: calc(100% - 72px);
}
	
		section h2 {
			margin-top: 0;
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 20px;
			color: #333;
		}

footer {
	background-color: #3F51B5;
	color: #FFF;
	padding: 10px 20px;
	text-align: center;
	margin-top: 20px;
}

	 .btn {
  display: inline-block;
  background-color: #0077b6; /* Changed the background color */
  color: #fff;
  text-transform: uppercase;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease 0s;
  font-size: 11px; /* Added a font size */
}

	 .btn:hover {
  background-color: grey; /* Changed the background color on hover */
}
        * {
            padding: 0;
            box-sizing: border-box;
            margin-left: 0px;
            margin-right: 0;
            margin-top: 0;
        }

        </style>
	<header>
		<div class="logo">
			<img src="logo.png" alt="University Logo">
		</div>
		<div class="user-profile">
			<p>Welcome, <%= Session["Student_Name"] %></p>
			
			<img src="admin-avatar.png" alt="Admin Avatar">
		</div>
	</header>
	
	<nav>
		<ul>
			<asp:Button ID="HOME_B" class="btn" runat="server" Text="Home" OnClick="Button1_Click"  Width="160px" Height="60px" style="margin-top: 10px;" />
            
                <asp:Button ID="Button2" class="btn" runat="server" OnClick="Button2_Click" Text="COURSE REGISTRATION"  Width="160px" Height="60px" style="margin-top: 10px;" />
          
			    <asp:Button ID="Button1" class="btn" runat="server" OnClick="Button1_Click1" Text="COURSE FEEDBACK"  Width="160px" Height="60px" style="margin-top: 10px;" />
		  
			
		</ul>
	    <asp:Button ID="Button3" class="btn" runat="server" OnClick="Button3_Click" Text="Attendance"  Width="160px" Height="60px" style="margin-top: 10px;" />
        <asp:Button ID="Button4" class="btn" runat="server" OnClick="Button4_Click" Text="Transcript"  Width="160px" Height="60px" style="margin-top: 10px;" />
        <asp:Button ID="Button5" class="btn" runat="server" OnClick="Button5_Click" Text="Marks"  Width="160px" Height="60px" style="margin-top: 10px;" />
	</nav>

	<main>
<section class="university-info">
  <h2>University Information</h2>
  <p>Roll No: <%= Session["Student_Id"]%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Degree: <%= Session["Degree"]%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Batch: <%= Session["Batch"]%> </p>
  <p>Section: <%= Session["Section"]%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Campus: <%= Session["Campus"]%></p>
  
</section>


		<section class="university-info">
			<h2>Personal Information</h2>
		    <p>Name : <%= Session["Student_Name"]%></p>
			<p>Father's Name : <%= Session["Guardian_Name"]%></p>
			<p>Blood Group : <%= Session["Blood"]%> </p>
		    <p>Gender : <%= Session["Gender"]%></p>
			<p>CNIC : <%= Session["CNIC"]%></p>
			<p>DOB : <%= Session["DOB"]%> </p>
		    <p>Mobile No : 0<%= Session["Mobile_No"]%></p>
			<p>Emails : <%= Session["Emails"]%> </p>
  
		</section>

		<section class="university-info">
			<h2>Contact Information</h2>
			 <p>Address: <%= Session["Address"]%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home Contact: 0<%= Session["Home_Contact"]%></p>
  
		</section>

		
<section class="university-info">
	<h2>Attendance</h2>
	<p>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="1087px">
            <series>
                <asp:Series ChartType="Bar" Name="Series1" XValueMember="course_name" YValueMembers="Column1" Color="yellow">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
    </p>
</section>

		<section class="university-info">
			<h2>Semester GPA</h2>
			<p>
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="1082px">
                    <series>
                        <asp:Series Name="Series1" XValueMember="semester" YValueMembers="num_passed_courses" Color="yellow">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString2 %>" SelectCommand="SELECT courses.semester, COUNT(*) AS num_passed_courses
FROM Students
JOIN previous_courses ON Students.Student_Id = previous_courses.Student_Id AND previous_courses.Grade != 'F'
join courses on courses.course_ID=previous_courses.Course_Id
WHERE Students.Student_Name = @Student_Name
GROUP BY courses.semester;">
                    <SelectParameters>
                        <asp:SessionParameter Name="Student_Name" SessionField="Student_Name" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
		</section>
	</main>

	<footer>
		<p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" SelectCommand="select course_name,count(*)
From attendance
where Statuss='P' AND Student_ID=@Student_Id
group by Course_Name">
                <SelectParameters>
                    <asp:SessionParameter Name="Student_Id" SessionField="Student_Id" />
                </SelectParameters>
            </asp:SqlDataSource>
            &copy; 2023 University. All rights reserved.</p>
	</footer>
    </form>
</body>
</html>

