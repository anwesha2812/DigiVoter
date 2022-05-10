<%-- 
    Document   : candidate-profile
    Created on : 03-Apr-2022, 3:53:36 pm
    Author     : HP
FOR VALIDATOR SIDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applicants | DigiVoter</title>
        <link rel="stylesheet" href="candidate_template/INFO2.css">
    </head>
    <body>
        <%!int count, num, moodle;%>
         <%! String  status_disp,fname, mname, lname,age, branch, post, year, q1, q2, q3, q4, q5, imgFileName, cvFileName, status, validator, vis="",button_stat="", visibility="",visibility_div="";%>
        <% count = (int) session.getAttribute("count");
            num = (int) session.getAttribute("num");
            HttpSession session2 = request.getSession();
            validator= (String) request.getAttribute("validator");
           session2.setAttribute("count", count);
            
            moodle= (int) request.getAttribute("moodle");
           status= (String) request.getAttribute("status");
            fname = (String) request.getAttribute("fname");
            mname = (String) request.getAttribute("mname");
            lname = (String) request.getAttribute("lname");
            session2.setAttribute("moodle", moodle);
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
//            String imgPath = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/TestingDV/web/applicant_images/" + imgFileName;
//            String cvPath = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/TestingDV/web/CV_applicants/" + cvFileName;
            String servletName=(String)session.getAttribute("servletName");
        %>
          <%
        
        if(status == null){
                 button_stat="";
                
                 status_disp="";
            }else{
            button_stat="hidden";
            status_disp=status;
            }
        %>
        <style>
            .accrej {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
        </style>
        <header>
        <nav class="navbar">
           <ul>
                <li class="nav-left"><a href="validator-home.jsp">Home</a></li>
                <li class="nav-left"><a href="#">About</a></li>
                <li class="nav-left"><a href="#">Contact Us</a></li>
                <li class="nav-left"><a href="#">Services</a></li>
                
                
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
        
 <div class= "year">Applying for <%=post%>
 <br>
  <div  <%=visibility_div%>>
            <h3 > Status: <%=status_disp%></h3>
            <a href="AcceptServlet"><button class="accrej" type="button" name="accept" value="<%=moodle%>" <%=button_stat%> <%=visibility%>>Accept</button></a>
            <a href="RejectServlet"><button class= "accrej" type="button" name="reject" value="<%=moodle%>" <%=button_stat%> <%=visibility%> >Reject</button></a>
        </div>
 </div>
        <div class="candi"><img src="applicant_images/<%=imgFileName%>" ></div>
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
        <br>
        <a href="AcceptServlet"><button type="button" class="accrej" name="accept" value="<%=moodle%>" <%=button_stat%> <%=visibility%>>Accept</button></a>
            <a href="RejectServlet"><button type="button" class="accrej" name="reject" value="<%=moodle%>"  <%=button_stat%> <%=visibility%> >Reject</button></a> 
        </div>
       
     
    </body>
</html>
