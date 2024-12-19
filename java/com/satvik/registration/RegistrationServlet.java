package com.satvik.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Register")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String umobile = request.getParameter("contact");
        String ustate = request.getParameter("state");

        RequestDispatcher rd = null;

        // Check for empty inputs
        if (uname == null || uname.isEmpty() || 
            uemail == null || uemail.isEmpty() || 
            upwd == null || upwd.isEmpty() || 
            umobile == null || umobile.isEmpty() || 
            ustate == null || ustate.isEmpty()) {
            
         
            request.setAttribute("status", "failed");
            rd = request.getRequestDispatcher("registration.jsp");
            rd.forward(request, response);
            return; // Stop further processing
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false", "root", "root");

            PreparedStatement ps = con.prepareStatement("INSERT INTO users (uname, uemail, upwd, umobile, ustate) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, uname);
            ps.setString(2, uemail);
            ps.setString(3, upwd);
            ps.setString(4, umobile);
            ps.setString(5, ustate);

            int count = ps.executeUpdate();
            rd = request.getRequestDispatcher("registration.jsp");
            if (count > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed"); 
            rd = request.getRequestDispatcher("registration.jsp");
        }

        
        if (rd != null) {
            rd.forward(request, response);
        }
    }
}
