package com.satvik.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addRecipe")
public class RecipeServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/RecipeDB?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "root"; // Replace with your DB password

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC Driver not found", e);
        }
    }

    // Handle GET requests by forwarding to the recipe form page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addRecipe.jsp").forward(request, response);
    }

    // Handle POST requests for adding recipes
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipeName = request.getParameter("recipe_name");
        String ingredients = request.getParameter("ingredients");
        String procedures = request.getParameter("procedures");

        response.setContentType("text/html");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO recipes (recipe_name, ingredients, procedures) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, recipeName);
            statement.setString(2, ingredients);
            statement.setString(3, procedures);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                response.getWriter().println("<script>alert('Recipe added successfully!'); window.location.href = 'data.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Error: Could not add recipe.'); window.location.href = 'data.jsp';</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Database error: " + e.getMessage() + "'); window.location.href = 'data.jsp';</script>");
        }
    }
}
