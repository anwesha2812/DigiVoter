/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.redirections;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class DateChecker extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DateChecker</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DateChecker at " + request.getContextPath() + "</h1>");

            java.util.Date date = new java.util.Date();
            long millis = System.currentTimeMillis();
            java.sql.Date dateNow = new java.sql.Date(millis);
            //out.println(dateNow);

            //java.sql.Date dateNow=(java.sql.Date) request.getAttribute("dn");
            //long l=0;
            java.sql.Date openappl = new java.sql.Date(423849600);
            java.sql.Date closeappl = new java.sql.Date(423849600);
            java.sql.Date openvote = new java.sql.Date(423849600);
            java.sql.Date closevote = new java.sql.Date(423849600);
            try {
//                    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//                    response.setHeader("Pragma", "no-cache");
//                    response.setHeader("Expires", "0");
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdv", "root", "");
                String qd = "select * from dates;";
                PreparedStatement pst = con.prepareStatement(qd);
                ResultSet res = pst.executeQuery(qd);
                //Date openappl=new Date();

                while (res.next()) {
                    openappl = res.getDate(2);
                    closeappl = res.getDate(3);
                    openvote = res.getDate(4);
                    closevote = res.getDate(5);
                }
                //To compare with date in db
                SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date dn = sdformat.parse(dateNow.toString());
                java.util.Date doa = sdformat.parse(openappl.toString());
                java.util.Date dca = sdformat.parse(closeappl.toString());
                java.util.Date dov = sdformat.parse(openvote.toString());
                java.util.Date dcv = sdformat.parse(closevote.toString());
                
                
                int vis=0;
                String b;
                if (dn.compareTo(doa) <= 0) {
                    b = "boa";
                    vis=1;
                } else if (dn.compareTo(doa) >= 0 && dn.compareTo(dca) < 0) {
                    b = "oa-ca";
                    vis=2;
                } else if (dn.compareTo(dca) >= 0 && dn.compareTo(dov) < 0) {
                    String q1 = "select status from applicant where status is NULL";
                    PreparedStatement pst1 = con.prepareStatement(q1);
                    ResultSet res1 = pst1.executeQuery();
                    
                    if (res1.next()) {
                        b="candidate-not-finalized";
                        vis=3;
                    }else{
                        b="dispcandinfo"; 
                        vis = 4;//and voting will begin soon
                    }
                } else if (dn.compareTo(dov) >= 0 && dn.compareTo(dcv) < 0) {
                    String voting_status;
                    Cookie[] cookie = request.getCookies();
                   if (cookie != null) {
                    for (Cookie cookies : cookie) {
                        if (cookies.getName().equals("voting-status")) {
                            voting_status=cookies.getValue();
                            out.println(voting_status);
                            if(voting_status.equals("voted")){
                                vis = 7;
                            }else{
                                vis = 5;//and candidate profile
                            }
                        }
                    }
                }
                    b = "dispvoteform";  
                    
                }else if (dn.compareTo(dcv) >= 0) {
                   b="dispresults";
                   vis=6;//think later
                }else  {
                    b = "false";
                    vis=-1;
                }

                out.println(dn.compareTo(dov));
                out.println(b);
                out.println(vis);
                String oa = openappl.toString();
                String ca = closeappl.toString();
                RequestDispatcher rd;
                request.setAttribute("vis", vis);
                request.setAttribute("oa", oa);
                request.setAttribute("ca", ca);
                request.setAttribute("b", b);
               rd = request.getRequestDispatcher("studentPortal.jsp");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DateChecker.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DateChecker.class.getName()).log(Level.SEVERE, null, ex);
        }
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
