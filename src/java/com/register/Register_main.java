/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
@WebServlet(name = "Register_main", urlPatterns = {"/Register_main"})
public class Register_main extends HttpServlet {

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
            out.println("<title>Servlet Register_main</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>Servlet Register_main at " + request.getContextPath() + "</h1>");
            
            String fname = request.getParameter("fname");
            String mname=request.getParameter("mname");
            String lname=request.getParameter("lname");
            String dob= request.getParameter("dob");
            String moodle= request.getParameter("moodleid");
            String gender=request.getParameter("gender");
            String mobile=request.getParameter("mobnum");
            String email=request.getParameter("email");
            String password=request.getParameter("password2");
//            out.println(fname + mname + lname);
//            out.println(dob);
//            out.println(gender);
//            out.println(mobile);
//            out.println(email);
//            out.println(password);
           String status="";
            HttpSession session = request.getSession();      //creating httpsession object
            //connection.........
           try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
            //query...http:/
            String q="INSERT INTO users(MoodleID,First_Name,Middle_Name,Last_Name,dob,gender,mobile,email,password)"
                    + " VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement pst=con.prepareStatement(q);
            pst.setString(1, moodle);
            pst.setString(2, fname);
            pst.setString(3, mname);
            pst.setString(4, lname);
            pst.setString(5, dob);
            pst.setString(6, gender);
            pst.setString(7, mobile);
            pst.setString(8, email);
            pst.setString(9, password);
            
            int result=pst.executeUpdate();
            //out.println(result+ "registration successful");
            if (result==1){
                status="Account Created Successfully";
                session.setAttribute("status", status);
                //out.println(status);
                response.sendRedirect("login-main.jsp");
            }
           }catch(ClassNotFoundException | SQLException e){
               if (e.toString().endsWith("for key 'email'"))
               {
                status="Account Exists. Please Login to continue.";
                session.setAttribute("status", status);
                //out.println(status);
                response.sendRedirect("login-main.jsp");
               }
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
