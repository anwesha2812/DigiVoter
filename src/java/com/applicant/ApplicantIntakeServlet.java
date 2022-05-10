/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
//\FINALDV\src\java\com\applicant\ApplicantIntakeServlet.java
package com.applicant;

import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream; 
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//
/**
 *
 * @author HP
 */
@MultipartConfig
@WebServlet(name = "ApplicantIntakeServlet", urlPatterns = {"/ApplicantIntakeServlet"})
public class ApplicantIntakeServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code.  */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ApplicantIntakeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplicantIntakeServlet at " + request.getContextPath() + "</h1>");
            String age = request.getParameter("age");
            String gender = request.getParameter("gender");
            String year = request.getParameter("year");
            String branch = request.getParameter("branch");
            String division = request.getParameter("division");
//            String moodle = request.getParameter("moodleId");  MOODLE ID COMES FROM COOKIE
            String post = request.getParameter("posts");
            String q1 = request.getParameter("q1");
            String q2 = request.getParameter("q2");
            String q3 = request.getParameter("q3");
            String q4 = request.getParameter("q4");
            String q5 = request.getParameter("q5");
            //System.out.println("I am alive");

            
            Part file = request.getPart("photo");
            String imageFileName = file.getSubmittedFileName();
            out.println("FILE NAME IS: " + imageFileName);
            String uploadPath = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/FINALDV/web/applicant_images/" + imageFileName;
            out.println("Upload path IS: " + uploadPath);
            
            Part cvfile = request.getPart("cv");
            String cvFileName = cvfile.getSubmittedFileName();
            out.println("FILE NAME IS: " + cvFileName);
            String uploadPathCV = "C:/Users/HP/OneDrive/Documents/NetBeansProjects/FINALDV/web/CV_applicants/"+cvFileName;
            out.println("Upload path IS: " + uploadPathCV);
            
            try{
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                
                FileOutputStream fos2 = new FileOutputStream(uploadPathCV);
                InputStream is2 = cvfile.getInputStream();
                byte[] data2 = new byte[is2.available()];
                is2.read(data2);
                fos2.write(data2);

//               ServletFileUpload sf= new ServletFileUpload(new DiskFileItemFactory());
//                List<FileItem> cvfile_file=sf.parseRequest((RequestContext) request);
//                cvfile_file.write(newFile())

            }catch(IOException e){
                out.println(e);
            
            }
            try {
                String USERID="";
                Cookie[] cookies = request.getCookies();

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("MIDc")) {
                            USERID=cookie.getValue();  
                        }
                    }
                }
                Class.forName("com.mysql.jdbc.Driver");

                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                String q = "INSERT INTO applicant(MoodleID,gender,year,branch,division,post,q1,q2,q3,q4,q5,age,photo,cv) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement pst = con.prepareStatement(q);
                pst.setString(1, USERID);
                pst.setString(2, gender);
                pst.setString(3, year);
                pst.setString(4, branch);
                pst.setString(5, division);
                pst.setString(6, post);
                pst.setString(7, q1);
                pst.setString(8, q2);
                pst.setString(9, q3);
                pst.setString(10, q4);
                pst.setString(11, q5);
                pst.setString(12, age);
                pst.setString(13, imageFileName);
                pst.setString(14, cvFileName);
                
                int result = pst.executeUpdate();
                if (result ==1) {
                    out.println("Successful");
                    
                    Cookie c = new Cookie("appl-status","applied");
                    response.addCookie(c);
                    response.sendRedirect("DateChecker");
                }else{
                    out.println("try again");
                }
               
            } catch (ClassNotFoundException | SQLException e ) {
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
