<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_course_allocation.aspx.cs" Inherits="admin_course_allocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}
		h1 {
			text-align: center;
			margin-top: 50px;
			font-size: 36px;
			color: #333;
		}
		table {
			width: 100%;
			margin: 50px auto;
			border-collapse: collapse;
			background-color: #fff;
			box-shadow: 0 0 20px rgba(0,0,0,0.2);
		}
		th, td {
			padding: 15px;
			text-align: center;
			border: 1px solid #ccc;
			vertical-align: middle;
		}
		th {
			background-color: #333;
			color: #fff;
			font-size: 20px;
			text-transform: uppercase;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
	/* Style for the dropdown */
    .dropdown select {
        border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #f2f2f2;
            color: #333;
            cursor: pointer;
    }
    
    /* Style for the dropdown arrow */
    .dropdown select::-ms-expand {
        display: none;
    }
    .dropdown select::before {
        content: "\25BC";
        position: absolute;
        top: 50%;
        right: 8px;
        transform: translateY(-50%);
        color: #999;
    }
    
    /* Style for the dropdown when it's open */
    .dropdown select:focus {
        outline: none;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
    }

	</style>
    <form id="form1" runat="server">
        <div class="dropdown">
            <asp:Button ID="Button2" runat="server" BackColor="#3399FF" BorderColor="#FFFF66" Height="58px" OnClick="Button2_Click" Text="Home" Width="1487px" />
        <asp:DropDownList ID="ddlSection" class="dropdown" name="section" runat="server" AutoPostBack="True" style="margin-left: 530px" DataSourceID="SqlDataSource2" DataTextField="section" DataValueField="section" BackColor="#000066" Height="47px" Width="136px">
 
</asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString3 %>" SelectCommand="
select distinct s.section from students s join registered_courses rc on s.Student_Id =rc.Student_id  "></asp:SqlDataSource>
            
        </div>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display." AllowCustomPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="Registered_Course" HeaderText="Registered_Course" SortExpression="Registered_Course" />
        <asp:TemplateField HeaderText="Faculty">
            <ItemTemplate>
                <asp:DropDownList ID="ddlFaculty" class="dropdown" runat="server" DataSourceID="SqlDataSource4" DataTextField="Faculty_Name" DataValueField="Faculty_Name"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString4 %>" SelectCommand="SELECT [Faculty_Name] FROM [Faculty]"></asp:SqlDataSource>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Button" Width="1103px" />
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString4 %>" SelectCommand="
SELECT DISTINCT rc.Registered_Course
FROM registered_courses rc
JOIN students s ON s.Student_Id = rc.Student_Id
WHERE s.Section = @Section">
  <SelectParameters>
    <asp:ControlParameter ControlID="ddlSection" Name="Section" PropertyName="SelectedValue" Type="String" />
  </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:FLEX_PROJECTConnectionString %>" 
    DeleteCommand="DELETE FROM [Students] WHERE [Student_Id] = @Student_Id" 
    InsertCommand="INSERT INTO [Students] ([Student_Id], [Student_Name], [Section]) VALUES (@Student_Id, @Student_Name, @Section)" 
    SelectCommand="SELECT [Student_Id], [Student_Name], [Section] FROM [Students] WHERE [Section] = @Section ORDER BY [Student_Id]" 
    UpdateCommand="UPDATE [Students] SET [Student_Name] = @Student_Name, [Section] = @Section WHERE [Student_Id] = @Student_Id">
    <DeleteParameters>
        <asp:Parameter Name="Student_Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Student_Id" Type="Int32" />
        <asp:Parameter Name="Student_Name" Type="String" />
        <asp:Parameter Name="Section" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Student_Name" Type="String" />
        <asp:Parameter Name="Section" Type="String" />
        <asp:Parameter Name="Student_Id" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlSection" Name="Section" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

    </form>
</body>
</html>