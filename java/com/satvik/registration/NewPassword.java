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
import javax.servlet.http.HttpSession;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle POST request for password reset
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get session and form parameters
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;

        // Check if passwords match
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the MySQL database
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false", "root", "root");

                // SQL query to update the user's password where the email matches the session email
                String query = "UPDATE users SET upwd = ? WHERE uemail = ?";
                pst = con.prepareStatement(query);
                pst.setString(1, newPassword);  // New password
                pst.setString(2, (String) session.getAttribute("email"));  // Email from session

                // Execute the update query
                int rowCount = pst.executeUpdate();

                // Check if the update was successful
                if (rowCount > 0) {
                    request.setAttribute("status", "resetSuccess");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                } else {
                    request.setAttribute("status", "resetFailed");
                    dispatcher = request.getRequestDispatcher("newPassword.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    // Close the database resources
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            // Forward the request and response
            dispatcher.forward(request, response);
        } else {
            // Passwords do not match, return to password reset page
            request.setAttribute("status", "passwordMismatch");
            dispatcher = request.getRequestDispatcher("newPassword.jsp");
            dispatcher.forward(request, response);
        }
    }
}
