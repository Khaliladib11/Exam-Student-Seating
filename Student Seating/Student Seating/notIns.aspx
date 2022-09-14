<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notIns.aspx.cs" Inherits="Student_Seating.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Not Instructor</title>
    <style>
        body{
             background: #0A4A7D;
        }
        h1{
            color: white;
            margin: 200px 500px;
            font-size: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>YOU ARE NOT AN INSTRUCTOR.<asp:Button ID="goBack_btn" runat="server" Text="Go Back" Height="30px" OnClick="Button1_Click" Width="100px" />
        </h1>
    </div>
    </form>
</body>
</html>
