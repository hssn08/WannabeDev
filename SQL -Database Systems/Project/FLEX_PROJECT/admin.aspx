<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
	<title>Admin Page</title>
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
			background-color: #EDEDED;
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
			max-width: 1200px;
			margin: 0 auto;
		}
.university-info {
  background-color: #F2F2F2;
  border-left: 5px solid #3F51B5;
  padding-left: 15px;
}

.personal-info {
  background-color: #EAEAEA;
  border-left: 5px solid #0077B6;
  padding-left: 15px;
}

.contact-info {
  background-color: #F9F9F9;
  border-left: 5px solid #D83B01;
  padding-left: 15px;
}

.family-info {
  background-color: #F2F2F2;
  border-left: 5px solid #6D4C41;
  padding-left: 15px;
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

        * {
            padding: 0;
            box-sizing: border-box;
            margin-left: 0px;
            margin-right: 0;
            margin-top: 23;
        }

        </style>
	<header>
		<div class="logo">
			<img src="logo.png" alt="University Logo">
		</div>
		<div class="user-profile">
			<p>Welcome, <%= Session["Admin_Name"] %></p>
			
			<img src="admin-avatar.png" alt="Admin Avatar">
		</div>
	</header>
<nav>
    <asp:Button ID="Button1" class="btn" runat="server" OnClick="Button1_Click" Text="Register Courses" Width="160px" Height="60px" style="margin-top: 10px;" />
    <asp:Button ID="Button2" class="btn" runat="server" Height="60px" OnClick="Button2_Click" Text="Sections" Width="160px" style="margin-top: 10px;" />
    <asp:Button ID="Button3" class="btn" runat="server" OnClick="Button3_Click" Text="New Student" Width="160px" Height="60px" style="margin-top: 10px;" />
    <asp:Button ID="Button4" class="btn" runat="server" OnClick="Button4_Click" Text="New Faculty" Width="160px" Height="60px" style="margin-top: 10px;" />
    <asp:Button ID="Button5" class="btn" runat="server" OnClick="Button5_Click" Text="Course Allocation" Height="60px" Width="160px" style="margin-top: 10px;" />
</nav>


	<main>
<section class="university-info">
  <h2>University Information</h2>
  <p>Admin ID: <%= Session["Admin_Id"]%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Campus: <%= Session["Campus"]%></p>
  
</section>


		<section>
			<h2>Personal Information</h2>
		    <p>Name : <%= Session["Admin_Name"]%></p>
			<p>Father's Name : <%= Session["Guardian_Name"]%></p>
			<p>Blood Group : <%= Session["Blood"]%> </p>
		    <p>Gender : <%= Session["Gender"]%></p>
			<p>CNIC : <%= Session["CNIC"]%></p>
			<p>DOB : <%= Session["DOB"]%> </p>
		    <p>Mobile No : 0<%= Session["Mobile_No"]%></p>
			<p>Emails : <%= Session["Emails"]%> </p>
  
		</section>

		<section>
			<h2>Contact Information</h2>
			 <p>Address: <%= Session["Address"]%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home Contact: 0<%= Session["Home_Contact"]%></p>
  
		</section>

	</main>

	<footer>
		<p>&copy; 2023 University. All rights reserved.</p>
	</footer>
    </form>
</body>
</html>