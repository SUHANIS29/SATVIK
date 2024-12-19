package com.satvik.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Recipe recipe = null;

        String query = "SELECT * FROM recipes WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                recipe = new Recipe(resultSet.getInt("id"),
                        resultSet.getString("recipe_name"),
                        resultSet.getString("ingredients"),
                        resultSet.getString("procedures"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("recipe", recipe);
        request.getRequestDispatcher("recipe-edit.jsp").forward(request, response); // Forward to an edit form JSP
    }

    // Database connection utility method
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/RecipeDB";
        String user = "root";
        String password = "root";
        return DriverManager.getConnection(url, user, password);
    }
}
