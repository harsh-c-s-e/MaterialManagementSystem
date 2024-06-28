<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnewrow.aspx.cs" Inherits="MaterialManagementSystem.addnewrow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            <asp:GridView ID="GridQualifaction" Style="width: 100%" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="S No.">
                        <ItemTemplate>
                            <asp:TextBox Style="width: 90%" ID="txtinstituteName" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Material description">
                        <ItemTemplate>
                            <asp:TextBox Style="width: 90%" ID="txtmaterialdescription" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox Style="width: 90%" ID="txtdegree" TextMode="Number" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Returnable/NonReturnable">
                        <ItemTemplate>
                            <asp:TextBox Style="width: 90%" ID="txtgrade" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Year">
                        <ItemTemplate>
                            <asp:TextBox Style="width: 90%" ID="txtyear" TextMode="Number" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

        </div>
            <div style="text-align: right">
                <asp:Button Text="Add New Row" ID="btnaddnewrow" OnClick="btnaddnewrow_Click" runat="server" />
            </div>
        <div style="text-align: center">
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" BackColor="#66FF33" />
        </div>
    </form>
</body>
</html>
