<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnMaterial.aspx.cs" Inherits="MaterialManagementSystem.ReturnMaterial" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Return Material</title>
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
                    <a class="text-danger nav-item nav-link" href="Login.aspx">LogOut</a>
                </div>
            </div>
        </nav>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7H0wgU9KJ8fQ3l5Dh5vh6lg7t" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <div>
            <h2>Return Material</h2>
            <asp:Label ID="lblSearch" runat="server" Text="Enter Gate Pass ID:"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <br />
            <br />



            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="GatePass_id,S_No" DataSourceID="SqlDataSource1" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="GatePass_id" HeaderText="GatePass_id" InsertVisible="False" ReadOnly="True" SortExpression="GatePass_id" />
                    <asp:BoundField DataField="S_No" HeaderText="S_No" ReadOnly="True" SortExpression="S_No" />
                    <asp:BoundField DataField="Material_description" ReadOnly="True" HeaderText="Material_description" SortExpression="Material_description" />
                    <asp:BoundField DataField="Qty_of_material" ReadOnly="True" HeaderText="Qty Issued" SortExpression="Qty_of_material" />
                    <asp:BoundField DataField="QtyAlreadyReturned" ReadOnly="True" HeaderText="QtyAlreadyReturned" SortExpression="QtyAlreadyReturned" />
                    <asp:TemplateField HeaderText="Remaining Qty">
                        <ItemTemplate>
                            <%# Eval("Qty_of_material") != DBNull.Value && Eval("QtyAlreadyReturned") != DBNull.Value ? Convert.ToInt32(Eval("Qty_of_material")) - Convert.ToInt32(Eval("QtyAlreadyReturned")) : Convert.ToInt32(Eval("Qty_of_material"))  %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                
                </Columns>
            </asp:GridView>
            <br />
            <br />

            <asp:Label ID="lblserial" runat="server" Text="Enter Serial No:"></asp:Label>
            <asp:TextBox ID="txtserial" runat="server"></asp:TextBox>
            <asp:Button ID="btnserial" runat="server" Text="Search" OnClick="btnserial_Click" />
            <br />
            <br />




            <asp:GridView ID="GridView2" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="GatePass_id,S_No,Return_No" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="GatePass_id" HeaderText="GatePass_id" ReadOnly="True" SortExpression="GatePass_id" />
                    <asp:BoundField DataField="S_No" HeaderText="S_No" ReadOnly="True" SortExpression="S_No" />
                    <asp:BoundField DataField="Return_No" HeaderText="Return_No" ReadOnly="True" SortExpression="Return_No" />
                    <asp:BoundField DataField="Qty_of_return" HeaderText="Qty_of_return" SortExpression="Qty_of_return" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" />
                    <asp:BoundField DataField="Recieved_by" HeaderText="Recieved_by" SortExpression="Recieved_by" />
                </Columns>
            </asp:GridView>


            <br />
            <div>

            </div>
            <asp:Table ID="Table1" runat="server" Visible="false" CssClass="gridview">

                <asp:TableRow>
                    <asp:TableCell>Gatepass ID</asp:TableCell>
                    <asp:TableCell>Serial No</asp:TableCell>
                    <asp:TableCell>Return No</asp:TableCell>
                    <asp:TableCell>Qty of Return</asp:TableCell>
                    <asp:TableCell>Return date</asp:TableCell>
                    <asp:TableCell>Recieved by</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox11" runat="server" TextMode="Date"></asp:TextBox></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></asp:TableCell>
                    
                    <asp:TableCell>
                        <asp:Button ID="btninsert" runat="server" Text="Return" OnClick="btninsert_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <br />

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString3 %>" SelectCommand="SELECT * FROM [ReturnHistory] WHERE (([S_No] = @S_No) AND ([GatePass_id] = @GatePass_id))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtserial" Name="S_No" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtSearch" Name="GatePass_id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:db1ConnectionString3 %>" 
    SelectCommand="SELECT D.*, ISNULL(SUM(R.Qty_of_return), 0) AS QtyAlreadyReturned FROM Material_description1 D LEFT JOIN ReturnHistory R ON D.GatePass_id = R.GatePass_id AND D.S_No = R.S_No WHERE D.GatePass_id = @GatePass_id AND D.Return_type = 'Returnable' GROUP BY D.GatePass_id, D.S_No, D.Material_description, D.Qty_of_material, D.Return_type, D.Reason_for_issue, D.isReturn, D.Qty_of_return ORDER BY D.S_No"
    UpdateCommand="UPDATE [Material_description1] SET [Qty_of_return] = @Qty_of_return WHERE [GatePass_id] = @GatePass_id AND [S_No] = @S_No"
    InsertCommand="INSERT INTO [ReturnHistory] ([GatePass_id], [S_No], [Qty_of_return], [ReturnDate], [ReceivedBy]) VALUES (@GatePass_id, @S_No, @Qty_of_return, @ReturnDate, @ReceivedBy)">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtSearch" Name="GatePass_id" PropertyName="Text" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Qty_of_return" Type="Int32" />
        <asp:Parameter Name="GatePass_id" Type="Int32" />
        <asp:Parameter Name="S_No" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Qty_of_return" Type="Int32" />
        <asp:Parameter Name="GatePass_id" Type="Int32" />
        <asp:Parameter Name="S_No" Type="Int32" />
        <asp:Parameter Name="ReturnDate" Type="String" />
        <asp:Parameter Name="ReceivedBy" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>


    </form>
</body>
</html>


