<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="MaterialManagementSystem.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        body {
  padding-top: 60px;
}
@media (max-width: 979px) {
  body {
    padding-top: 0px;
  }
}
        .gridview {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        .gridview th {
            background-color: #F49097;
            color: white;
            text-align: left;
            padding: 10px;
        }
        .navbar{
    position:fixed;
    width:100%;
    top:0;
}
        .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .gridview tr:nth-child(even) {
            background-color: #F2F5FF;
        }

        /*.gridview tr:hover {
            background-color: #ddd;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="text-dark nav-item nav-link active" href="IssueGatepass.aspx">Issue Gatepass <span class="sr-only">(current)</span></a>
            <a class="text-dark nav-item nav-link" href="SearchGatepass.aspx">Search Gatepaass</a>
            <a class="text-dark nav-item nav-link" href="SearchGatePass.aspx">Print Gatepass</a>
            <a class="text-dark bg-warning nav-item nav-link" href="Report.aspx">Report</a>
            <a class="text-dark nav-item nav-link disabled" href="ReturnMaterial.aspx">Return material</a>
          </div>
        </div>
      </nav>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <div>
<%--            <h2>Complete Report</h2>
            <h2>Pending Materials</h2>--%>
            <asp:Button ID="Button1" runat="server" Text="Complete Report" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Pending Materials" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="GatePass_id,S_No" DataSourceID="SqlDataSource1" CssClass="gridview" Visible="False">
                <Columns>
                    <asp:BoundField DataField="GatePass_id" HeaderText="GatePass ID" ReadOnly="True" SortExpression="GatePass_id" />
                    <asp:BoundField DataField="S_No" HeaderText="S No" ReadOnly="True" SortExpression="S_No" />
                    <asp:BoundField DataField="Vehical_Reg_No" HeaderText="Vehical Reg No" SortExpression="Vehical_Reg_No" />
                    <asp:BoundField DataField="Material_description" HeaderText="Material Description" SortExpression="Material_description" />
                    <asp:BoundField DataField="Qty_of_material" HeaderText="Qty" SortExpression="Qty_of_material" />
                    <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" />
                    <asp:BoundField DataField="Issuing_Department" HeaderText="Issuing Department" SortExpression="Issuing_Department" />
                    <asp:BoundField DataField="From_address" HeaderText="From " SortExpression="From_address" />
                    <asp:BoundField DataField="To_address" HeaderText="To " SortExpression="To_address" />
                    <asp:BoundField DataField="Reason_for_issue" HeaderText="Reason for Issue" SortExpression="Reason_for_issue" />
                    <asp:BoundField DataField="Return_type" HeaderText="Return Type" SortExpression="Return_type" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" SortExpression="IssueDate" />
                    <asp:BoundField DataField="Issued_by" HeaderText="Issued by" SortExpression="Issued_by" />
                    <asp:BoundField DataField="Approved_by" HeaderText="Approved by" SortExpression="Approved_by" />
                    <asp:TemplateField HeaderText="History">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkHistory" runat="server" NavigateUrl='<%# "ReturnHistory.aspx?GatePass_id=" + Eval("GatePass_id") %>'>History</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString3 %>" SelectCommand="SELECT [D].[S_No],[D].[Material_description],[D].[Qty_of_material],[D].[Return_type],[D].[Reason_for_issue] ,[G].* FROM [Material_description1] [D] JOIN [Material_gatepass1] [G] ON [D].[Gatepass_id] = [G].[Gatepass_id] WHERE Return_type = 'Returnable' AND isReturn=0 ;"></asp:SqlDataSource>
            

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="gridview" Visible="False">
                <Columns>
                    <asp:BoundField DataField="GatePass_id" HeaderText="GatePass ID" ReadOnly="True" SortExpression="GatePass_id" />
                    <asp:BoundField DataField="S_No" HeaderText="S No" ReadOnly="True" SortExpression="S_No" />
                    <asp:BoundField DataField="Vehical_Reg_No" HeaderText="Vehical Reg No" SortExpression="Vehical_Reg_No" />
                    <asp:BoundField DataField="Material_description" HeaderText="Material Description" SortExpression="Material_description" />
                    <asp:BoundField DataField="Qty_of_material" HeaderText="Qty" SortExpression="Qty_of_material" />
                    <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" />
                    <asp:BoundField DataField="Issuing_Department" HeaderText="Issuing Department" SortExpression="Issuing_Department" />
                    <asp:BoundField DataField="From_address" HeaderText="From " SortExpression="From_address" />
                    <asp:BoundField DataField="To_address" HeaderText="To " SortExpression="To_address" />
                    <asp:BoundField DataField="Reason_for_issue" HeaderText="Reason for Issue" SortExpression="Reason_for_issue" />
                    <asp:BoundField DataField="Return_type" HeaderText="Return Type" SortExpression="Return_type" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" SortExpression="IssueDate" />
                    <asp:BoundField DataField="Issued_by" HeaderText="Issued by" SortExpression="Issued_by" />
                    <asp:BoundField DataField="Approved_by" HeaderText="Approved by" SortExpression="Approved_by" />
                    <asp:TemplateField HeaderText="History">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkHistory" runat="server" NavigateUrl='<%# "ReturnHistory.aspx?GatePass_id=" + Eval("GatePass_id") %>'>History</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                </Columns>
            </asp:GridView> 
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString3 %>" SelectCommand="SELECT [D].[S_No],[D].[Material_description],[D].[Qty_of_material],[D].[Return_type],[D].[Reason_for_issue] ,[G].* FROM [Material_description1] [D] JOIN [Material_gatepass1] [G] ON [D].[Gatepass_id] = [G].[Gatepass_id] 
ORDER BY [G].[Gatepass_id] , [D].[S_No]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
