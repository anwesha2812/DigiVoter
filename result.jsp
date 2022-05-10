<%-- 
    Document   : result.jsp
    Created on : 03-Apr-2022, 5:59:19 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style-result.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Result | DigiVoter</title>
    </head>
    <body>
        <%
        String[] winner_names =(String[]) request.getAttribute("winner_names");
        String[] branch =(String[]) request.getAttribute("branch");
        String[] year =(String[]) request.getAttribute("year");
        String[] photo =(String[]) request.getAttribute("photo");
        %>
        <%!String photopath="C:/Users/HP/OneDrive/Documents/NetBeansProjects/FINALDV/web/applicant_images/";
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
    <div class="heading-1">
        <h3>General Secretary</h3>
    </div>
    <div class="post-1">
        <div class="image">
            <img src="<%=photopath + photo[0]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[0]%></p>
            <p>Branch:<%=branch[0]%></p>
            <p>Year:<%=year[0]%></p>
        </div>

    </div>
    <div class="heading-2">
        <h3>Cultural Secretary</h3>
    </div>
    <div class="post-2">
        <div class="image">
            <img src="<%=photopath + photo[1]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[1]%></p>
            <p>Branch:<%=branch[1]%></p>
            <p>Year:<%=year[1]%></p>
        </div>

    </div>
    <div class="heading-4">
        <h3>Sports Secretary</h3>
    </div>
    <div class="post-4">
        <div class="image">
            <img src="<%=photopath + photo[2]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[2]%></p>
            <p>Branch:<%=branch[2]%></p>
            <p>Year:<%=year[2]%></p>
        </div>

    </div>
    <div class="heading-6">
        <h3>Ladies Representative</h3>
    </div>
    <div class="post-6">
        <div class="image">
            <img src="<%=photopath + photo[3]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[3]%></p>
            <p>Branch:<%=branch[3]%></p>
            <p>Year:<%=year[3]%></p>
        </div>

    </div>
    <div class="heading-3">
        <h3>Joint Cultural Secretary</h3>
    </div>
    <div class="post-3">
        <div class="image">
            <img src="<%=photopath + photo[4]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[4]%></p>
            <p>Branch:<%=branch[4]%></p>
            <p>Year:<%=year[4]%></p>
        </div>

    </div>
   
    <div class="heading-5">
        <h3>Joint Sports Secretary</h3>
    </div>
    <div class="post-5">
        <div class="image">
            <img src="<%=photopath + photo[5]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[5]%></p>
            <p>Branch:<%=branch[5]%></p>
            <p>Year:<%=year[5]%></p>
        </div>

    </div>
    
    <div class="heading-7">
        <h3>Joint Ladies Representative</h3>
    </div>
    <div class="post-7">
        <div class="image">
            <img src="<%=photopath + photo[7]%>" alt="Not found">
        </div>
        <div>
            <p>Name:<%= winner_names[6]%></p>
            <p>Branch:<%=branch[6]%></p>
            <p>Year:<%=year[6]%></p>
        </div>

    </div>
    
    </body>
</html>
