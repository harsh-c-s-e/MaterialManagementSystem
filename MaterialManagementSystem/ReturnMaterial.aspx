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
        .navbar{
    position:fixed;
    width:100%;
    top:0;
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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <div>
            <h2>Return Material</h2>
            <asp:Label ID="lblSearch" runat="server" Text="Enter Gate Pass ID:"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search"  />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="GatePass_id,S_No" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="gridview">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="GatePass_id" HeaderText="GatePass ID" ReadOnly="True" SortExpression="GatePass_id" />
                    <asp:BoundField DataField="S_No" HeaderText="S No" ReadOnly="True" SortExpression="S No" />
                    <asp:BoundField DataField="Material_description" ReadOnly="True" HeaderText="Material Description" SortExpression="Material_description" />
                    <asp:BoundField DataField="Qty_of_material" ReadOnly="True" HeaderText="Qty Issued" SortExpression="Qty_of_material" />
                    <asp:BoundField DataField="Return_type" ReadOnly="True" HeaderText="Return Type" SortExpression="Return_type" />
                    <asp:BoundField DataField="Reason_for_issue" ReadOnly="True" HeaderText="Reason for Issue" SortExpression="Reason_for_issue" />
                    <asp:CheckBoxField DataField="isReturn" HeaderText="Returned" SortExpression="isReturn" />
                    <asp:BoundField DataField="Qty_of_return" HeaderText="Qty of return" SortExpression="Qty_of_return" />
                    <asp:TemplateField HeaderText="Return Date" SortExpression="ReturnDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReturnDate", "{0:d}") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReturnDate", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Recieved_by" HeaderText="Recieved by" SortExpression="Recieved_by" />
                    <asp:TemplateField HeaderText="Remaining Qty">
                        <ItemTemplate>
                            <%# Eval("Qty_of_material") != DBNull.Value && Eval("Qty_of_return") != DBNull.Value ? Convert.ToInt32(Eval("Qty_of_material")) - Convert.ToInt32(Eval("Qty_of_return")) : Convert.ToInt32(Eval("Qty_of_material"))  %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db1ConnectionString3 %>" DeleteCommand="DELETE FROM [Material_description1] WHERE [GatePass_id] = @original_GatePass_id AND [S_No] = @original_S_No AND [Material_description] = @original_Material_description AND [Qty_of_material] = @original_Qty_of_material AND [Return_type] = @original_Return_type AND (([Reason_for_issue] = @original_Reason_for_issue) OR ([Reason_for_issue] IS NULL AND @original_Reason_for_issue IS NULL)) AND (([isReturn] = @original_isReturn) OR ([isReturn] IS NULL AND @original_isReturn IS NULL)) AND (([Qty_of_return] = @original_Qty_of_return) OR ([Qty_of_return] IS NULL AND @original_Qty_of_return IS NULL)) AND (([ReturnDate] = @original_ReturnDate) OR ([ReturnDate] IS NULL AND @original_ReturnDate IS NULL)) AND (([Recieved_by] = @original_Recieved_by) OR ([Recieved_by] IS NULL AND @original_Recieved_by IS NULL)) AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL))" InsertCommand="INSERT INTO [Material_description1] ([GatePass_id], [S_No], [Material_description], [Qty_of_material], [Return_type], [Reason_for_issue], [isReturn], [Qty_of_return], [ReturnDate], [Recieved_by], [EmployeeID]) VALUES (@GatePass_id, @S_No, @Material_description, @Qty_of_material, @Return_type, @Reason_for_issue, @isReturn, @Qty_of_return, @ReturnDate, @Recieved_by, @EmployeeID)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:db1ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [Material_description1] WHERE ([GatePass_id] = @GatePass_id) AND ([Return_type]='Returnable') ORDER BY [GatePass_id]" UpdateCommand="UPDATE [Material_description1] SET [isReturn] = @isReturn, [Qty_of_return] = @Qty_of_return, [ReturnDate] = @ReturnDate, [Recieved_by] = @Recieved_by  WHERE [GatePass_id] = @original_GatePass_id AND [S_No] = @original_S_No AND [Material_description] = @original_Material_description AND [Qty_of_material] = @original_Qty_of_material AND [Return_type] = @original_Return_type AND (([Reason_for_issue] = @original_Reason_for_issue) OR ([Reason_for_issue] IS NULL AND @original_Reason_for_issue IS NULL)) AND (([isReturn] = @original_isReturn) OR ([isReturn] IS NULL AND @original_isReturn IS NULL)) AND (([Qty_of_return] = @original_Qty_of_return) OR ([Qty_of_return] IS NULL AND @original_Qty_of_return IS NULL)) AND (([ReturnDate] = @original_ReturnDate) OR ([ReturnDate] IS NULL AND @original_ReturnDate IS NULL)) AND (([Recieved_by] = @original_Recieved_by) OR ([Recieved_by] IS NULL AND @original_Recieved_by IS NULL)) AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_GatePass_id" Type="String" />
                    <asp:Parameter Name="original_S_No" Type="Int32" />
                    <asp:Parameter Name="original_Material_description" Type="String" />
                    <asp:Parameter Name="original_Qty_of_material" Type="Int32" />
                    <asp:Parameter Name="original_Return_type" Type="String" />
                    <asp:Parameter Name="original_Reason_for_issue" Type="String" />
                    <asp:Parameter Name="original_isReturn" Type="Boolean" />
                    <asp:Parameter Name="original_Qty_of_return" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_ReturnDate" Type="DateTime"  />
                    <asp:Parameter Name="original_Recieved_by" Type="String" />
                    <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="GatePass_id" Type="String" />
                    <asp:Parameter Name="S_No" Type="Int32" />
                    <asp:Parameter Name="Material_description" Type="String" />
                    <asp:Parameter Name="Qty_of_material" Type="Int32" />
                    <asp:Parameter Name="Return_type" Type="String" />
                    <asp:Parameter Name="Reason_for_issue" Type="String" />
                    <asp:Parameter Name="isReturn" Type="Boolean" />
                    <asp:Parameter Name="Qty_of_return" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ReturnDate" Type="DateTime"  />
                    <asp:Parameter Name="Recieved_by" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="GatePass_id" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Material_description" Type="String" />
                    <asp:Parameter Name="Qty_of_material" Type="Int32" />
                    <asp:Parameter Name="Return_type" Type="String" />
                    <asp:Parameter Name="Reason_for_issue" Type="String" />
                    <asp:Parameter Name="isReturn" Type="Boolean" />
                    <asp:Parameter Name="Qty_of_return" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ReturnDate" />
                    <asp:Parameter Name="Recieved_by" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="original_GatePass_id" Type="String" />
                    <asp:Parameter Name="original_S_No" Type="Int32" />
                    <asp:Parameter Name="original_Material_description" Type="String" />
                    <asp:Parameter Name="original_Qty_of_material" Type="Int32" />
                    <asp:Parameter Name="original_Return_type" Type="String" />
                    <asp:Parameter Name="original_Reason_for_issue" Type="String" />
                    <asp:Parameter Name="original_isReturn" Type="Boolean" />
                    <asp:Parameter Name="original_Qty_of_return" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_ReturnDate" />
                    <asp:Parameter Name="original_Recieved_by" Type="String" />
                    <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            
        </div>
    </form>
</body>
</html>
