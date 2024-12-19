<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Recipe Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7e0; /* Light green background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #2d572c; /* Dark green */
        }

        .form-container {
            background-color: #ffffff;
            border: 2px solid #2d572c; /* Dark green border */
            border-radius: 8px;
            width: 400px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            color: #2d572c; /* Dark green */
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #2d572c;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="text"] {
            background-color: #f0fff0; /* Very light green */
        }

        input[type="text"]:focus {
            border-color: #57a957; /* Slightly brighter green */
            outline: none;
            background-color: #eaffea;
        }

        input[type="submit"] {
            background-color: #2d572c; /* Dark green */
            color: #ffffff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #57a957; /* Slightly brighter green */
        }

        .success-message {
            color: #57a957;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Update Recipe Details</h1>
        <form method="post" action="update-recipe.jsp">
            <%
                String id = request.getParameter("id");
                String JdbcURL = "jdbc:mysql://localhost:3306/RecipeDB";
                String username = "root";
                String password = "root";
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(JdbcURL, username, password);
                    st = con.createStatement();

                    String sql = "SELECT * FROM recipes WHERE id='" + id + "'";
                    rs = st.executeQuery(sql);

                    if (rs.next()) {
            %>
                        <div class="form-group">
                            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                            <label for="recipe_name">Recipe Name:</label>
                            <input type="text" id="recipe_name" name="recipe_name" value="<%= rs.getString("recipe_name") %>">
                        </div>

                        <div class="form-group">
                            <label for="ingredients">Ingredients:</label>
                            <input type="text" id="ingredients" name="ingredients" value="<%= rs.getString("ingredients") %>">
                        </div>

                        <div class="form-group">
                            <label for="procedures">Procedure:</label>
                            <input type="text" id="procedures" name="procedures" value="<%= rs.getString("procedures") %>">
                        </div>

                        <input type="submit" id="savebtn" value="Update Recipe">
                    <% 
                    } else {
                        out.println("<div class='success-message'>Recipe not found.</div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (st != null) try { st.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
                }
            %>
        </form>
    </div>
</body>
</html>
