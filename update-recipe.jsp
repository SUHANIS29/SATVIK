<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Recipe</title>
</head>
<body>
    <a href="recipe-form.jsp">Insert Data</a>
    <a href="data.jsp">List Of Recipe</a>

    <%
        String id = request.getParameter("id");
        String recipe_name = request.getParameter("recipe_name");
        String ingredients = request.getParameter("ingredients");
        String procedures = request.getParameter("procedures");

        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeDB", "root", "root");

            // Check if the record exists
            String selectSQL = "SELECT * FROM recipes WHERE id = ?";
            PreparedStatement selectStmt = con.prepareStatement(selectSQL);
            selectStmt.setString(1, id);
            ResultSet rs = selectStmt.executeQuery();

            if (rs.next()) {
                out.println("Recipe found: " + rs.getString("recipe_name") + "<br>");
                
                // Proceed with the update
                String sql = "UPDATE recipes SET ingredients = ?, procedures = ? WHERE id = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, ingredients);
                ps.setString(2, procedures);
                ps.setString(3, id);

                int i = ps.executeUpdate();

                if (i > 0) {
    %>
                    <script>
                        alert("Recipe updated successfully.");
                        window.location.href = "data.jsp";
                    </script>
    <%
                } else {
                    out.println("Recipe update failed. Please check the recipe ID.");
                }
            } else {
                out.println("No recipe found with the given ID.<br>");
            }

            rs.close();
            selectStmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) try { ps.close(); } catch (Exception e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
