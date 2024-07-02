<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintGatePass.aspx.cs" Inherits="MaterialManagementSystem.PrintGatePass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Gate Pass</title>
    <style>
        .gatepass-container {
            width: 1100px;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 20px;
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
