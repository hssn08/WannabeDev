<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_attendance.aspx.cs" Inherits="student_attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        #form1 {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
        }
        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }
        th {
            background-color: #0077be;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .empty {
            text-align: center;
            color: #999;
            font-style: italic;
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



    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="blue-bg">
        <h1 style="color: black;">Student Attendance</h1>
    </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Statuss" HeaderText="Statuss" SortExpression="Statuss" />
                    <asp:BoundField DataField="Course_Name" HeaderText="Course_Name" SortExpression="Course_Name" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" SelectCommand="SELECT DISTINCT [Date], [Statuss], [Course_Name] FROM [attendance] WHERE ([Student_ID] = @Student_ID)">
                <SelectParameters>
                    <asp:SessionParameter Name="Student_ID" SessionField="Student_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblNoData" runat="server" CssClass="empty" Visible="False"></asp:Label>
        </div>
    </form>
    <script>
        var gridview = document.getElementById("<%= GridView1.ClientID %>");
        if (gridview.rows.length <= 1) {
            document.getElementById("<%= lblNoData.ClientID %>").innerText = "There are no data records to display.";
            document.getElementById("<%= lblNoData.ClientID %>").style.display = "block";
            gridview.style.display = "none";
        }
    </script>
</body>
</html>