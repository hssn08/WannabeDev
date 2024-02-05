<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_marks.aspx.cs" Inherits="student_marks" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Marks</title>
<style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            background-color: #f1f1f1;
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-top: 50px;
        }
        
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        .no-data {
            text-align: center;
            color: #888;
            padding: 50px;
        }

        /* Added styling */
        .blue-bg {
            background-color: #0077be;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 30px;
            font-size: 20px;
        }

        /* Changed styling */
        th {
            color: #0077be;
            font-weight: bold;
            border-bottom: 2px solid #ddd;
        }

        /* Added styling */
        .btn {
            background-color: #0077be;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
            font-size: 16px;
        }

        /* Changed styling */
        tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        /* Added styling */
        .footer {
            background-color: #0077be;
            color: #fff;
            padding: 20px;
            text-align: center;
            margin-top: 50px;
            font-size: 16px;
        }
    </style>

</head>
<body>
    <div class="blue-bg">
        <h1>Student Marks</h1>
    </div>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="course_ID" HeaderText="Course ID" SortExpression="course_ID" />
                    <asp:BoundField DataField="course_Name" HeaderText="Course Name" SortExpression="course_Name" />
                    <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                    <asp:BoundField DataField="marks" HeaderText="Marks" SortExpression="marks" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString4 %>" SelectCommand="SELECT [course_ID], [course_Name], [category], [marks] FROM [marks] WHERE ([Student_ID] = @Student_ID)">
                <SelectParameters>
                    <asp:SessionParameter Name="Student_ID" SessionField="Student_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" SelectCommand="SELECT [course_ID], [course_Name], [category], [marks] FROM [marks] WHERE ([Student_ID] = @Student_ID)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="a" Name="Student_ID" SessionField="Student_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>