/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.login;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "LoginServlet_main", urlPatterns = {"/LoginServlet_main"})
public class LoginServlet_main extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet_main</title>");
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>Servlet LoginServlet_main at " + request.getContextPath() + "</h1>");
            String EMAIL = request.getParameter("email");
            String PASSWORD = request.getParameter("password");
            String CAPVAL = request.getParameter("invalidcap");
            
            //int elen = EMAIL.length();
//            if (EMAIL.charAt(elen - 1) == '#' && EMAIL.charAt(elen - 2) == '#') {
//                out.println("ACCESS DENIED");
//            }
            //out.println(EMAIL + "  " + PASSWORD);
//                long millis = System.currentTimeMillis();
//                java.sql.Date dateNow = new java.sql.Date(millis);
//                out.println(dateNow);
//                RequestDispatcher rd;
//                request.setAttribute("dn",dateNow);
//                rd = request.getRequestDispatcher("ApplicantInfoDisp");
//                rd.forward(request, response);
            HttpSession session = request.getSession();
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                //query...
                String q0 = "SELECT * FROM users WHERE email='" + EMAIL + "'";
                PreparedStatement pst = con.prepareStatement(q0);
                ResultSet result1 = pst.executeQuery(q0);
                String fname, status = "", MID = "";
                //validator login
                if(CAPVAL.equals("invalid")){
                     status = "Invalid Captcha";
                    session.setAttribute("status", status);
                   RequestDispatcher rd;
                rd = request.getRequestDispatcher("login-main.jsp");
                rd.forward(request, response);
                }
                else if (result1.next()) {
                    String pwcheck = result1.getString("password");
                    if (EMAIL.equals("Validator@Digivoter") && pwcheck.equals(PASSWORD)) {
                        response.sendRedirect("validator-home.jsp");
                    } else if (pwcheck.equals(PASSWORD)) {
                        status = "Login Successful";

                        fname = result1.getString("First_Name");
                        MID = result1.getString("MoodleID");
                        session.setAttribute("fname", fname);
                        session.setAttribute("status", status);
                        session.setAttribute("email", EMAIL);
                        session.setAttribute("MoodleID", MID);
                         String q2 = "SELECT * FROM applicant votes WHERE MoodleID='" + MID + "'";
                        PreparedStatement pst2 = con.prepareStatement(q2);
                        ResultSet result3 = pst2.executeQuery(q2);
                        if (result3.next()) {
                            Cookie c2 = new Cookie("appl-status", "applied");
                            response.addCookie(c2);
                        } else {
                            Cookie c2 = new Cookie("appl-status", "not-applied");
                            response.addCookie(c2);
                        }
                        String q1 = "SELECT * FROM votes votes WHERE VoterID='" + MID + "'";
                        PreparedStatement pst1 = con.prepareStatement(q1);
                        ResultSet result2 = pst1.executeQuery(q1);

                        Cookie c = new Cookie("MIDc", MID);
                        response.addCookie(c);
                        if (result2.next()) {
                            Cookie c1 = new Cookie("voting-status", "voted");
                            response.addCookie(c1);
                        } else {
                            Cookie c1 = new Cookie("voting-status", "not-voted");
                            response.addCookie(c1);
                        }

                        response.sendRedirect("DateChecker"); //check date
                        //response.sendRedirect("studentPortal.jsp");
                    } else {
                        status = "Invalid Password";
                        session.setAttribute("status", status);
                        response.sendRedirect("login-main.jsp");
                    }
                } else {
                    status = "Account doesn't exist!";
                    session.setAttribute("status", status);
                    response.sendRedirect("login-main.jsp");
                }
                while (result1.next()) {
                    out.println(result1.getString(1));
                    out.println(result1.getString(2));
                }
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
