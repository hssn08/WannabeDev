<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_new_student.aspx.cs" Inherits="admin_new_registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    



 <style>
        body {
            background-color: white;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
        }
        form {
            background-color: #008CBA;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            display: block;
            text-align: center;
            margin: 50px 50px 50px 50px;
           
        }
  h2 {
  text-align: center;
  color: orange;
  font-size: 44px;
  text-decoration: underline;
}




        label {
            display: block;
            margin-bottom: 10px;
            color: #ffffff;
            font-size: 18px;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"],
        textarea {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }
        .my-button {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #ffa500;
            /* set the background color to blue */
            color: #fff;
            /* set the text color to white */
            padding: 10px 20px;
            /* add some padding to the button */
            border-radius: 5px;
         margin-left: 0px;
     }
        
        .personal-info {
            background-color: #444444;
            color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            float: left;
            width: 100%;
            vertical-align: top;
            margin-top: 30px;
            height: auto;
        }
        .personal-info label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .personal-info input[type="text"],
        .personal-info input[type="email"],
        .personal-info input[type="tel"],
        .personal-info textarea {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }
    </style>
	</head>
	 <body>
		 
				  <div class="personal-info">
		 <form id="form1" runat="server">
			<h2>Student Registration Form</h2>
		 
      <label for="student_id">Username:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

         <label for="username">Pasword:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="student_name">Student Name:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="section">Section:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="degree">Degree:<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
         </label>
         <br>

      <label for="campus">Campus:<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>
				  
		 <label for="dob">Date of Birth:<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="blood">Blood Group:<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
         </label>&nbsp;<br>

      <label for="gender">Gender:
          <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" style="margin-left: 0px" Width="123px">
              <asp:ListItem Text="M" Value="M"></asp:ListItem>
    <asp:ListItem Text="F" Value="F"></asp:ListItem>
    <asp:ListItem Text="Other" Value="O"></asp:ListItem>
         </asp:DropDownList>
         </label>
&nbsp;<br>

      <label for="cnic">CNIC:<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="email">Email:<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="mobile">Mobile No:<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="address">Address:<asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="home_contact">Home Contact:<asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
         </label>
&nbsp;<br>

      <label for="guardian_name">Guardian Name:<asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
         </label>&nbsp;<br>
			

      &nbsp;<asp:Button class="my-button" ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" Width="183px" />
   

     </form>
					  	</div>
  </body>
    </html>