package com.satvik.registration;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class FoodInfoServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  // *doGet method starts here*
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // *1. Corrected MIME type*
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    // *Get request parameters*
    String region = request.getParameter("region");
    String state = request.getParameter("state");
    String season = request.getParameter("season");
    String foodType = request.getParameter("food_type");

    // *2. Input validation to avoid null or empty values*
    if (region == null || region.isEmpty() || state == null || state.isEmpty()) {
      out.println("<h3>Invalid input. Please provide valid region and state.</h3>");
      return;  // *Exit early if input is invalid*
    }

    // *JDBC variables*
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
      // *3. Use try-with-resources to manage resources (Connection, PreparedStatement, ResultSet)*
      Class.forName("com.mysql.cj.jdbc.Driver");

      // *Create connection (try-with-resources for auto-closing)*
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/newguide?useSSL=false", "root", "root");

      // *SQL query to search food info*
      String sql = "SELECT  f.FNAME AS Food_Item FROM availablity JOIN fooditem f ON a.F_ID = f.F_ID JOIN region r ON a.rid = r.rid  JOIN season s ON a.SID = s.SID JOIN food_details fd ON a.F_ID = fd.F_ID WHERE r.rid = ? AND S.SID =? AND F.FTYPE=?";
      		
      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setString(1, region);
      //preparedStatement.setString(2, state);
      preparedStatement.setString(3, season);
      preparedStatement.setString(4, foodType);

      // *Execute query*
      resultSet = preparedStatement.executeQuery();

      // *Display results*
      out.println("<h2>Food Information Results</h2>");
      boolean found = false;

      // *4. Process resultSet*
      while (resultSet.next()) {
        found = true;
        int id = resultSet.getInt("id");
        String resRegion = resultSet.getString("region");
        String resState = resultSet.getString("state");
        String resSeason = resultSet.getString("season");
        String resFoodType = resultSet.getString("food_type");

        // *Output food info*
        out.println("ID: " + id + "<br>");
        out.println("Region: " + resRegion + "<br>");
        out.println("State: " + resState + "<br>");
        out.println("Season: " + resSeason + "<br>");
        out.println("Food Type: " + resFoodType + "<br><br>");
      }

      // *5. Handle no results scenario with proper messaging*
      if (!found) {
        out.println("<h3>No results found for the given information.</h3>");
        // *Optional: Forward to a custom page for no results*
        RequestDispatcher rd = request.getRequestDispatcher("noResults.jsp");
        rd.include(request, response); // or rd.forward(request, response);
      } else {
        // *6. Forward to details.html after displaying results*
        RequestDispatcher rd = request.getRequestDispatcher("details.html");
        rd.forward(request, response);
      }

    } catch (Exception e) {
      e.printStackTrace();
      // *7. Improved error message for user experience*
      out.println("<h3>An error occurred while processing your request. Please try again later.</h3>");
      log("Error while fetching food information: ", e);

    } finally {
      // *8. Close resources manually, still a good fallback in case of issues*
      try {
        if (resultSet != null) resultSet.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
      } catch (SQLException se) {
        se.printStackTrace();
      }
    }
  }

  // *doPost calls doGet, so changes apply here as well*
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}