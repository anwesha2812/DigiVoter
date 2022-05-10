<%-- 
    Document   : candidates.jsp
    Created on : 24-Feb-2022, 9:10:52 pm
    Author     : HP
--%>
<!--FINALDV\web\candidate_template\candidates.jsp-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidates | DigiVoter</title>
        <link rel="stylesheet" href="candidate_template/info.css">
    </head>
    <body>
       <%!int count, num;
            String moodle, fname, mname, lname, branch, post, year, age, q1, q2, q3, q4, q5, imgFileName, cvFileName, status, validator, vis;%>
        <% count = (int) session.getAttribute("count");
            num = (int) session.getAttribute("num");
            HttpSession session2 = request.getSession();
            validator= (String) request.getAttribute("validator");
            session2.setAttribute("count", count);
            moodle= (String) request.getAttribute("moodle");
            status= (String) request.getAttribute("status");
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
        <div class= "year">Running for <%=post%></div>
        <div class="candi"><img src="applicant_images/<%=imgFileName%>"></div>
        <div class= "info">
            <div class= "name">NAME: <%=fname+" "+mname+" "+lname%>
                <div> </div>
            </div>
            <div class= "branch">BRANCH:<%=branch%>
                <div> </div>
            </div>
            <div class= "year">YEAR: <%=year%></div>
            <div class= "mention">Mention Your Message for campaign.
                <br><div class="answers"><%=q4%> </div>
            </div>
            <div class= "why">What are your hobbies?
                <br><div class="answers"><%=q1%> </div>
            </div><br>
            <div class= "why">Why do you want to run for above posts?
                <br><div class="answers"><%=q2%> </div>
            </div>
            <div class= "what">What changes would you implement after getting the post?
                <br><div class="answers"> <%=q3%></div>
            </div>
        </div>
         <a href="<%=servletName%>"><ul class="next">
            <li class="content__item">
               <button class="button button--anthe"><span>Next</span></button>
			</li>
             </ul></a>
        <div class="pdf">
        <embed src="CV_applicants/<%=cvFileName%>"  width="800px" height="800px"/>
        </div>
        
    </body>
</html>
