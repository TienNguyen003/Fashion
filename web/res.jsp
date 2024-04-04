<%-- 
    Document   : res.jsp
    Created on : Sep 17, 2023, 4:00:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Azalea - Registration</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="images/favicon.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="assetResgister/css/style.css">
    </head>

    <body>

        <div class="wrapper">
            <div class="inner">
                <img src="assetResgister/images/image-1.png" alt="" class="image-1">
                <form action="LogResController" method="POST">
                    <h3>New Account</h3>                    
                    <div class="form-holder active">
                        <input type="text" placeholder="Username" class="form-control" name="txtUserName">
                    </div>
                    <div class="form-holder">
                        <input type="text" placeholder="E-mail" class="form-control" name="txtEmail">
                    </div>
                    <div class="form-holder">
                        <input type="password" placeholder="Password" class="form-control" style="font-size: 15px;" name="txtPass">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" checked> I agree all statement in <a href="#">Terms & Conditions</a>
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="form-login">
                        <button type="submit" name="action" value="Register">Sign up</button>
                        <p style="margin-bottom: 10px">Already Have account? <a href="login.jsp">Login</a> or <a href="index.jsp">Home</a></p>
                    </div>
                    <% if (request.getAttribute("errorRes") != null)
                            out.print(request.getAttribute("errorRes"));%>                    
                </form>
                <img src="assetResgister/images/image-2.png" alt="" class="image-2">
            </div>
        </div>
    </body>
</html>
