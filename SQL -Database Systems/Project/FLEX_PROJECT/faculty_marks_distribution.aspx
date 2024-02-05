    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="faculty_marks_distribution.aspx.cs" Inherits="faculty_marks_distribution" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Marks Distribution</title>
    </head>

    <body>
        <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            margin: 0;
            padding: 0;
        }
        h1 {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-top: 50px;
        }
        label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 20px;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 200px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #008CBA;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #006080;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #008CBA;
            color: #fff;
            font-weight: normal;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .error-message {
            color: #ff0000;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
        <form runat="server">
            <h1>Marks Distribution</h1>
            <div>

                <label>Category:</label>
                <input type="text" name="CategoryTextBox" id="CategoryTextBox" runat="server" />
                <label>Weightage:</label>
                <input type="text" name="WeightageTextBox" id="WeightageTextBox" runat="server" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
      
            </div>
            <br />
            <div>
            </div>
            <br />
            <div>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="weightage" HeaderText="weightage" SortExpression="weightage" />
                </Columns>
            </asp:GridView>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Save" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" SelectCommand="SELECT [category], [weightage] FROM [marks_distribution] WHERE (([Section] = @Section) AND ([course_Name] = @course_Name))">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="A" Name="Section" SessionField="Section" Type="String" />
                    <asp:SessionParameter DefaultValue="A" Name="course_Name" SessionField="ddlCoursee" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" ProviderName="<%$ ConnectionStrings:FLEX_PROJECTConnectionString.ProviderName %>" SelectCommand="SELECT [course_ID], [course_Name], [Section], [category], [weightage] FROM [marks_distribution]"></asp:SqlDataSource>
        </form>
    </body>
    </html>
