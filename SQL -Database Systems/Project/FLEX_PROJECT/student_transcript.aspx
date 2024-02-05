<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_transcript.aspx.cs" Inherits="student_transcript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    /* Style for GridView */
    #GridView1 {
        font-family: Arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }
    
    #GridView1 th, #GridView1 td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    
    #GridView1 th {
        background-color: #0077be;
        color: #fff;
    }
    
    /* Style for EmptyDataText */
    .empty-data-text {
        font-style: italic;
        color: #888;
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
    <div class="blue-bg">
        <h1 style="color: black;">Student Transcript</h1>
    </div>

    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Course_Id" HeaderText="Course_Id" SortExpression="Course_Id" />
                    <asp:BoundField DataField="Course_Name" HeaderText="Course_Name" SortExpression="Course_Name" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" SelectCommand="SELECT [Course_Id], [Course_Name], [Grade] FROM [previous_courses] WHERE ([Student_Id] = @Student_Id)">
                <SelectParameters>
                    <asp:SessionParameter Name="Student_Id" SessionField="Student_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
