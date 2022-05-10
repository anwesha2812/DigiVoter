<%-- 
    Document   : studentPortal
    Created on : 05-Dec-2021, 1:39:10 pm
    Author     : HP
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <% // response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Expires", "0");

//        HttpSession session1=request.getSession();
//        session1.setAttribute("validator","0");
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


                    <% String applstatus = "";
                        Cookie[] cookies = request.getCookies();

                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("appl-status")) {
                                    applstatus = cookie.getValue();
                                }
                            }
                        }
                    %>
                    <%! String status, oadate, cadate, block, none, voteform, votelink; %>
                    <%status = (String) request.getAttribute("b");%>
                    <%oadate = (String) request.getAttribute("oa");%>
                    <%cadate = (String) request.getAttribute("ca");
                        int v = (int) request.getAttribute("vis");
                        block = "block";
                        none = "none";
                    %>
                    <%!String message, result, dispbeforevoteafterapp, disponapptime, canddisp, disponvotetime, link;%>
                    <%
                        switch (v) {
                            case 1:
                                message = "Applications will be opening soon";
                                link = "#";
                                disponapptime = "none";
                                dispbeforevoteafterapp = "none";
                                disponvotetime = "none";
                                result = "none";
                                canddisp = "none";
                                break;
                            case 2:
                                if (applstatus.equals("applied")) {
                                    message = "Application submitted";
                                    link = "";
                                } else {
                                    message = "Click here to apply";
                                    link = "applicationform.jsp";
                                }
                                disponapptime = "none";
                                dispbeforevoteafterapp = "none";
                                disponvotetime = "none";
                                result = "none";
                                canddisp = none;
                                break;
                            case 3:
                                message = "Applications have closed";
                                link = "";
                                disponapptime = "none";
                                dispbeforevoteafterapp = "block";
                                disponvotetime = "none";
                                result = "none";
                                canddisp = none;
                                break;
                            case 4:
                                message = "Applications have closed";
                                link = "";
                                disponapptime = "none";
                                dispbeforevoteafterapp = "block";
                                disponvotetime = "none";
                                result = "none";
                                canddisp = block;
                                break;
                            case 5:
                                message = "Applications have closed";
                                link = "";
                                disponapptime = "none";
                                dispbeforevoteafterapp = "none";
                                disponvotetime = "block";
                                voteform = "Click here to vote";
                                votelink = "Vote_GS";
                                result = "none";
                                canddisp = block;
                                break;
                            case 6:
                                message = "Applications have closed";
                                link = "";
                                disponapptime = "none";
                                dispbeforevoteafterapp = "none";
                                disponvotetime = "none";
                                voteform = "Your vote has been submitted";
                                votelink = "";
                                result = "block";
                                canddisp = block;
                                break;
                            case 7:            //user has voted
                                message = "Applications have closed";
                                link = "";
                                disponapptime = "none";
                                dispbeforevoteafterapp = "none";
                                disponvotetime = "block";
                                voteform = "Thank you for Voting";
                                votelink = "";
                                result = "none";
                                canddisp = block;
                                break;
                            default:
                                message = "oops";
                                break;
                        }
                    %>

                    <style>span a::before,
                        span a::after{
                            position: absolute;
                            content: "<%=message%>";
                            height: 100px;
                            width: 440px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            border: 5px solid black;
                            box-sizing: border-box;
                            border-radius: 5px;
                        }
                        #dyn1{
                            display: <%=disponvotetime%>;
                        }
                        #onvotetime{
                            display: <%=disponapptime%>
                        }
                        #d1{
                            display:<%=disponapptime%>
                        }
                        #clicktovote{
                            content:"hello world";
                        }
                        #vote{
                            display:<%=disponvotetime%>
                        }
                        #vote-open-soon{
                            display:<%=dispbeforevoteafterapp%>
                        }
                        #meet-the-candidates{
                            display:<%=canddisp%>
                        }
                    </style>
                    <div id="d1">
                        <h2>Applications open</h2> <br>
                        <h4>From: <%= oadate%> <br> To: <%= cadate%></h4>
                    </div>

                    <div class="notice">
                        <span>
                            <a href="<%=link%>"></a> 
                        </span>
                    </div>
                    <%!int count = 0;%>
                    <% HttpSession session1 = request.getSession();
                        session1.setAttribute("count", count);%>
                    <br>
                    <%!String post = "culsec";%>
                    <div id="meet-the-candidates">
                        <style>
                            .dates{
                                position: relative;
                                width: 700px;
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
                                margin-left: -600px;
                                margin-bottom: 150px;
                            }
                            table  {
                                width:90%;
                                border:1px solid ;
                                color:#FCFFA6;
                                margin-left: 4%;
                            }
                            tr{
                                border:1px solid ;
                                color:#FCFFA6;
                            }
                            td{

                                border:1px solid ;
                                color:#FCFFA6;
                            }

                           


                        </style>

                        <%
                            Connection con;
                            //String [] post={"GS","CS","SS","LR","JCS","JSS","JLR"};
                            //             String [] fname= new String[500];
                            //                    String [] lname= new String[500];
                            //                    String [] status = new String[500];
                            //                    String [] post = new String[500];
                            String fname = "", lname = "", status = "", post = "";
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                            String q0 = "select * from applicant where status='approved'";
                            PreparedStatement pst0 = con.prepareStatement(q0, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet res0 = pst0.executeQuery();
                            res0.last();
                            int num;
                            num = res0.getRow(); //to get total count of applicants

                            String q1 = "select distinct u.First_Name as fname,u.Last_Name as lname,a.status as status,a.post as post from users u,applicant a where u.MoodleID=a.MoodleID and status='approved' order by post";
                            PreparedStatement pst1 = con.prepareStatement(q1);
                            ResultSet res1 = pst1.executeQuery();
                        %>
                        <div class="dates">
                            <h3>Candidate List</h3>
                            <h5>Click on Post banners below to view Candidate Profiles</h5>
                            <table>
                                <tr>
                                    <td>Post</td>
                                    <td>Name</td>

                                </tr>
                                <%
                                    while (res1.next()) {
                                        fname = res1.getString("fname");
                                        lname = res1.getString("lname");

                                        post = res1.getString("post");
                                        if (post.equals("GS")) {
                                            post = "General Secretary";
                                        } else if (post.equals("CS")) {
                                            post = "Cultural Secretary";
                                        } else if (post.equals("SS")) {
                                            post = "Sports Secretary";
                                        } else if (post.equals("LR")) {
                                            post = "Ladies Representative";
                                        } else if (post.equals("JCS")) {
                                            post = "Joint Cultural Secretary";
                                        } else if (post.equals("JSS")) {
                                            post = "Joint Sports Secretary";
                                        } else {
                                            post = "Joint Ladies Representative";
                                        }
                                        if (status == null) {
                                            status = "Not set";
                                        }

                                %>
                                <tr>
                                    <td> <%=post%></td>
                                    <td> <%=fname + " " + lname%></td>

                                </tr>

                                <% }%>     

                            </table>

                        </div>
                        <h1 id="h1">Meet the Candidates </h1>
                        <!--<div class="conatiner1">-->
                        <div class="wrap">

                            <div class="box1 one">
                                <a href="GSInfo">
                                    <h1>General Secretary</h1>
                                    <div class="poster p1">
                                        <h4>GS</h4>
                                    </div></a>
                            </div>

                            <div class="box1 two">
                                <a href="CSInfo" >
                                    <H1>Cultural Secretary</H1>
                                    <div class="poster p2" >
                                        <h4>CS</h4>
                                    </div></a>
                            </div>

                            <div href="SSInfo" class="box1 three">
                                <a href="SSInfo">
                                    <h1>Sports Secretary</h1>
                                    <div class="poster p3">
                                        <h4>SS</h4>
                                    </div></a>
                            </div>

                            <div class="box1 five">
                                <a href="LRInfo">
                                    <h1>Ladies Representative</h1>
                                    <div class="poster p4">
                                        <h4>LR</h4>
                                    </div></a>
                            </div>

                            <div class="box1 six">
                                <a href="JCSInfo"> 
                                    <h1>Joint Cultural Secretary</h1>
                                    <div class="poster p5">
                                        <h4>JCS</h4>
                                    </div></a>
                            </div>

                            <div class="box1 seven">
                                <a href="JSSInfo" > 
                                    <h1>Joint Sports Secretary</h1>
                                    <div class="poster p6">
                                        <h4>JSS</h4>
                                    </div></a>
                            </div>

                            <div  class="box1 six">
                                <a href="JLRInfo">
                                    <h1>Joint Ladies Representative</h1>
                                    <div class="poster p5">
                                        <h4>JLR</h4>
                                    </div></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="voting">
                    <div id="vote-open-soon">
                        <h1 id="head">Voting will begin soon!!</h1>
                        <div class="container">
                            <div class="Rules">
                                <div class="box">
                                    <div class="info">

                                        <h3>Voting Rules</h3>
                                        <p>1. Kindly Note:
                                            <br>-Voting Lines will be open only for a specific amount of time.
                                            <br>-You are allowed to cast your vote only once.
                                            <br>-Once submitted, your vote cannot be altered or deleted.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <style>
                    #vote {
                        text-decoration: none;
                        border: 3px solid #FCFFA6;
                        color: transparent;
                        padding: 40px 80px;
                        font-size: 28px;
                        font-family: sans-serif;
                        letter-spacing: 5px;
                        transition: all 0.5s;
                        position: relative;
                        margin-left: 34%;
                    }
                    #vote:before {
                        content: "<%=voteform%>";
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        color: #FCFFA6;
                        background: rgb(34, 34, 34);
                        font-size: 28px;
                        top: 0;
                        left: 100%;
                        font-family: sans-serif;
                        letter-spacing: 5px;
                        transition: all 1s;
                        height: 100%;
                        width: 100%;
                        position: absolute;
                        transform: scale(0) rotatey(0);
                        opacity: 0;
                    }
                    #vote:hover:before {
                        transform: scale(1) rotatey(360deg);
                        left: 0;
                        opacity: 1;
                    }
                    #vote:after {
                        content: "<%=voteform%>";
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        color: #FCFFA6;
                        background: rgb(34, 34, 34);
                        font-size: 28px;
                        top: 0;
                        left: 0;
                        font-family: sans-serif;
                        letter-spacing: 5px;
                        transition: all 1s;
                        height: 100%;
                        width: 100%;
                        position: absolute;
                        transform: scale(1) rotatey(0);
                        opacity: 1;
                    }
                    #vote:hover:after {
                        transform: scale(0) rotatey(360deg);
                        left: -100%;
                        opacity: 0;
                    }
                    .result{
                        margin: auto;
                        display: <%=result%>
                    }
                    #vote-open-soon{
                        display: <%=dispbeforevoteafterapp%>
                    }
                    #voting-open{
                        display: <%=disponvotetime%>
                    }
                </style>
                <div id="voting-open">
                    <h1 id="head">Voting Open!!</h1>
                    <div class="container">
                        <div class="Rules">
                            <div class="box">
                                <div class="info">

                                    <h3>Voting Rules</h3>
                                    <p>1. Required documents:
                                        <br>-Voting Lines will be open only for a specific amount of time.
                                        <br>-You are allowed to cast your vote only once.
                                        <br>-Once, submitted, your vote cannot be altered or deleted.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br><br>
                    <%!int count_vote = 0;%>
                    <% HttpSession session_vote = request.getSession();
                        session_vote.setAttribute("count", count_vote);
                    %>
                    <a id="vote" href="<%=votelink%>">Click here to vote</a>

                </div>


                <div class="result">
                    <h1 id="head">Results are Outt!!</h1><br><br><br>
                    <a id="result"href="ResultCalculation">Click here to see Results</a>
                    <br><br><br><br>
                   <div class="center">
                    <center><a href="<%="stats.jsp"%>">Click here to view Statistics</a></center>
                    </div>
                </div>
 <style>
                        .center {
                            margin: auto;
                            width: 30%;
                            border: 3px solid #73AD21;
                            padding: 15px 0px 15px 0px;
                            
                        }
                    </style>
                    
            </div>

    </body>
</html>
