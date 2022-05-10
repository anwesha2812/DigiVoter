<%-- 
    Document   : index
    Created on : 18-Dec-2021, 12:43:33 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style-homepage.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Home | DigiVoter</title>
    
    </head>
    <body>
         <header>
        <nav class="navbar">
            <ul>
                <li class="nav-left"><a href="#" id="dv">DigiVoter</a></li>
                <li class="nav-left"><a href="About-us.html">About</a></li>
                <li class="nav-left"><a href="Contact-us.html">Contact Us</a></li>
                <li class="nav-left"><a href="service.html">Benefits</a></li>
                
                <li class ="nav-right"><a href="login-main.jsp">Login</a></li>
                <li class ="nav-right"><a href="register-main.jsp">Register </a></li>
                
            </ul>
        </nav>
    </header>
    <div class="font">
            <div class="ellipse1"></div>
            <div class="ellipse2"></div>
            <div class="ellipse3"></div>
            <div class="ellipse4"></div>
            <div class="ellipse5"></div>
            <div class="ellipse6"></div>
            <div id="login-status">
                ${status}
            </div>
    <div>
        <img src="fontchange.png" id="logo" alt="logo">
       <p class="line">An Online Voting System</p>
    </div>
    </div>
    </body>
</html>
