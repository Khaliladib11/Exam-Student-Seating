<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Student_Seating.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <style>
        body{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        
    }
    .registerbox{
       width: 600px;
       height: 440px;
       background: #0A4A7D;
       color: #fff;
       top: 50%;
       left: 50%;
       position: absolute;
       transform: translate(-50%,-50%);
       padding: 60px 30px;
       border-radius: 20px;
    }
    .logo{
      width: 100px;
      height: 100px;
      border-radius: 50%;
      position: absolute;
      top: -50px;
      left: calc(50% - 50px);
    }
    h1{
        margin: 0;
        padding: 0 0 20px;
        text-align: center;
        font-size: 22px;
    }
    .registerbox p{
        margin: 0;
        padding: 0;
        font-weight: bold;
    }
    .registerbox input{
        margin-bottom: 20px;
        width: 100%;
    }
    .registerbox input[type="text"], input[type="password"]
    {
        border: none;
        border-bottom: 1px solid #fff;
        background: transparent;
        outline: none;
        height: 40px;
        color: #fff;
        font-size: 16px;
    }
    .registerbox input[type="submit"]{
        border: none;
        outline: none;
        height: 40px;
        background: #fb2525;
        color: #fff;
        font-size: 18px;
        border-radius: 10px;
    }
    .registerbox input[type="submit"]:hover{
        cursor: pointer;
        background: #ffc107;
        color: #000;
    }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 19%;
            height: 23px;
        }
        .auto-style3 {
            width: 20%;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            height: 52px;
        }
        .auto-style6 {
            height: 15px;
        }
    </style>
</head>
<body>
    <div class="registerbox">
        <img src="Resources/avatar.png"alt="" class="logo">
        <h1>Register Here</h1>
        <form id="form1" runat="server">
           
            
           
            <table class="auto-style1">
                <tr>
                    <td style = "font-size:22px; vertical-align:middle" colspan="2">Fisrt Name:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2">
                        <asp:TextBox ID="fisrtName_txt" runat="server" Height="25px" Width="220px" placeholder="Enter firstname"></asp:TextBox>
                    </td>
                    <td style = "text-align:center; vertical-align:middle">
                        <asp:Label ID="fname_err" runat="server" ForeColor="#CC0000" Text="Enter First Name" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style = "font-size:22px; vertical-align:middle" colspan="2">Last Name:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2">
                        <asp:TextBox ID="lastName_txt" runat="server" Height="25px" Width="220px" placeholder="Enter lastname"></asp:TextBox>
                    </td>
                    <td style = "text-align:center; vertical-align:middle">
                        <asp:Label ID="lname_err" runat="server" ForeColor="#CC0000" Text="Enter Last Name" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style = "font-size:22px;  vertical-align:middle" colspan="2">Username:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2">
                        <asp:TextBox ID="userReg_txt" runat="server" Height="25px" Width="220px"></asp:TextBox>
                    </td>
                    <td style = "text-align:center; vertical-align:middle">
                        <asp:Label ID="username_err" runat="server" ForeColor="#CC0000" Text="Enter username" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style = "font-size:22px; vertical-align:middle" colspan="2">Password:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2">
                        <asp:TextBox ID="passReg_txt" runat="server" Height="25px" Width="220px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style = "text-align:center; vertical-align:middle">
                        <asp:Label ID="password_err" runat="server" ForeColor="#CC0000" Text="Enter Password" Visible="False"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td style = "font-size:22px; vertical-align:middle" colspan="2">Confirm Password:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2">
                        <asp:TextBox ID="confirmPass_txt" runat="server" Height="25px" Width="220px" placeholder="Confirm password" TextMode="Password"></asp:TextBox>
                     </td>
                     <td style = "text-align:center; vertical-align:middle">
                         <asp:Label ID="confirmPass_err" runat="server" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
                     </td>
                </tr>
                <tr>
                    <td style = "font-size:22px; vertical-align:middle" colspan="2">Mobile:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2">
                        <asp:TextBox ID="mobile_txt" runat="server" Height="25px" Width="220px" placeholder="Enter mobile"></asp:TextBox>
                    </td>
                    <td style = "text-align:center; vertical-align:middle">&nbsp;</td>
                </tr>
                <tr>
                    <td style = "font-size:22px; vertical-align:middle" colspan="2" class="auto-style5">Email:</td>
                    <td style = "text-align:center; vertical-align:middle" colspan="2" class="auto-style5">
                        <asp:TextBox ID="email_txt" runat="server" Height="25px" Width="220px" placeholder="Enter email"></asp:TextBox>
                    </td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style5">&nbsp;</td>
                </tr>
                <tr style="height:10px">
                    <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style6" colspan="3">
                        <asp:Button ID="create_btn" runat="server" Text="Create User Account" OnClick="create_Click" />
                    </td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style6"></td>
                    
                </tr>
                 <tr>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style3"></td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style3">
                        <asp:Label ID="confirmedMsg" runat="server" ForeColor="Yellow"></asp:Label>
                    </td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style2"></td>
                    <td style = "text-align:center; vertical-align:middle" class="auto-style4"></td>
                </tr>
            </table>
           
            
           
        </form>
    </div>
</body>
</html>
