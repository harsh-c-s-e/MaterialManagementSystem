<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MaterialManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" >

    </script>
    <script>
        $(document).ready(function () {
            $('#cbshowpassword').click(function () {
                $('#txtpassword').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>
    <style>
        .imgDiv {
          /*border: 5px outset red;*/
          /*background-color: lightblue;*/
          text-align: center;
          margin-left : auto;
          margin-right : auto;
          width:130px;
          height:100px;
          fill:Background;
        }
        .maindiv{
            text-align:center;
        }
        .auto-style{
            background-image:url("./logo/loginbackground2.jpg");
            /*height: 50%;*/
        }
    </style>
</head>
<body class="auto-style">
    <form id="form1" runat="server">
        <div>
            <h1 style="text-align: center">
                Welcome to Material Management System
            </h1>
        </div>
        <div class="imgDiv">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" AlternateText="Login page" GenerateEmptyAlternateText="True" Height="80px" ImageUrl="https://tse1.mm.bing.net/th?id=OIP.fio1nXsUCvmMVKmVqHO0cgHaHa&amp;pid=Api&amp;P=0&amp;h=180" Width="133px" />
            </div>
        <br />
        <div class="maindiv">
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        <asp:TextBox ID="txtusername" runat="server" style="margin-left: 73px" Width="209px"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtpassword" runat="server" style="margin-left: 75px" Width="212px" TextMode="Password"  pattern="(?=.*[a-z])(?=.*[A-Z]).{5,}"  required title=".A lowercase letter .A uppercase letter .Minimum 5 characters" ></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="cbshowpassword" runat="server" OnCheckedChanged="cbshowpassword_CheckedChanged" Text="Show password" />
        </p>
        <p>
            <asp:Button ID="btnclear" runat="server" Text="Clear" Width="124px" OnClick="btnclear_Click" />
            <asp:Button ID="btnlogin" runat="server"  style="margin-left: 35px" Text="Login" Width="206px" OnClick="btnlogin_Click" />
        </p>
        <p>
            &nbsp;</p>
        </div>

    </form>
</body>
</html>
