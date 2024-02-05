<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_code_registration.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Registratioon</title>
</head>
<body>
        <style>
        /* Style for the GridView */
        #GridView1 {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #GridView1 th, #GridView1 td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        #GridView1 th {
            background-color: #3e70bd;
            color: white;
        }
        #GridView1 tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        #GridView1 tr:hover {
            background-color: #ddd;
        }
        /* Style for the selected row */
        #GridView1 tr.selected {
            background-color: #ffc107;
        }
        /* Style for the CheckBox */
        #GridView1 input[type=checkbox] {
            transform: scale(1.5);
        }
        /* Style for the form */
        form {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px #ccc;
        }
        /* Style for the page title */
        h1 {
            color: #3e70bd;
            text-align: center;
            margin-bottom: 20px;
        }
        /* Style for the submit button */
        input[type=submit] {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #3e70bd;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 27px;
        }
        input[type=submit]:hover {
            background-color: #2a5298;
        }
        .button-container {
  display: flex;
  justify-content: center;
}

.button {
  background-color: #4CAF50; /* Green background */
  border: none; /* Remove border */
  color: white; /* White text */
  padding: 12px 24px; /* Some padding */
  font-size: 16px; /* Set a font size */
  cursor: pointer; /* Change mouse cursor to pointer */
}

/* Change the background color of the button on hover */
.button:hover {
  background-color: #3e8e41;
}
    </style>
    <script>
        window.onload = function () {
            var checkboxes = document.querySelectorAll('#GridView1 input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].addEventListener('change', function () {
                    if (this.checked) {
                        this.parentNode.parentNode.classList.add('selected');
                    } else {
                        this.parentNode.parentNode.classList.remove('selected');
                    }
                });
            }
        };
    </script>
    <script>
        window.onload = function () {
            var checkboxes = document.querySelectorAll('#GridView1 input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].addEventListener('change', function () {
                    var selectedCheckboxes = document.querySelectorAll('#GridView1 input[type="checkbox"]:checked');
                    if (selectedCheckboxes.length > 6) {
                        this.checked = false;
                        alert("You can select only up to 6 courses");
                    } else {
                        if (this.checked) {
                            this.parentNode.parentNode.classList.add('selected');
                        } else {
                            this.parentNode.parentNode.classList.remove('selected');
                        }
                    }
                });
            }
        };
    </script>
    <form id="form1" runat="server">
        <div>
            <h1>Courses</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                      <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                    <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                    <asp:BoundField DataField="credit_hrs" HeaderText="Credit Hours" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
    </form>
</body>

</html>
