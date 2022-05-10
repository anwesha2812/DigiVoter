<%-- 
    Document   : resultdisplay
    Created on : 03-Apr-2022, 1:39:12 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result | DigiVoter</title>
        <link rel="stylesheet" href="style-result.css">
    </head>
    <body>
         <style>
                        .congratulations span {
    position: absolute;
    bottom:80%;
    right:3%;
    width: 100%;
    height: 100%;
    margin-left: -35px;
    line-height: 530px;
    /* height*2 - font-size */
    text-align: center;
    transform-origin: top center;
    color: #2C365E;

}
        body{
    background: hsla(207, 100%, 94%, 1);
    background: linear-gradient(90deg, hsla(207, 100%, 94%, 1) 23%, hsla(207, 100%, 87%, 1) 100%);
    background: -moz-linear-gradient(90deg, hsla(207, 100%, 94%, 1) 23%, hsla(207, 100%, 87%, 1) 100%);
    background: -webkit-linear-gradient(90deg, hsla(207, 100%, 94%, 1) 23%, hsla(207, 100%, 87%, 1) 100%);
    background-repeat: no-repeat;
    background-attachment: fixed;
    }
    .navbar{
    background-color: #2C365E;
    border-radius: 30px;
    
}
.navbar ul{
    overflow: auto;
}
 /*.navbar li{
    float:left;
    list-style: none; 
    margin: 13px 20px;
    
} */
.navbar li a{
    padding: 3px 3px;
    text-decoration: none;
    color: white;
}
.navbar li a:hover{
    color: red
}
.search{
    float: right;
    color: white;
    padding: 12px 75px;
}
.navbar input{
    border: 2px solid #2C365E;
    border-radius: 14px;
    padding: 3px 17px;
    width: 129px;
}
.nav-left{
    float:left;
    list-style: none; 
    margin: 13px 20px;
}
.nav-right
{
    float:right;
    list-style: none; 
    margin: 13px 20px;
}
.ellipse1{
    position: fixed;
    width: 357px;
    height: 298px;
    left: 990px;
    top: 16px;
    z-index: -1;
    background: #FCFFA6;
    border-radius:50%;
}
.ellipse2 {
    position: fixed;
    width: 357px;
    height: 298px;
    left: -71px;
    top: 181px;
    z-index: -1;
    background: #8AFFB3 ;
    border-radius:45%;
}
.ellipse3{
    position: fixed;
    width: 357px;
    height: 298px;
    left: 550px;
    top: 470px;
    z-index: -1;
    background: #CAB8FF;
    border-radius: 50%;

}
.ellipse4{
    position: fixed;
    width: 33px;
    height: 20px;
    left: 55px;
    top: 123px;
    z-index: -1;
    background: #CAB8FF;
    border-radius: 50%;
}
.ellipse5{
    position: fixed;
    width: 33px;
    height: 20px;
    left: 1378px;
    top: 281px;
    z-index: -1;
    background: #8AFFB3;
    border-radius: 50%;
}
.ellipse6{
    z-index: 1;
    position: fixed;
    width: 33px;
    height: 20px;
    left: 730px;
    top: 981px;
    z-index: -1;
    background: #FCFFA6;
    border-radius: 50%;
}
            .dates{
    position: relative;
    width: 500px;
    height: 1000px;
    left: 500px;
    top: 75px;
    border-radius: 20px;
    background: rgba(0,0,0,0.7);
    border-radius: 10px;
    color: #FCFFA6;
    box-shadow: 0 15px 25px rgba(0,0,0,0.5);
    text-align: center;
    padding-top: 35px;
    padding-left: 70px;
    padding-right: 60px;
    font-family: monospace, sans-serif, cursive ;
    font-size: 20px;
    margin-left: -230px;}
            .navbar {
    background-color: #11035b;
    border-radius: 10px;
    border: 1px solid white;
    height: 50px;
}


.navbar ul {
    overflow: auto;
}

/* .navbar li{
    float:left;
    list-style: none; 
    margin: 13px 20px;
    
} */
.navbar li a {
    position: relative;
    top: -17px;
    text-decoration: none;
    color: #8ce1dd;
    font-size: 20px;
}

.navbar li a:hover {
    color: red
}

.search {
    float: right;
    color: white;
    padding: 12px 75px;
}

.navbar input {
    border: 2px solid black;
    border-radius: 14px;
    padding: 3px 17px;
    width: 129px;
}

.nav-left {
    float: left;
    list-style: none;
    margin: 13px 20px;
}

