/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.applicant;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class SSInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SSInfo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SSInfo at " + request.getContextPath() + "</h1>");
            try {
                int count;
                HttpSession session = request.getSession(); 
                count = (int) session.getAttribute("count"); //count=0; set on student portal
                session.setAttribute("servletName", "SSInfo");
//                out.println(count);
                Class.forName("com.mysql.jdbc.Driver");
                String post = "SS";
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                //query...
                String q0 = "SELECT * FROM applicant WHERE post='" + post + "'and status='approved'";
                String YEAR, BRANCH, Q1, Q2, Q3, Q4, Q5, AGE, imgFileName, cvFileName;

                int MOODLEID;
                PreparedStatement pst = con.prepareStatement(q0, ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_UPDATABLE);
                ResultSet res = pst.executeQuery(q0);
                //int count=(int)request.getAttribute("count");
                out.println("hello2");
                //out.println(1);
                res.last();                         //points to last row in table
                int num;
                num = res.getRow();                 //to find index of last row
                out.println(count);
                if (count == num) {                 //sets count to 0 if count exceeds total rows
                    count = 0;
                }
                count++;                            //row starts at index 1
                res.absolute(count);                //points to specific row number
                MOODLEID = res.getInt("MoodleID");
                out.println(MOODLEID);
                YEAR = res.getString("year");
                BRANCH = res.getString("branch");
                AGE=res.getString("age");
                Q1 = res.getString("q1");
                Q2 = res.getString("q2");
                Q3 = res.getString("q3");
                Q4 = res.getString("q4");
                Q5 = res.getString("q5");
                imgFileName=res.getString("photo");
                cvFileName=res.getString("cv");
                String q1 = "SELECT * FROM users WHERE MoodleID='" + MOODLEID + "'";
                String FNAME = "", MNAME = "", LNAME = "";
                PreparedStatement pst1 = con.prepareStatement(q1);
                ResultSet rs = pst1.executeQuery(q1);
                while (rs.next()) {
                    FNAME = rs.getString("First_Name");         //Fetch name from user db using MoodleID
                    MNAME = rs.getString("Middle_Name");
                    LNAME = rs.getString("Last_Name");
                }

                out.println(FNAME + MNAME + LNAME);
                RequestDispatcher rd;
                //request.setAttribute("count", count);
                request.setAttribute("fname", FNAME);
                request.setAttribute("mname", MNAME);
                request.setAttribute("lname", LNAME);
                request.setAttribute("branch", BRANCH);
                request.setAttribute("post", "Sports Secretary");
                request.setAttribute("year", YEAR);
                request.setAttribute("age", AGE);
                request.setAttribute("q1", Q1);
                request.setAttribute("q2", Q2);
                request.setAttribute("q3", Q3);
                request.setAttribute("q4", Q4);
                request.setAttribute("q5", Q5);
                request.setAttribute("imgFileName",imgFileName);
                request.setAttribute("cvFileName",cvFileName); //ONLY ON VALIDATOR SIDE
                session.setAttribute("count", count);
                session.setAttribute("num", num);
                rd = request.getRequestDispatcher("candidate_template/candidates.jsp");
                rd.forward(request, response);
//                    break;
//                }   

            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
