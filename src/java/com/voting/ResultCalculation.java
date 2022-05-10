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
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class ResultCalculation extends HttpServlet {

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
            out.println("<title>Servlet ResultCalculation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResultCalculation at " + request.getContextPath() + "</h1>");
            out.println("checkpoint 0");
            try {
                out.println("checkpoint 1");
                String post[] = {"GS", "CS", "SS", "LR", "JCS", "JSS", "JLR"};
                int winner[] = new int[10];
                out.println("checkpoint 2");
                String winner_names[]= {"","","","","","",""};
                String branch[]= {"","","","","","",""};
                String year[]= {"","","","","","",""};
                String photo[]= {"","","","","","",""};
                Class.forName("com.mysql.jdbc.Driver");

                out.println("checkpoint 5");
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                for (int i = 0; i < 7; i++) {
                    String q = "select count(*) as count," + post[i] + " from votes group by " + post[i]+" order by count desc";

                    PreparedStatement pst = con.prepareStatement(q);
                    ResultSet res = pst.executeQuery();
                    res.next();
                    winner[i] = res.getInt(post[i]);
                    
                    String q1="select u.First_Name as fname, u.Middle_Name as mname, u.Last_Name as lname, a.branch as branch, a.year as year, a.photo as photo from users u, applicant a where u.MoodleID=a.MoodleID and u.MoodleID = "+winner[i];
                    PreparedStatement pst1 = con.prepareStatement(q1);
                    ResultSet res1 = pst1.executeQuery();
                    res1.next();
                    winner_names[i]=res1.getString("fname")+" "+res1.getString("mname")+" "+res1.getString("lname");
                     branch[i]=res1.getString("branch");
                     year[i]=res1.getString("year");
                     photo[i]="applicant_images/"+res1.getString("photo");
                }  
                
//                for (int i = 0; i < 7; i++) {
//                    out.println(winner_names[i]+branch[i]+year[i]);
//                    
//                }
                request.setAttribute("winner_names", winner_names);
                
                request.setAttribute("branch", branch);
                
                request.setAttribute("year", year);
                
                request.setAttribute("photo", photo);
                
                 RequestDispatcher rd;
              
//                 rd = request.getRequestDispatcher("result.jsp");
//                 rd.forward(request, response);
                 rd = request.getRequestDispatcher("resultdisplay.jsp");
                 rd.forward(request, response);
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
