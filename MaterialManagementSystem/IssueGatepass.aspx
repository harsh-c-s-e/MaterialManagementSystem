<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueGatepass.aspx.cs" Inherits="MaterialManagementSystem.IssueGatepass" %>

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
        #topdiv{
            text-align:center;
        }
        .bottomdiv{
            padding-left:2em;
            padding-right:2em;
            padding-top:2em;
        }
        #date{
            position:absolute;
            right:50px;
            top:150px;
            display:inline;

        }
        .navbar{
    position:absolute;
    width:100%;
    top:0;
}
        #refid{
            position:absolute;
            right:50px;
            top:100px;
            display:inline;

        }
        table, th, td {
            border: 1px solid;
        }
        th,td {
            background-color: #66CED6;
        }
        th{
            color:white;
        }


    </style>
</head>
<body style="background-color:#ddfdfd">
    <form id="form1" runat="server">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="text-dark bg-warning nav-item nav-link active" href="IssueGatepass.aspx">Issue Gatepass <span class="sr-only">(current)</span></a>
        <a class="text-dark nav-item nav-link" href="SearchGatepass.aspx">Search Gatepaass</a>
        <a class="text-dark nav-item nav-link" href="SearchGatePass.aspx">Print Gatepass</a>
        <a class="text-dark nav-item nav-link" href="Report.aspx">Report</a>
        <a class="text-dark nav-item nav-link disabled" href="ReturnMaterial.aspx">Return material</a>
          <a class="text-danger nav-item nav-link" href="Login.aspx">LogOut</a>
      </div>
    </div>
  </nav>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <div id="topdiv">
            <asp:Image ID="Image1" runat="server" ImageUrl="./logo/ntpclogo.jpg" Height="86px" Width="199px" />
            <h3>SINGRAULI SUPER THERMAL POWER STATION</h3>
            <h3>SHAKTINAGAR</h3>
            <h2>MATERIAL EXIT GATEPASS</h2>
            <div id="date">
                <h3 style="display:inline;">Date : </h3> 
                <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>

            </div>
            <div id="refid">
                <h3 style="display:inline;">Ref. No. : </h3> 
                <asp:TextBox ID="txtrefno" runat="server"></asp:TextBox>

            </div>
        </div>
        <div class="bottomdiv">
            <table style="width: 100%">
                <tr>
                    <th> <asp:Label ID="Label1" runat="server" Text="Vehicle Reg. No"></asp:Label> </th>
                    <th> <asp:Label ID="Label2" runat="server" Text="Owner"></asp:Label> </th>
                    <th> <asp:Label ID="Label3" runat="server" Text="Name of Issuing Department"></asp:Label> </th>
                    <th> <asp:Label ID="Label4" runat="server" Text="From"></asp:Label> </th>
                    <th> <asp:Label ID="Label5" runat="server" Text="To"></asp:Label> </th>
                    <th> <asp:Label ID="Label6" runat="server" Text="Issued By"></asp:Label> </th>
                    <th> <asp:Label ID="Label7" runat="server" Text="Approved By"></asp:Label> </th>
                </tr>
                <tr> 
                    <td> <asp:TextBox Style="width: 95%" ID="txtvehicle" runat="server"></asp:TextBox> </td>
                    <td> <asp:TextBox Style="width: 95%" ID="txtowner" runat="server"></asp:TextBox></td>
                    <td> <asp:TextBox Style="width: 95%" ID="txtissuingdept" runat="server" Width="232px"></asp:TextBox> </td>
                    <td> <asp:TextBox Style="width: 95%" ID="txtfrom" runat="server"></asp:TextBox> </td>
                    <td> <asp:TextBox Style="width: 95%" ID="txtto" runat="server"></asp:TextBox> </td>
                    <%--<td> <asp:TextBox Style="width: 95%" ID="txtissuedby" runat="server"></asp:TextBox> </td>--%>
                    <td>
                        <asp:DropDownList  ID="txtissuedby" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" Width="200px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:db1ConnectionString4.ProviderName %>" SelectCommand="SELECT [EmployeeID], [Name] FROM [EmployeeDetails]"></asp:SqlDataSource>
                    </td>
                    <%--<td> <asp:TextBox Style="width: 95%" ID="txtapprovedby" runat="server"></asp:TextBox> </td>--%>
                    <td>
                        <asp:DropDownList ID="txtapprovedby" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name" Width="200px"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString4 %>" SelectCommand="SELECT [EmployeeID], [Name] FROM [EmployeeDetails]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            
        </div>

        <div class="bottomdiv">

            <br />
            <asp:GridView ID="GridQualifaction" Style="width: 100%" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridQualifaction_RowDataBound">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="S No.">
            <ItemTemplate>
                <asp:Label ID="lblSerialNo" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Material description">
            <ItemTemplate>
                <asp:TextBox Style="width: 90%" ID="txtmaterialdescription" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox Style="width: 90%" ID="txtquantity" TextMode="Number" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Returnable/NonReturnable">
            <ItemTemplate>
                <asp:DropDownList ID="ddlreturntype" runat="server" style="width:90%" AutoPostBack="True">
                    <asp:ListItem>Returnable</asp:ListItem>
                    <asp:ListItem>NonReturnable</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Reason for Issue">
            <ItemTemplate>
                <asp:TextBox Style="width: 90%" ID="txtreason" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
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


        </div>
            <div style="text-align: right; padding-right:2em;">
                <asp:Button Text="Add New Row" ID="btnaddnewrow" OnClick="btnaddnewrow_Click" runat="server" />
            </div>
        <div style="text-align: center; ">
            <asp:Button ID="btnsubmit" runat="server" style="border-radius:5px; font-size:20px;" Text="Save" OnClick="btnsubmit_Click" BackColor="#FFEAEC"  Height="50px" Width="90px" ForeColor="Red" />
        </div>

    </form>
</body>
</html>
