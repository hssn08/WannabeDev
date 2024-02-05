<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_course_registration.aspx.cs" Inherits="admin_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        h1 {
            color: #3e70bd;
            text-align: center;
            margin-bottom: 20px;
        }
        #GridView1 {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #GridView1 th {
            background-color: #3e70bd;
            color: white;
        }
        #GridView1 th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        #GridView1 td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        #GridView1 input[type=checkbox] {
            transform: scale(1.5);
        }
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
            margin-left: 279px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <h1>Courses</h1>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Registered_Course" HeaderText="Registered_Course" />
        <asp:BoundField DataField="Num_Students" HeaderText="Num_Students" />
    </Columns>
</asp:GridView>

        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Remove Course" Width="249px" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="ADD NEW COURSE" Width="301px" BackColor="Red" />
    </form>
   
</body>
</html>
