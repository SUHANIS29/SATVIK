package com.satvik.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher rd = null;

        if (uemail == null || uemail.isEmpty() || upwd == null || upwd.isEmpty()) {
            request.setAttribute("errorMessage", "Email and password must not be empty!");
            rd = request.getRequestDispatcher("login.jsp");
        } else if (validLogin(uemail, upwd, session)) {
            rd = request.getRequestDispatcher("index.jsp");
            session.setAttribute("name", uemail);
        } else {
            rd = request.getRequestDispatcher("login.jsp");
            request.setAttribute("errorMessage", "Invalid username or password!");
            session.removeAttribute("name");  // Clear session attribute on failure
        }

        rd.forward(request, response);
    }

    // Method to validate login credentials
    private boolean validLogin(String uemail, String upwd, HttpSession session) {
        boolean status = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false", "root", "root");

            // SQL query to check if the user exists with the provided credentials
            String sql = "SELECT * FROM users WHERE uemail = ? AND upwd = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, uemail);
            ps.setString(2, upwd);

            rs = ps.executeQuery();

            // If credentials match, return true and set session attribute
            if (rs.next()) {
                session.setAttribute("name", rs.getString("uname"));
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close all resources to prevent memory leaks
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return status; // Return whether the login was successful
    }
}
