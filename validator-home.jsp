<%-- 
    Document   : validator-home
    Created on : 27-Jan-2022, 9:41:09 pm
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validator | DigiVoter</title>
        <script src="validator.js"></script> 
        <link rel="stylesheet" href="style-validator.css">
    </head>
    <body>
        <header>
            <nav class="navbar">
                <ul>
                    <li class="nav-left"><a href="#">Home</a></li>
                    <li class="nav-left"><a href="#">About</a></li>
                    <li class="nav-left"><a href="#">Contact Us</a></li>
                    <li class="nav-left"><a href="#">Services</a></li>


                    <li class ="nav-right"><a href="">Welcome </a></li>
                    <li class ="nav-right"><a href="Logout">Logout</a></li>
                    </div>
                </ul>
            </nav>
        </header>  
        <div class="ellipse1"></div>
        <div class="ellipse2"></div>
        <div class="ellipse3"></div>
        <div class="ellipse4"></div>
        <div class="ellipse5"></div>
        <div class="ellipse6"></div>
        <img src="fontchange.png" alt="">
        <% String oa, ca, ov,cv;
        Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                String q = "select * from dates";
                PreparedStatement pst = con.prepareStatement(q, ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                ResultSet res = pst.executeQuery();
                res.last();
                oa=res.getString( "openappl");
                ca=res.getString("closeappl");
                ov=res.getString("openvote");
                cv=res.getString("closevote");
        %>
        <div class="dates">
            
            <form  method="post" action="ValidatorServlet_main">
                <label for="Application_Opening_Date">
                    <h3>Application Opening Date :</h3>
                </label>
                <input type="date" name="Application_Opening_Date" id="Application_Opening_Date" required >

                <label for="Application_Closing_Date">
                    <h3>Application Closing Date :</h3>
                </label>
                <input type="date" name="Application_Closing_Date" id="Application_Closing_Date" required oninput="app.value=compare()">
                <br><br>
                <output id="app" for="Application_Closing_Date"></output>

                <label for="Voting_Opening_Date">
                    <h3>Voting Opening Date :</h3>
                </label>
                <input type="date" name="Voting_Opening_Date" id="Voting_Opening_Date" required >


                <label for="Voting_Closing_Date">
                    <h3>Voting Closing Date :</h3>
                </label>
                <input type="date" name="Voting_Closing_Date" id="Voting_Closing_Date" required oninput="vote.value=compare()">
                <br>
                <output id="vote" for="Voting_Closing_Date"></output><br>
                <h4> ${date_status} </h4>
                <input type="submit" id="submit" value="update" >

            </form>
                <br><br><br>
        <table>
            <tr>
             <td colspan="4">Currently Set</td>
             
            </tr>
            <tr>
             <td colspan="2">Application</td>
             <td colspan="2">Voting</td>
            </tr>
            <tr>
             <td>open</td>
             <td>close</td>
             <td>open</td>
             <td>close</td>
            </tr>
            <tr>
                <td><%=oa%></td>
             <td><%=ca%></td>
             <td><%=ov%></td>
             <td><%=cv%></td>
            </tr>
           </table>
        </div><br><br><br> 
        
        <%!int count_appl = 0;%>
        <% HttpSession session1 = request.getSession();
            session1.setAttribute("count", count_appl);           
        %>
         
                   
                    <div class="container">
                        <div class="Rules">
                            <div class="box1">
                                <div class="info">

                                    <h3>To the Validator:</h3>
                                    
                                    <p><a id="listappl" href="listappl.jsp">Click here to view the list of applicants</a>
                                    <br> Click on Post banners to view Candidate Profiles
                                    <br> Approve 4 applications for each post by clicking "Accept" to finalize candidates based on their CV and profile.
                                    </p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
        <hr>
          <h1 class="heading" >Applicants</h1>
        <div class="conatiner">
            <div class="wrap">

                <a href="GSappl"> <div class="box one">

                        <h1>General Secretary</h1>
                        <div class="poster p1">
                            <h4>GS</h4>
                        </div> 
                    </div></a>

                <a href="CSappl"><div class="box two">

                        <H1>Cultural Secretary</H1>
                        <div class="poster p2" >
                            <h4>CS</h4>
                        </div>
                    </div></a>

                <a href="SSappl"><div class="box three">

                        <h1>Sports Secretary</h1>
                        <div class="poster p3">
                            <h4>SS</h4>
                        </div>
                    </div></a>

                <a href="LRappl"><div class="box five">

                        <h1>Ladies Representative</h1>
                        <div class="poster p4">
                            <h4>LR</h4>
                        </div>
                    </div></a>

                <a href="JCSappl"><div class="box six">

                        <h1>Joint Cultural Secretary</h1>
                        <div class="poster p5">
                            <h4>JCS</h4>
                        </div>
                    </div></a>

                <a href="JSSappl"><div class="box seven">

                        <h1>Joint Sports Secretary</h1>
                        <div class="poster p6">
                            <h4>JSS</h4>
                        </div>
                    </div></a>
                <a href="JLRappl"><div class="box six">

                        <h1>Joint Ladies Representative</h1>
                        <div class="poster p5">
                            <h4>JLR</h4>
                        </div>
                    </div></a>      
            </div>
</html>
