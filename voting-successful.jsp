<%-- 
    Document   : voting-successful
    Created on : 02-Mar-2022, 1:24:17 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1 class = "Title">Thank You for Voting</h1>

<form action="DateChecker" class="form">
    <div class="portal">

        <button class="button" type="submit" required><strong>BACK TO STUDENT PORTAL</strong></button>
    </div>    
</form>
<style>
    body {
    background: rgb(0, 212, 255);
    background: radial-gradient(circle, rgba(0, 212, 255, 1) 0%, rgba(7, 60, 155, 1) 60%, rgba(9, 9, 121, 1) 100%);
}
.portal .button{
    position: relative;
    left:36%;
    padding: 10px;
    font-size: 25px;
    background-color: rgba(123, 234, 123);
    color: #11035b;
    text-transform: uppercase;
    border-radius: 5px;
    width: 30%; 
}
.portal .button:hover{
    background-color:#11035b;
    cursor: pointer;
    color:rgb(187, 206, 19);
}
.Title {
    position: relative;
    text-align: center;
    display: block;
    max-width: 55%;
    border-radius: 8px;
    left: 22.5%;
    height: 25%;
    margin: 15px;
    padding: 15px;
    color: #11035b;
    text-shadow: 2px 2px 8px rgb(0, 255, 255);
    font-size: 50px;
    text-transform: uppercase;
}
</style>    </body>
</html>
