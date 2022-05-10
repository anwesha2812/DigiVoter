<%-- 
    Document   : new-voting-page
    Created on : 02-Mar-2022, 1:21:52 pm
    Author     : HP
--%>
<!--C:\Users\HP\OneDrive\Documents\NetBeansProjects\FINALDV\web\new-voting-page.jsp-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style-voting-page.css">
    </head>
    <body>
        <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
        %>
         <header>
        <nav class="navbar">
            <ul>
                <div>
                    <li class="nav-left"><a href="#"><strong>Home</strong></a></li>
                    <li class="nav-left"><a href="#"><strong>About</strong></a></li>
                    <li class="nav-left"><a href="#"><strong>Contact Us</strong></a></li>
                    <li class="nav-left"><a href="#"><strong>Services</strong></a></li>

                    <li class="nav-right"><a href="Login.html"><strong>Login</strong></a></li>
                    <li class="nav-right"><a href="#"><strong>Register</strong> </a></li>
                </div>
            </ul>
        </nav>
    </header>
        <div>
        <!--<button class="btn-back " onclick=""><strong>Back</strong></button>-->
        <!--<button class="btn-logout"><strong>Logout</strong></button>-->
    </div>
    <div class="heading">
        <h1>DigiVoter</h1>
    </div>
    <hr>
        <%! String[] candidates=new String[5]; String nextPost; int[] moodle=new int[5];%>
        <%
            moodle=(int[])request.getAttribute("moodle");
            candidates=(String[])request.getAttribute("candidates");
            String nextPost=(String)request.getAttribute("nextPost");
            String votePost=(String)request.getAttribute("vote_post");
        %>
         <h3>VOTE FOR STUDENT COUNCIL COMMITTEE</h3>
        <form action="<%=nextPost%>" method="post" class="data">
         <h4> <%=votePost%></h4><br>
            <div class="input-group" class="form-group">
                    <label for="gender">Choose the Candidate you want to vote:</label><br>
                    <input type="radio" name="vote" value="<%=moodle[0]%>" onclick="enableNext()" class="radio-btn"><%=candidates[0]%><br>
                    <input type="radio" name="vote" value="<%=moodle[1]%>" onclick="enableNext()" class="radio-btn"><%=candidates[1]%><br>
                    <input type="radio" name="vote" value="<%=moodle[2]%>" onclick="enableNext()" class="radio-btn"><%=candidates[2]%><br>
                    <input type="radio" name="vote" value="<%=moodle[3]%>" onclick="enableNext()" class="radio-btn"><%=candidates[3]%>
                </div>
                <button type="submit" id="nextbtn" class="Vote" disabled><strong>NEXT</strong></button>
        
        
        <script>
//            document.getElementById("submit").disabled = true;
            function enableNext(){
                document.getElementById("nextbtn").disabled = false;
            }
        </script>
        </form>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </body>
</html>