package com.satvik.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String query = "DELETE FROM recipes WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("list"); // Redirect to the recipe list page
    }

    // Database connection utility method
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/RecipeDB";
        String user = "root";
        String password = "root";
        return DriverManager.getConnection(url, user, password);
    }
}
