<%-- 
    Document   : candidates.jsp
    Created on : 24-Feb-2022, 9:10:52 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates | DigiVoter</title>
    </head>
    <body>
       <%!int count, num;
            String fname, mname, lname, branch, post, year, age, q1, q2, q3, q4, q5, imgFileName, cvFileName;%>
        <% count = (int) session.getAttribute("count");
            num = (int) session.getAttribute("num");
            HttpSession session2 = request.getSession();

            session2.setAttribute("count", count);
            fname = (String) request.getAttribute("fname");
            mname = (String) request.getAttribute("mname");
            lname = (String) request.getAttribute("lname");
            fname = (String) request.getAttribute("fname");
            branch = (String) request.getAttribute("branch");
            post=(String) request.getAttribute("post");
            year = (String) request.getAttribute("year");
            age = (String) request.getAttribute("age");
            q1 = (String) request.getAttribute("q1");
            q2 = (String) request.getAttribute("q2");
            q3 = (String) request.getAttribute("q3");
            q4 = (String) request.getAttribute("q4");
            q5 = (String) request.getAttribute("q5");
            imgFileName = (String) request.getAttribute("imgFileName");
            cvFileName = (String) request.getAttribute("cvFileName");
            String imgPath = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/TestingDV/web/applicant_images/" + imgFileName;
            String cvPath = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/TestingDV/web/CV_applicants/" + cvFileName;
            String servletName=(String)session.getAttribute("servletName");
        %>
        <header>
        <nav class="navbar">
           <ul>
                <li class="nav-left"><a href="#">Home</a></li>
                <li class="nav-left"><a href="#">About</a></li>
                <li class="nav-left"><a href="#">Contact Us</a></li>
                <li class="nav-left"><a href="#">Services</a></li>
                
                <!-- <li class ="nav-right"><a href="login-main.jsp">Login</a></li> -->
                <li class ="nav-right"><a href="">Welcome </a></li>
                </div>
            </ul>
        </nav>
    </header> 
    <div class="ellipse">
        <div class="ellipse1"></div>
        <div class="ellipse2"></div>
        <div class="ellipse3" ></div>
        <div class="ellipse4"></div>
        <div class="ellipse5"></div>
        <div class="ellipse6"></div></div>
        <div class= "year">Applying for <%=post%></div>
        <div class="candi"><img src="speaker2.png"></div>
        <div class= "info">
            <div class= "name">NAME: <%=fname+" "+mname+" "+lname%>
                <div> </div>
            </div>
            <div class= "branch">BRANCH:<%=branch%>
                <div> </div>
            </div>
            <div class= "year">YEAR: <%=year%></div>
            <div class= "mention">Mention Your Message for campaign.
                <br><div><%=q4%> </div>
            </div>
            <div class= "why">What are your hobbies?
                <br><div><%=q1%> </div>
            </div>
            <div class= "why">Why do you want to run for above posts?
                <br><div><%=q2%> </div>
            </div>
            <div class= "what">What changes would you implement after getting the post?
                <br><div> <%=q3%></div>
            </div>
        </div>
        <ul class="next">
            <li class="content__item">
                <button class="button button--anthe"><span>Next</span></button>
			</li>
         </ul>

    </body>
</html>
