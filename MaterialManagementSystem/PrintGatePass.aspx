<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintGatePass.aspx.cs" Inherits="MaterialManagementSystem.PrintGatePass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Gate Pass</title>
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
        .gatepass-container {
            width: 1100px;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 20px;
            background-color:#F2F5FF;
        }
        .gatepass-header {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .gatepass-table {
            width: 100%;
            border-collapse: collapse;
        }
        .gatepass-table th, .gatepass-table td {
            border: 1px solid #000;
            padding: 5px;
            text-align: left;
        }
        .gatepass-footer {
            margin-top: 20px;
            text-align:center;
        }
        .gatepass-footer div {
            margin-bottom: 10px;
        }
        #date{
            position:absolute;
            right:250px;
            top:150px;
            display:inline;

        }
        .navbar{
    position:fixed;
    width:100%;
    top:0;
}
        .print-button-container {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        function printPage() {
            window.print();
        }
    </script>
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
            <a class="text-dark bg-warning nav-item nav-link" href="SearchGatePass.aspx">Print Gatepass</a>
            <a class="text-dark nav-item nav-link" href="Report.aspx">Report</a>
            <a class="text-dark nav-item nav-link disabled" href="ReturnMaterial.aspx">Return material</a>
          </div>
        </div>
      </nav>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <div class="gatepass-container">
            <div class="gatepass-header">
                <asp:Image ID="Image1" runat="server" ImageUrl="./logo/ntpclogo.jpg" Height="86px" Width="199px" />
                <br />
                NTPC Ltd.<br />
                SINGRAULI SUPER THERMAL POWER STATION<br />
                SHAKTINAGAR<br />
                MATERIAL EXIT GATE PASS
            </div>
            <div id="date" style="text-align:right">
                Ref. No: <asp:Label ID="lblRefNo" runat="server" Text=""></asp:Label><br />
                Date: <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            </div>
            <div class="gatepass-table">
            
                    <asp:GridView ID="gvMaterials" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="S_No" HeaderText="S. No." />
                            <asp:BoundField DataField="Vehical_Reg_No" HeaderText="Vehicle Reg. No" />
                            <asp:BoundField DataField="Material_description" HeaderText="Material Description" />
                            <asp:BoundField DataField="Qty_of_material" HeaderText="Qty" />
                            <asp:BoundField DataField="Owner" HeaderText="Owner" />
                            <asp:BoundField DataField="Issuing_Department" HeaderText="Name of Issuing Dept./agency" />
                            <asp:BoundField DataField="From_address" HeaderText="FROM" />
                            <asp:BoundField DataField="To_address" HeaderText="TO" />
                            <asp:BoundField DataField="Reason_for_issue" HeaderText="Reason for Issue" />
                            <asp:BoundField DataField="Return_type" HeaderText="Returnable / Non-Returnable" />
                        </Columns>
                    </asp:GridView>
             
                </div>
            <div class="gatepass-footer">
                <p style="display:inline">Issued by ____________________</p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p style="display:inline">Approved by ____________________</p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p style="display:inline">Security Guard ____________________</p>
                <br />
                <p style="display:inline">Signature ____________________</p>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p style="display:inline">Signature ____________________</p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p style="display:inline">Signature ____________________</p>
                <br />
                <p style="display:inline">Stamp ____________________</p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <p style="display:inline">Received By ____________________</p>
                <br />
                
            </div>
        </div>
        <div class="print-button-container">
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="printPage(); return false;" />
        </div>
    </form>
</body>
</html>
