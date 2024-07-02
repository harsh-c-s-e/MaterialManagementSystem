<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchGatePass.aspx.cs" Inherits="MaterialManagementSystem.SearchGatePass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Gate Pass</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Search Gate Pass</h2>
            <asp:Label ID="lblSearch" runat="server" Text="Enter Gate Pass ID:"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <asp:Button ID="btnDirectPrint" runat="server" Text="Print Gatepass" OnClick="btnDirectPrint_Click" />
            <br /><br />
            <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="False" >
                <Columns>
                    <asp:BoundField DataField="GatePass_id" HeaderText="Gate Pass ID" />
                    <asp:BoundField DataField="Vehical_Reg_No" HeaderText="Vehicle Reg. No" />
                    <asp:BoundField DataField="Material_description" HeaderText="Material Description" />
                    <asp:BoundField DataField="Qty_of_material" HeaderText="Qty" />
                    <asp:BoundField DataField="Owner" HeaderText="Owner" />
                    <asp:BoundField DataField="Issuing_Department" HeaderText="Name of Issuing Dept./Agency" />
                    <asp:BoundField DataField="From_address" HeaderText="FROM" />
                    <asp:BoundField DataField="To_address" HeaderText="TO" />
                    <asp:BoundField DataField="Reason_for_issue" HeaderText="Reason for Issue" />
                    <asp:BoundField DataField="Return_type" HeaderText="Returnable / Non-Returnable" />
                    <%--<asp:ButtonField CommandName="Print" Text="Print" />--%>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
