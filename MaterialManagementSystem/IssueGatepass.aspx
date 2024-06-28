<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueGatepass.aspx.cs" Inherits="MaterialManagementSystem.IssueGatepass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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
                    <td> <asp:TextBox Style="width: 95%" ID="txtissuedby" runat="server"></asp:TextBox> </td>
                    <td> <asp:TextBox Style="width: 95%" ID="txtapprovedby" runat="server"></asp:TextBox> </td>
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
