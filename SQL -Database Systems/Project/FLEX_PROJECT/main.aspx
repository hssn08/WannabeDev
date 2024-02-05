<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="Student" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <style>

        * {
            margin: 0 0 0 0px;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-left:100px;
        }

        .login-content {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px;
            width: 66%;
            background-color: #fff;
            //border-radius: 5px;
            //box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .img {
            width: 50%;
            
        }

        .img img {
            width: 80%;
           
        }

        .login-content form {
            width: 100%;
        }

        .input-div {
            position: relative;
            display: grid;
            grid-template-columns: 7% 93%;
            margin: 20px 0;
            padding: 5px 0;
            border-bottom: 2px solid #d9d9d9;
        }

        .input-div.one {
            margin-top: 0;
        }

        .i {
            color: #d9d9d9;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .i i {
            font-size: 18px;
        }

        .input-div > div {
            position: relative;
            height: 45px;
            top: 0px;
            left: -38px;
        }

        .input-div > div > h5 {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 18px;
        }

        .input-div > div > input {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border: none;
            outline: none;
            background: none;
            font-size: 18px;
            padding: 0 5px;
        }

        .input-div > div > input:valid {
            box-shadow: none;
            border-bottom: 2px solid #ff9900;
        }
        .btn {
display: inline-block;
background-color: #ff9900;
color: #fff;
text-transform: uppercase;
padding: 10px 20px;
border: none;
border-radius: 25px;
cursor: pointer;
transition: all 0.3s ease 0s;
}

.btn:hover {
background-color: #fff;
color: #ff9900;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
    </style>

    <div class="container">
        <div class="login-content">
            <form runat="server">
                <h2 class="title"><img src="FLEX.PNG" style="width: 88%; height: 362px;"></h2>
                <h2 class="title">Sign In</h2>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="div">
                            
                     <asp:TextBox ID="textbox1" class="input" placeholder="Username" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="input-div pass">
                    <div class="i"> 
                            <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <label for="password"></label>
                        <asp:TextBox ID="textbox2" type="password" class="input" placeholder="Password" runat="server"></asp:TextBox>
                    </div>
                </div>
               
                 <asp:Button ID="Button1" class="btn" runat="server" Text="Login" OnClick="Button1_Click" />
                 <a href="#">Forgot Password?</a>
            </form>
        </div>
        <img src="bg.jpg" style="width: 51%; height: 797px;">&nbsp;
    </div>

    <div class="container">
    </div>
   
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <script src="main.js"></script>
</body>
</html>
