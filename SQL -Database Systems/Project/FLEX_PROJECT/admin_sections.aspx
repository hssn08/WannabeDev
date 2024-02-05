<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sections.aspx.cs" Inherits="admin_sections" %>

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
	

	</style>
    <form id="form1" runat="server">
        <div class="dropdown">
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Home" Width="1195px" />
        <asp:DropDownList ID="ddlSection" runat="server" AutoPostBack="True" style="margin-left: 530px">
    <asp:ListItem Text="Section A" Value="A"></asp:ListItem>
    <asp:ListItem Text="Section B" Value="B"></asp:ListItem>
    <asp:ListItem Text="Section C" Value="C"></asp:ListItem>
    <asp:ListItem Text="Section D" Value="D"></asp:ListItem>
</asp:DropDownList>
            
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Student_Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowCustomPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Student_Id" HeaderText="Student_Id" ReadOnly="True" SortExpression="Student_Id" />
                <asp:BoundField DataField="Student_Name" HeaderText="Student_Name" SortExpression="Student_Name" />
                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
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