.nav-right {
    float: right;
    list-style: none;
    margin: 13px 20px;
}

img {
    position: relative;
    top:7.5px;
    height: 150px;
    width: 150px;
    box-sizing: border-box;
    box-shadow: 0 20px 25px rgba(0,0,0,0.8);
    /* border:5px solid black; */
    border-radius:5px;
}

.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
}

/*body {
    background: rgb(66, 28, 123);
    background: radial-gradient(circle, rgba(66, 28, 123, 0.9223039557619923) 0%, rgba(46, 39, 130, 1) 0%, rgba(154, 98, 250, 1) 0%, rgba(57, 57, 202, 1) 40%, rgba(28, 28, 118, 1) 98%, rgba(81, 47, 216, 1) 100%) fixed; 
}*/

.congratulations {
    position: relative;
    width: 300px;
    height: 150px;
    margin: 0 auto;
    font-size: 75px;
}

/*.congratulations span {
    position: absolute;
    bottom:80%;
    right:3%;
    width: 100%;
    height: 100%;
    margin-left: -35px;
    line-height: 530px;
     height*2 - font-size 
    text-align: center;
    transform-origin: top center;
    color: #2C365E;

}*/

.congratulations span:nth-of-type(1) {
    transform: translate(-665px, 500px) rotate(287deg);
}

.congratulations span:nth-of-type(2) {
    transform: translate(-635px, 432px) rotate(286deg);
}

.congratulations span:nth-of-type(3) {
    transform: translate(-555px, 270px) rotate(307deg);
}

.congratulations span:nth-of-type(4) {
    transform: translate(-500px, 190px) rotate(-50deg);
}

.congratulations span:nth-of-type(5) {
    transform: translate(-425px, 112px) rotate(-45deg);
}

.congratulations span:nth-of-type(6) {
    transform: translate(-310px, 20px) rotate(-30deg);
}

.congratulations span:nth-of-type(7) {
    transform: translate(-195px, -37px) rotate(-20deg);
}

.congratulations span:nth-of-type(8) {
    transform: translate(-5px, -70px) rotate(0deg);
}

.congratulations span:nth-of-type(9) {
    transform: translate(185px, -37px) rotate(20deg);
}

.congratulations span:nth-of-type(10) {
    transform: translate(310px, 20px) rotate(30deg);
}

.congratulations span:nth-of-type(11) {
    transform: translate(435px, 112px) rotate(45deg);
}

.congratulations span:nth-of-type(12) {
    transform: translate(495px, 190px) rotate(50deg);
}

.congratulations span:nth-of-type(13) {
    transform: translate(545px, 270px) rotate(-307deg);
}

.congratulations span:nth-of-type(14) {
    transform: translate(615px, 432px) rotate(-286deg);
}

.congratulations span:nth-of-type(15) {
    transform: translate(640px, 500px) rotate(-287deg);
}
.council{
    text-align: center;
    font-size: 75px;
    color: #F4BB44;
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,0.5);
    padding:20px;
    margin: 0;
    font-weight: 900;
    max-width: 450px;
    position: absolute;
    top:63%;
    left:38%;
    height: 450px;
}
.post-1,.post-2,.post-3,.post-4,.post-5,.post-6,.post-7{
    position: absolute;
    text-align: center;
    height: 230px;
    width:54%;
    left:20%;
    box-sizing:border-box;
    box-shadow: 0 35px 40px rgba(0,0,0,0.5);
    text-transform: uppercase;
    margin:30px;
    display:flex;
    font-size:30px;
    border-radius:5px;
    font-weight:600;
    background:rgba(100,201,255,0.6);
    color:rgb(50,20,100);
}

.heading-1,.heading-2,.heading-3,.heading-4,.heading-5,.heading-6,.heading-7{
    position: absolute;
    left:35%;
    font-size:40px;
    box-sizing: border-box;
    box-shadow: 0 35px 40px rgba(0,0,0,0.5);
    background:rgba(147,244,255,0.4);
    border-radius:5px;
    width:30%;
    text-align:center;
    color:rgb(0, 0, 65);
}

.heading-1{
    height:27%;
    top:150%;
}
.post-1{
    top:180%;
}

.heading-2{
    top:230%;
    height:30%;
}
.post-2{
    top:260%;
}

.heading-3{
    top:310%;
    height:25%;
}
.post-3{
    top:340%;
}
.heading-4{
    top:390%;
    height:28%;
}
.post-4{
    top:420%;
}

