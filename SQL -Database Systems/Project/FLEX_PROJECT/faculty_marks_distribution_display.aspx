<%@ Page Language="C#" AutoEventWireup="true" CodeFile="faculty_marks_distribution_display.aspx.cs" Inherits="flex_marks_distribution_display" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <style>
    body {
    font-family: Arial, sans-serif;
    font-size: 16px;
    background-color: #F2F2F2;
}

.container {
    max-width: 960px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h1 {
    font-size: 36px;
    font-weight: bold;
    color: #3F51B5;
    margin-top: 0;
    text-align: center;
    text-decoration: underline;
}

label {
    display: block;
    font-size: 18px;
    margin-bottom: 10px;
    color: #3F51B5;
}

select {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    margin-bottom: 20px;
    border: 2px solid #3F51B5;
    border-radius: 5px;
    box-sizing: border-box;
}

.btn {
    display: block;
    background-color: #3F51B5;
    color: #fff;
    text-transform: uppercase;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 18px;
    margin: 0 auto;
}

.btn:hover {
    background-color: #ff6600;
    color: #fff;
}

    </style>
    <form id="form1" runat="server">
        <div class="container">
        
        <label for="ddlSection">Select a Section:</label>
        <asp:DropDownList ID="ddlSection" runat="server" DataSourceID="SqlDataSource1" DataTextField="Section" DataValueField="Section" AutoPostBack="True">
        </asp:DropDownList>

        <br /><br />

        <label for="ddlCourse">Select a Course:</label>
        <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="SqlDataSource2" DataTextField="Course_Name" DataValueField="Course_Name">
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString2 %>" SelectCommand="
SELECT DISTINCT Section 
FROM allocated_courses WHERE teacher_name=@Faculty_Name;
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="None" Name="Faculty_Name" SessionField="Faculty_Name" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString2 %>" SelectCommand="
SELECT allocated_courses.course_Name FROM allocated_courses join courses c on c.course_Name=allocated_courses.course_Name where teacher_name=@Faculty_Name AND Section=@Section;
">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="None" Name="Faculty_Name" SessionField="Faculty_Name" />
                <asp:ControlParameter ControlID="ddlSection" Name="Section" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="Button1" class="btn" runat="server" OnClick="Button1_Click1" Text="Button" />
            </div>
    </form>
</body>
</html>