/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class Submit_JLR extends HttpServlet {

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
            out.println("<title>Servlet Submit_JLR</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Submit_JLR at " + request.getContextPath() + "</h1>");
              try {
                 String VOTERID="";
                Cookie[] cookies = request.getCookies();

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("MIDc")) {
                            VOTERID=cookie.getValue();  
                        }
                    }
                }
                out.println("checkpoint 1");
                String vote = request.getParameter("vote");
                out.println("checkpoint 2");
                Class.forName("com.mysql.jdbc.Driver");
                out.println("checkpoint 3");
//            HttpSession session= request.getSession();
                out.println("checkpoint 4");
//            int moodle=(int)session.getAttribute("MoodleID");
//            out.println(moodle);
                out.println("checkpoint 5");
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                String q = "UPDATE VOTES SET JLR = (?) WHERE VoterID ="+VOTERID+";";
                PreparedStatement pst = con.prepareStatement(q);
             
                pst.setString(1, vote);

                int x = pst.executeUpdate();
                if (x > 0) {
                    out.println("successful");
                    Cookie c = new Cookie("voting-status","voted");
                    response.addCookie(c);
                    String q1 = "UPDATE users SET voteStatus = 'voted' WHERE MoodleID ="+VOTERID+";";
                    PreparedStatement pst1 = con.prepareStatement(q1);
                    int y = pst1.executeUpdate();
                    RequestDispatcher rd;
                    rd = request.getRequestDispatcher("voting-successful.jsp");
                    rd.forward(request, response);
                }
           
                
                //request.setAttribute("nextPost", "Submit_JLR");
                
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
