<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mainpage.aspx.cs" Inherits="MaterialManagementSystem.Mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *{
    color: white;
}
        .aspnethidden{
            display:none;
        }
.navbar{
    background-color: #0f1111;
    height: 50px;
    /*position: relative;*/
}
.button{
    text-align: center;
    margin-right: 100px;
    margin-top: 10px;
    background-color: black;
    padding: 4px;
    border:
    
    
}
#Button1{
    position:absolute;
    top:5px;
    left:10px;
}
#Button2{
    position:absolute;
    top:5px;
    left:300px;
}
#Button3{
    position:absolute;
    top:5px;
    left:600px;
}
#Button4{
    position:absolute;
    top:5px;
    left:900px;
}
#logout{
    position: absolute;
    right: 10px;
    top: 3px;
    display: block;
    margin-left: auto;
    margin-right: 0;

    background-color: red;

}

        /*.auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">

            <asp:Button class="button" ID="Button1" runat="server" Text="Issue Gatepass" BackColor="Black" PostBackUrl="~/IssueGatepass.aspx" />
            <asp:Button class="button" ID="Button2" runat="server" Text="Print Gatepass" BackColor="Black" />
            <asp:Button class="button" ID="Button3" runat="server" Text="Search Report" BackColor="Black" />
            <asp:Button class="button" ID="Button4" runat="server" Text="Return Material" BackColor="Black" />
            <asp:Button class="button" ID="logout" runat="server" Text="Logout" PostBackUrl="~/Login.aspx"   />


        </div>
        
            </form>
</body>
</html>
