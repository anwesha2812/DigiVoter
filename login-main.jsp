<%-- 
    Document   : login-main.jsp
    Created on : 21-Nov-2021, 12:38:23 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="loginpage.css" type="text/css"/>
  <link rel="stylesheet" href="style-login.css" type="text/css">


  <title>Login | DigiVoter</title>
  
</head>
<body>
    <div class="ellipse1"></div>
        <div class="ellipse2"></div>
        <div class="ellipse3" ></div>
        <div class="ellipse4"></div>
        <div class="ellipse5"></div>
        <div class="ellipse6"></div>
  <div class="login-wrapper">
    <form action="LoginServlet_main" class="form" method="post">
      <img src="Voter.png" id ="Img1">
      <h2>Login</h2>
      <h5> ${status} </h5>
      <div class="input-group">
        <input type="email" name="email" id="loginUser" required>
        <label for="loginUser">Email ID</label>
      </div>
      <div class="input-group">
        <input type="password" name="password" id="loginPassword" required>
        <label for="loginPassword">Password</label>
      </div>
      <p id="Status"> </p>
      <label>Enter Captcha:</label>
      <div class="form-row">
        <div class="form-group col-md-6">
          <input type="text"  class="form-control" readonly id="capt">
        </div>
        <div class="form-group col-md-6">
          <input type="text" name="captcha" class="form-control-2" id="textinput">
        </div>
      </div>
      <input id="invalidcap" name="invalidcap" value="hello" for="submit" hidden>  
      <h6>Click to view Captcha - > <img src="reficon.png" id = "Img2" width="20px" onclick="cap()" alt="refresh"></h6>
      <output id="capvalid" name="capvalid" >  </output>
      <input type="submit" onclick = "validcap()" id="submit" value="Login" name="login" class="submit-btn"> 
     
      <a href="#forgot-pw" class="forgot-pw">Forgot Password?</a>
      <p class="form__text">
        <a class="form__link" href="register-main.jsp" id="linkCreateAccount">Don't have an account? Create account</a>
      </p>
      </form>     
    
       
    <div id="forgot-pw">
      <form action="" class="form">
        <a href="#" class="close">&times;</a>
        <h2>Reset Password</h2>
        <div class="input-group">
          <input type="email" name="email" id="email" required>
          <label for="email">Email</label>
        </div>
  
        <input type="submit" value="Submit" class="submit-btn">
      </form>
    </div>
  </div>
  <script src="captcha.js"></script>
</body>
</html>

