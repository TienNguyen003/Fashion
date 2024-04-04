<%-- 
    Document   : login
    Created on : Sep 17, 2023, 4:09:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Azalea - Forgot Pass</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="icon" type="image/png" href="images/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="cssLogin/main.css">
        <link rel="stylesheet" type="text/css" href="cssLogin/util.css">
    </head>
    <body style="background-color: #666666;">

        <div class="limiter" style="float: left">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-more" style="background-image: url('images/bg-01.jpg');">
                    </div>

                    <form class="login100-form validate-form" action="LogResController" method="POST" onsubmit="noReload">
                        <span class="login100-form-title p-b-43">
                            Forgot Password
                        </span>


                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="txtUserName">
                            <span class="focus-input100"></span>
                            <span class="label-input100">UserName</span>
                        </div>


                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="text" name="txtEmail">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Email</span>
                        </div>
                        <div class="container-login100-form-btn" style="margin-top: 40px">
                            <button class="login100-form-btn" name="action" value="Forgot">
                                Forgot
                            </button>
                        </div>
                        <div class="text-center p-t-46 p-b-20">
                            <a class="txt2" href="login.jsp">
                                or Login
                            </a>
                            <a style="margin-left: 20px" class="txt2" href="index.jsp">
                                or Home
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/mainLogin.js"></script>        
    </body>
    <script>
        funcion noReload(){
            event.preventDefault();
        }
    </script>
</html>
