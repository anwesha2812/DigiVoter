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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
            int elen = EMAIL.length();
//            if (EMAIL.charAt(elen - 1) == '#' && EMAIL.charAt(elen - 2) == '#') {
//                out.println("ACCESS DENIED");
//            }
            //out.println(EMAIL + "  " + PASSWORD);

            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                //query...
                String q0 = "SELECT * FROM users WHERE email='" + EMAIL+"'";
                PreparedStatement pst = con.prepareStatement(q0);
                ResultSet result1 = pst.executeQuery(q0);
                
                String fname, status;
                
                if (result1.next()) {
                    String pwcheck = result1.getString("password");
                    if (pwcheck.equals(PASSWORD)) {
                        status="Login Successful";
                        response.sendRedirect("studentPortal.jsp");
                        fname=result1.getString("First_Name");
                        HttpSession session = request.getSession();
                        session.setAttribute("fname",fname);
                        session.setAttribute("status", status);
                        session.setAttribute("email",EMAIL);
                    } else {
                        status="Invalid Password";
                        response.sendRedirect("login-main.jsp");
                    }
                } else {
                    status="Account doesn't exist! Please create an account";
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
