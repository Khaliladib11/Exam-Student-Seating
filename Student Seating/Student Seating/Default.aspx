<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Student_Seating.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
    body{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        
    }
    .loginbox{
       width: 320px;
       height: 300px;
       background: #4991D0;
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
    .loginbox p{
        margin: 0;
        padding: 0;
        font-weight: bold;
    }
    .loginbox input{
        margin-bottom: 20px;
        width: 100%;
    }
    .loginbox input[type="text"], input[type="password"]
    {
        border: none;
        border-bottom: 1px solid #fff;
        background: transparent;
        outline: none;
        height: 40px;
        color: #fff;
        font-size: 16px;
    }
    .loginbox input[type="submit"]{
        border: none;
        outline: none;
        height: 40px;
        background: #fb2525;
        color: #fff;
        font-size: 18px;
        border-radius: 20px;
    }
    .loginbox input[type="submit"]:hover{
        cursor: pointer;
        background: #ffc107;
        color: #000;
    }
    .register{
        color: #fb2525;
    }
    .register:hover{ 
        color: #ffc107;
    }
    </style>

</head>
<body>
    <div class="loginbox">
        <img src="Resources/IUL-logo.png"alt="" class="logo">
        <h1>Login Here</h1>
        <form id="form1" runat="server">
            <p>Username:</p>
            <input type="text" name="username" placeholder="Enter Username" id="username_txt"  runat="server" />
            <p>Password:</p>
            <input type="password" name="password" placeholder="Enter Password" id="password_txt" runat="server"/>&nbsp;
            <asp:Button ID="login_btn" runat="server"  Text="Login" OnClick="login_btn_Click" />
           
            
            <asp:Label ID="errorMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            
            <a href="Registration.aspx" class="register">Or create account here.</a>
        </form>
        
    </div>
    </body>
</html>
