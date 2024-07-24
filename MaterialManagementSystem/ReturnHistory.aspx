<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnHistory.aspx.cs" Inherits="MaterialManagementSystem.ReturnHistory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Return History</title>
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



        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="GridView1_Sorting">
            <Columns>
                <asp:BoundField DataField="GatePass_id" HeaderText="GatePass ID" SortExpression="GatePass_id" />
                <asp:BoundField DataField="S_No" HeaderText="S.No" SortExpression="S_No" />
                <asp:BoundField DataField="Material_description" HeaderText="Material Description" SortExpression="Material_description" />
                <asp:BoundField DataField="Qty_of_material" HeaderText="Quantity of Material" SortExpression="Qty_of_material" />
                <asp:BoundField DataField="Qty_of_return" HeaderText="Quantity of Return" SortExpression="Qty_of_return" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" SortExpression="ReturnDate" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Recieved_by" HeaderText="Received By" SortExpression="Recieved_by" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
