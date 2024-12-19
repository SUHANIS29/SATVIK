<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Recipe</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeDB", "root", "root");
            
            String sql = "DELETE FROM recipes WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Show alert and redirect to data.jsp
    %>
                <script>
                    alert("Recipe deleted successfully.");
                    window.location.href = "data.jsp";
                </script>
    <%
            } else {
                out.println("No recipe found with the specified ID.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.toString());
            e.printStackTrace();
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
