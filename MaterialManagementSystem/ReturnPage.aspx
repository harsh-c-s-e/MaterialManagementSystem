<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnPage.aspx.cs" Inherits="MaterialManagementSystem.ReturnPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
    .gridview {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
    }
    body {
        padding-top: 60px;
    }
    @media (max-width: 979px) {
        body {
            padding-top: 0px;
        }
    }
    .navbar {
        position: fixed;
        width: 100%;
        top: 0;
    }
    .gridview th {
        background-color: #4CAF50;
        color: white;
        text-align: left;
        padding: 10px;
    }
    .gridview td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    .gridview tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .gridview tr:hover {
        background-color: #F2F5FF;
    }
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
            <a class="text-dark nav-item nav-link" href="Report.aspx">Report</a>
            <a class="text-dark bg-warning nav-item nav-link disabled" href="ReturnMaterial.aspx">Return material</a>
        </div>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7H0wgU9KJ8fQ3l5Dh5vh6lg7t" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <div>
            <label for="txtGatePassId">Enter GatePass ID:</label>
            <asp:TextBox ID="txtGatePassId" runat="server"></asp:TextBox>
            <asp:Button ID="btnLoadMaterials" runat="server" Text="Load Materials" OnClick="btnLoadMaterials_Click" />
        </div>
        <asp:Repeater ID="rptMaterials" runat="server">
            <ItemTemplate>
                <div class="material-item">
                    <h3>Material Description: <%# Eval("Material_description") %></h3>
                    <p>S.No: <%# Eval("S_No") %></p>
                    <p>Quantity of Material: <%# Eval("Qty_of_material") %></p>
                    <p>Remaining Quantity: <%# Eval("RemainingQty") %></p>
                    <p>Qty Already Returned: <%# Eval("QtyAlreadyReturned") %></p>

                    <asp:HiddenField ID="hfGatePassId" runat="server" Value='<%# Eval("GatePass_id") %>' />
                    <asp:HiddenField ID="hfSNo" runat="server" Value='<%# Eval("S_No") %>' />

                    <label for="txtQtyOfReturn">Quantity of Return:</label>
                    <asp:TextBox ID="txtQtyOfReturn" runat="server" Text='<%# Eval("Qty_of_return") %>' /><br />

                    <label for="txtReturnDate">Return Date:</label>
                    <asp:TextBox ID="txtReturnDate" runat="server" Text='<%# Eval("ReturnDate", "{0:yyyy-MM-dd}") %>' /><br />

                    <label for="txtReceivedBy">Received By:</label>
                    <asp:TextBox ID="txtReceivedBy" runat="server" Text='<%# Eval("Recieved_by") %>' /><br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Button ID="btnUpdateAll" runat="server" Text="Update All" OnClick="btnUpdateAll_Click" />
    
    </form>
</body>
</html>
