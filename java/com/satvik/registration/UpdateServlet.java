package com.satvik.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id")); // Reading id from the form
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid recipe ID");
            return; // Stop further processing if ID is invalid
        }

        String recipeName = request.getParameter("recipe_name");
        String ingredients = request.getParameter("ingredients");
        String procedures = request.getParameter("procedures");

        String updateQuery = "UPDATE recipes SET recipe_name=?, ingredients=?, procedures=? WHERE id=?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(updateQuery)) {
            statement.setString(1, recipeName);
            statement.setString(2, ingredients);
            statement.setString(3, procedures);
            statement.setInt(4, id);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("list"); // Redirect to the list of recipes after update
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Recipe not found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating recipe");
        }
    }

    // Database connection utility method
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/RecipeDB"; // Update with your DB URL
        String user = "root"; // Update with your DB username
        String password = "root"; // Update with your DB password
        return DriverManager.getConnection(url, user, password);
    }
}
