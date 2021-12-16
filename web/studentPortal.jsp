<%-- 
    Document   : studentPortal
    Created on : 05-Dec-2021, 1:39:10 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student | DigiVoter</title>
    <link rel="stylesheet" href="style-studentPortal.css">
</head>
<body>
   <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
   %>
  <header>
    <nav class="navbar">
        <ul>
            <li class="nav-left"><a href="#">Home</a></li>
            <li class="nav-left"><a href="About-us.html">About</a></li>
            <li class="nav-left"><a href="Contact-us.html">Contact Us</a></li>
            <li class="nav-left"><a href="#">Services</a></li>
            
            
            <li class ="nav-right"><a href="">Welcome ${fname}</a></li>
            <li class ="nav-right"><a href="Logout">Logout</a></li>
            </div>
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
<div>

<img src="fontchange.png" id="logo-dv"alt="">
<div class="content">
  <h1 id="h1">Student Council Positions</h1>
  <div class="cards">
    <div class="card">
      <h2 class="card-title">General Secretary</h2>
      <img src="GS.png" alt="">
      <p class="card-desc">He/She is the head of Student Council.<br>He/She is the liaison officer between students and management. He/She will bring students grievances in Colleges to the managements.
      </p>
    </div>
    <div class="card">
      <h2 class="card-title">Cultural Secretary</h2>
      <img src="CS.png" alt="">
      <p class="card-desc">They look after organizing various events in the cultural domain for the students thereby providing a platform for students to showcase their talent and also ensuring student engagement apart from their academic routine.<br>The Cultural Secretary is also responsible towards participation of students in inter collegiate events.</p>
    </div>
    <div class="card">
      <h2 class="card-title">Sports Secretary</h2>
      <img src="SS.png" alt="">
      <p class="card-desc">They look after organizing training, coaching and education in sports for everybody so that they can learn to keep themselves physically fit.<br>The Sports Secretary also work to enhance the interest of participants in the field of sports.<BR>They also conduct intra as well as inter oriented college sports events.</p>
    </div>
    <div class="card">
      <h2 class="card-title">Joint Cultural Secretary</h2>
      <img src="JCS.png" alt="">
      <p class="card-desc">They work under Cultural Secretary and assist in organizing cultural fests and activities.<br>They coordinate the activities of various student run clubs such as music club, dance club, etc.  </p>
    </div>
  
    <div class="card">
      <h2 class="card-title">Joint Sports Secretary</h2>
      <img src="JSS.png" alt="">
      <p class="card-desc">They work under Sports Secretary and create zeal among students and faculty members towards sports.<br>They look after proper maintenance of sports accessories and arranging the venues for sports events.</p>
    </div>
    <div class="card">
      <h2 class="card-title">Ladies Representative</h2>
      <img src="LR.png" alt="">
      <p class="card-desc"> The Ladies Representative is a bridge between all the females and student council ,staff and management.She works for protecting the interests of female students and staff and creates a safe environment for female students during college fests and different programmes. </p>
    </div>
    <div class="card">
      <h2 class="card-title">Joint Ladies Representative</h2>
      <img src="JLR.png" alt="">
      <p class="card-desc">The Joint Ladies Representative Inspires peers in coming forward and ensuring equal opportunities in every field be it sports, cultural events or day to day activities.She with the Ladies Representative advocates for women’s interests at college.</p>
    </div>
  </div>
  </div>
  <div class="container">
    <div class="Rules">
      <div class="box">
        <div class="info">
          
          <h3>Interested Applicants Keep in Mind!</h3>
          <p>1. Required documents:
            <br>-A clear image of yourself
            <br>-A CV stating your achievements and relevant curricular background<br><br>
            2. Your application will be reviewed by a Validator, who will then choose to accept or decline your candidacy.<br><br>
            3. Note that the information you provide during application will be a part of your online campaigning on the website.
          </p>
        </div>
      </div>
    </div>
  <br><br><br><br><br><br>
  <div class="notice">
    <span ><a href="#"></a></span>
  </div>
    
</div>
 
<% 
    if(session.getAttribute("status")=="Invalid Password")
    {
    
    }




%>
  
  
  

</body>
</html>
