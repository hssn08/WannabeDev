<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_course.aspx.cs" Inherits="add_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <Style>
/* Apply some basic styles to the entire page */
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

/* Style the container that holds the form */
.container {
  margin: 0 auto;
  max-width: 600px;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Style the title */
.title {
  text-align: center;
  margin-bottom: 20px;
  font-size: 36px;
  color: #333;
}

/* Style the form group labels */
.form-group label {
  display: inline-block;
  margin-bottom: 5px;
  font-weight: bold;
}

/* Style the form group inputs */
.form-group input[type="text"] {
  display: block;
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 20px;
}

/* Style the button */
.button {
  background-color: #333;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

button:hover {
  background-color: #555;
}

button:active {
  background-color: #222;
}

    </Style>
<body>
    <div class="container">
        <div class="title">
    <h1>New Course Registration</h1>
            </div>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Course ID:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Course Name:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
        <div class="form-group">
        <p>
            <asp:Label ID="Label3" runat="server" Text="Credit Hours:"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
           
        <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Semester:"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <div class="form-group">
        <p>
            <asp:Label ID="Label5" runat="server" Text="Pre-Requisite:"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <asp:Button  ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
    </form>
    </div>
</body>
</html>
