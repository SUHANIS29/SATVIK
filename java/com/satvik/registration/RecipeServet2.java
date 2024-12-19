package com.satvik.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Recipe Model Class
class Recipe {
    private int id;
    private String recipeName;
    private String ingredients;
    private String procedures;

    // Constructor
    public Recipe(int id, String recipeName, String ingredients, String procedures) {
        this.id = id;
        this.recipeName = recipeName;
        this.ingredients = ingredients;
        this.procedures = procedures;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public String getIngredients() {
        return ingredients;
    }

    public String getProcedures() {
        return procedures;
    }
}

// RecipeServlet Class
@WebServlet("/list")
public class RecipeServet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Recipe> recipeList = new ArrayList<>();
        String query = "SELECT * FROM recipes";

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String recipeName = resultSet.getString("recipe_name");
                String ingredients = resultSet.getString("ingredients");
                String procedures = resultSet.getString("procedures");
                recipeList.add(new Recipe(id, recipeName, ingredients, procedures));
            }

            // Debugging output
            System.out.println("Number of recipes retrieved: " + recipeList.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("listRecipe", recipeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("data.jsp");
        dispatcher.forward(request, response);
    }

    // Database connection utility method
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/RecipeDB"; // Update with your DB URL
        String user = "root"; // Update with your DB username
        String password = "root"; // Update with your DB password
        return DriverManager.getConnection(url, user, password);
    }
}
