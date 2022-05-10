<%-- 
    Document   : listappl
    Created on : 09-Apr-2022, 10:34:11 pm
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
        <title>JSP Page</title>
    </head>
    <body>
        <style>
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
    height: 1500px;
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
        <div class="ellipse1"></div>
        <div class="ellipse2"></div>
        <div class="ellipse3"></div>
        <div class="ellipse4"></div>
        <div class="ellipse5"></div>
        <div class="ellipse6"></div>
        <% 
             Connection con;
             //String [] post={"GS","CS","SS","LR","JCS","JSS","JLR"};
//             String [] fname= new String[500];
//                    String [] lname= new String[500];
//                    String [] status = new String[500];
//                    String [] post = new String[500];
                String fname="", lname="", status="", post="";
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                String q0 = "select * from applicant";
                PreparedStatement pst0 = con.prepareStatement(q0, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet res0 = pst0.executeQuery();
                res0.last();
                int num;
                num = res0.getRow(); //to get total count of applicants
                
                String q = "select distinct u.First_Name as fname,u.Last_Name as lname,a.status as status,a.post as post from users u,applicant a where u.MoodleID=a.MoodleID order by post";
                PreparedStatement pst = con.prepareStatement(q);
                ResultSet res = pst.executeQuery();      
        %>
        <div class="dates">
            <h4>Applicant Status</h4>
        <table>
             <tr>
             <td>Post</td>
             <td>Name</td>
             <td>Status</td>
             
            </tr>
            <% 
                while(res.next()){
                fname=res.getString("fname");
                lname=res.getString("lname");
                status=res.getString("status");
                post=res.getString("post");
            if(status == null){
            status = "Not set" ;
                }
           
            %>
            <tr>
<td> <%=post%></td>
<td> <%=fname+" "+lname%></td>
<td> <%=status%></td>
</tr>

<% } %>     

        </table>
</div>
    </body>
</html>
