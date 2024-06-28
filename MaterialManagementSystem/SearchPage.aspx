<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="MaterialManagementSystem.SearchPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Search Records</h2>
            <asp:Label ID="Label1" runat="server" Text="Search:"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <asp:GridView ID="GridViewResults" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="S_No" HeaderText="Serial No" />
                    <asp:BoundField DataField="Material_description" HeaderText="Material Description" />
                    <asp:BoundField DataField="Qty_of_material" HeaderText="Quantity" />
                    <asp:BoundField DataField="Return_type" HeaderText="Return Type" />
                    <asp:BoundField DataField="Reason_for_issue" HeaderText="Reason for Issue" />
                    <asp:BoundField DataField="GatePass_id" HeaderText="Gate Pass ID" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
