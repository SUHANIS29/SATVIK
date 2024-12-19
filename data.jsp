<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recipe List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <script>
    function confirmDelete(id) {
        if (confirm("Are you sure you want to delete this recipe?")) {
            window.location.href = 'deleteRecord.jsp?id=' + id;
        }
    }
</script>
   
</head>
<body>
<style>
.head {
    height: 70px;
    width: 75%;
    top: -2px;
    position: absolute;
    left: 20%;
    display: flex;
    text-align: center;
    align-items: center;
    flex-direction: row;
    justify-content: space-between; /* Keep space between items */
}

.head .login {
    margin-left: auto; /* Push the logout button to the right */
    margin-top: 20px;
    height: 30px;
    width: 120px;
    font-size: 17px;
    font-weight: 700;
    cursor: pointer;
    background: none;
    text-decoration: none;
    border: none;
    border-bottom: 2px solid rgb(9, 51, 9); /* Add same border as nav buttons */
    transition: background-color 0.3s, border-color 0.3s; /* For smooth transitions */
}

.head .login:hover {
    background-color: #B3E4B2; /* Hover effect */
    border-radius: 10px; /* Rounded corners on hover */
    border-color: transparent; /* Remove bottom border color on hover */
}

.head .nav-button {
    margin-left: 10px; /* Reduced margin */
    margin-top: 20px;
    height: 30px;
    text-align: center;
    align-content: center;
    width: 90px;
    color: rgb(10, 36, 10);
    font-size: 17px;
    font-weight: 700;
    cursor: pointer;
    border-bottom: 2px solid rgb(9, 51, 9);
    transition: background-color 0.3s;
}

#recipes {
    
   
}

.head .nav-button:hover {
    background-color: #B3E4B2;
    border-radius: 10px;
}

.head .login i {
    margin-left: 10px;
    color: rgb(10, 36, 10);
}
header{

border-bottom: 2px solid green;
}
tr:nth-child(even){
background-color: #B3E4B2;
}
.thead-light tr th:nth-child(even){
text-align: center;
background-color: darkgreen;
color: white;}

.thead-light tr th:nth-child(odd){
text-align: center;
background-color: darkgreen;
color: white;}

#conmt5 button{

position: relative;
top: 8vh;

background-color: green;
color: white;
border-radius: 5px;
height: 40px;


}
#upd{
 

margin-bottom: 10px;

}

#myhub{
width: 18%;
background-color: #B3E4B2;
border-radius: 10px;
}
#conmt5{
margin-top: -8%;
background-color: lightyellow;}
</style>
<header>
        <img src="ogo.jpeg" class="logo" alt="Logo" height="70" width="230">
        
        <div class="head">
            <div class="nav-button" onclick="document.location='http://localhost:8080/signup/secondhome.jsp'">Home</div>
            <div class="nav-button" onclick="document.location='http://localhost:8080/signup/newregion.jsp'">Seasonal</div>
            <div class="nav-button" id="recipes" onclick="document.location='http://localhost:8080/signup/r1.html'">Recipes</div>
            <div class="nav-button" id="myhub" onclick="document.location='http://localhost:8080/signup/data.jsp'">My Recipe Hub</div>
            <button class="login" onclick="document.location='http://localhost:8080/signup/h.html'">
   
                Log Out
            </button>
        </div>
    </header>
<div class="container mt-5" id="conmt5">
    <button class="addrecipe" onclick="document.location='http://localhost:8080/signup/recipe-form.jsp'">Add Recipe</button>
    <h2 class="text-center" style="color: #0a5e0a;">Recipe List</h2> 
    <br><!-- Title in dark green -->
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>Recipe Name</th>
                <th>Ingredients</th>
                <th>Procedures</th>
                <th>Actions</th> <!-- Action Column -->
            </tr>
        </thead>
        <tbody>
<%
    ResultSet rs = null;
    Connection con = null;
    PreparedStatement ps = null; // Corrected variable name
    String query = "SELECT * FROM recipes";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class name
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RecipeDB", "root", "root"); // Corrected JDBC URL
        ps = con.prepareStatement(query);
        rs = ps.executeQuery();
        
        int rowIndex = 0; // Row index for alternating colors

        while (rs.next()) {
            String rowClass = (rowIndex % 2 == 0) ? "light-row" : "dark-row"; // Alternate row colors
            rowIndex++;
%>
            <tr class="<%= rowClass %>">
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td>
                    <a href="updateRecipe.jsp?id=<%= rs.getInt(1)%>" id="upd" class="btn btn-warning btn-sm">Update</a>
                <a href="#" id="del" class="btn btn-danger btn-sm" onclick="confirmDelete(<%= rs.getInt(1) %>)">Delete</a>
</td>
            </tr>
<%
        }
    } catch (Exception e) {
%>
            <tr>
                <td colspan="5" class="error-message">Error: <%= e.getMessage() %></td>
            </tr>
<%
    } finally {
        // Closing resources in the finally block
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                out.print("Error closing ResultSet: " + e.getMessage());
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                out.print("Error closing PreparedStatement: " + e.getMessage());
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                out.print("Error closing Connection: " + e.getMessage());
            }
        }
    }
%>
        </tbody>
    </table>
</div>
</body>
</html>