.heading-5{
    top:470%;
    height:30%;
}
.post-5{
    top:500%;
}
.heading-6{
    top:550%;
    height:30%;
}
.post-6{
    top:580%;
}
.heading-7{
    top:630%;
    height:30%;
}
.post-7{
    top:660%;
}
.image{
    flex-basis:28%;
}
}   </style>
        <%
            String[] winner_names = (String[]) request.getAttribute("winner_names");
            String[] branch = (String[]) request.getAttribute("branch");
            String[] year = (String[]) request.getAttribute("year");
            String[] photo = (String[]) request.getAttribute("photo");
            String[] imgFilePath={photopath+photo[0],photopath+photo[1],photopath+photo[1],photopath+photo[2],photopath+photo[3],photopath+photo[4],photopath+photo[5],photopath+photo[6]};
            String imgpath=photopath+photo[0];
        %>
        <%!String photopath = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/FINALDV/web/applicant_images/";
        %>
        <header>
            <nav class="navbar">
                <ul>
                    <div>
                        <li class="nav-left"><a href="#"><strong>Home</strong></a></li>
                        <li class="nav-left"><a href="#"><strong>About</strong></a></li>
                        <li class="nav-left"><a href="#"><strong>Contact Us</strong></a></li>
                        <li class="nav-left"><a href="#"><strong>Services</strong></a></li>

                        <li class="nav-right"><a href="Login.html"><strong></strong></a></li>
                        <li class="nav-right"><a href="#"><strong>Welcome </strong> </a></li>
                    </div>
                </ul>
            </nav>
        </header>
        <img src="logo.jpg" alt="" class="center">
        <div class="congratulations">
            <span class="c0">C</span>
            <span class="c1">O</span>
            <span class="c2">N</span>
            <span class="c3">G</span>
            <span class="c4">R</span>
            <span class="c5">A</span>
            <span class="c6">T</span>
            <span class="c7">U</span>
            <span class="c8">L</span>
            <span class="c9">A</span>
            <span class="c10">T</span>
            <span class="c11">I</span>
            <span class="c12">O</span>
            <span class="c13">N</span>
            <span class="c14">S</span>
        </div>
        <div class="council">
            <p>Student<br>Council<br>2022</p>
        </div>
        <br><br> <br><br> <br><br>
        <div class="heading-1">
            <h3>General Secretary</h3>
        </div>
        <br><br> <br><br>
        <div class="post-1">
            <div class="image">
                <img src="<%=photo[0]%>" alt="not found">
            </div>
            <div>
                <p>Name:<%= winner_names[0]%></p>
                <p>Branch: <%=branch[0]%></p>
                <p>Year: <%=year[0]%></p>
            </div>
        </div>
             <div class="heading-2">
                 <h3>Cultural Secretary</h3>
    </div>
    <div class="post-2">
        <div class="image">
            <img src="<%=photo[1]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[1]%></p>
            <p>Branch: <%=branch[1]%></p>
            <p>Year: <%=year[1]%></p>
        </div>
    </div>
           <div class="heading-3">
        <h3>Joint Cultural Secretary</h3>
    </div>
    <div class="post-3">
        <div class="image">
            <img src="<%=photo[4]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[4]%></p>
            <p>Branch: <%=branch[4]%></p>
            <p>Year: <%=year[4]%></p>
        </div>
 </div>
   
    <div class="heading-4">
        <h3>Sports Secretary</h3>
    </div>
    <div class="post-4">
        <div class="image">
            <img src="<%=photo[2]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[2]%></p>
            <p>Branch: <%=branch[2]%></p>
            <p>Year: <%=year[2]%></p>
        </div>

    </div>
        
        <div class="heading-5">
        <h3>Joint Sports Secretary</h3>
    </div>
    <div class="post-5">
        <div class="image">
            <img src="<%=photo[5]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[5]%></p>
            <p>Branch: <%=branch[5]%></p>
            <p>Year: <%=year[5]%></p>
        </div>

    </div>
  <div class="heading-6">
        <h3>Ladies Representative</h3>
    </div>
    <div class="post-6">
        <div class="image">
            <img src="<%=photo[3]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[3]%></p>
            <p>Branch: <%=branch[3]%></p>
            <p>Year: <%=year[3]%></p>
        </div>
    </div>
        <div class="heading-7">
        <h3>Joint Ladies Representative</h3>
    </div>
        <div class="post-7">
        <div class="image">
            <img src="<%= photo[6]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[6]%></p>
            <p>Branch: <%=branch[6]%></p>
            <p>Year: <%=year[6]%></p>
        </div>

    </div>
 
<!--        <h1>Hello World!</h1>-->
    </body>
</html>
