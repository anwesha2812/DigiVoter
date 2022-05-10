<%-- 
    Document   : stats
    Created on : 10-Apr-2022, 11:21:24 am
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stats | DigiVoter</title>
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
        </style>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
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
        <%
            Connection con;
            //String [] post={"GS","CS","SS","LR","JCS","JSS","JLR"};
//             String [] fname= new String[500];
//                    String [] lname= new String[500];
//                    String [] status = new String[500];
//                    String [] post = new String[500];
            String fname = "", lname = "", status = "", post = "";
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");

            //GENDER GRAPH
            String qf = "select * from users where voteStatus='voted' and gender='female'";
            PreparedStatement pst1 = con.prepareStatement(qf, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet res1 = pst1.executeQuery();
            res1.last();
            int numf, numm, numo, num;
            numf = res1.getRow(); //to get total count of applicants

            String qm = "select * from users where voteStatus='voted' and gender='male'";
            PreparedStatement pst2 = con.prepareStatement(qm, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet res2 = pst2.executeQuery();
            res2.last();
            numm = res2.getRow(); //to get total count of applicants

            String qo = "select * from users where voteStatus='voted' and gender='other'";
            PreparedStatement pst3 = con.prepareStatement(qo, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet res3 = pst3.executeQuery();
            res3.last();
            numo = res3.getRow(); //to get total count of applicants

            String q = "select count(*) as count from users";
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet res = pst.executeQuery();
            res.next();
            num = (int) res.getInt("count");
            
            //Year division piechart
            int fe,se,te,be;
            String q4 = "select count(*) as count from applicant where year='FE'";
            PreparedStatement pst4 = con.prepareStatement(q4);
            ResultSet res4 = pst4.executeQuery();
            res4.next();
            fe = (int) res4.getInt("count");
            
             String q5 = "select count(*) as count from applicant where year='SE'";
            PreparedStatement pst5 = con.prepareStatement(q5);
            ResultSet res5 = pst5.executeQuery();
            res5.next();
            se = (int) res5.getInt("count");
            
            String q6 = "select count(*) as count from applicant where year='TE'";
            PreparedStatement pst6 = con.prepareStatement(q6);
            ResultSet res6 = pst6.executeQuery();
            res6.next();
            te = (int) res6.getInt("count");
            
            String q7 = "select count(*) as count from applicant where year='BE'";
            PreparedStatement pst7 = con.prepareStatement(q7);
            ResultSet res7 = pst7.executeQuery();
            res7.next();
            be = (int) res7.getInt("count");
        %>

        <canvas id="myChart" style="width:100%;max-width:700px"></canvas> <hr>
        <script>
            var xValues = ["Total Users", "Female", "Male", "Other"];
            var yValues = [<%=num-1%>,<%=numf%>,<%=numm%>,<%=numo%>];
            var barColors = ["red","blue","green","yellow"];
            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {legend: {display: false},
                    scales: {
                        yAxes: [{ticks: {min: 0, max: 50}}]
                    }, title: {
                        display: true,
                        text: "Gender graph of Participating Voters"
                    }
                }

            });
        </script>

        <canvas id="myChart2" style="width:100%;max-width:600px"></canvas>

        <script>
            var xValues = ["First Year", "Second Year", "Third Year","Final Year"];
            var yValues = [<%=fe%>,<%=se%>,<%=te%>,<%=be%>];
            var barColors = [
                "red", "green","blue","orange"
            ];

            new Chart("myChart2", {
                type: "pie",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Year-wise Application "
                    }
                }
            });
        </script>


    </body>
</html>
