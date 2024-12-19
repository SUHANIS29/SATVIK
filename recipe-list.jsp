<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Recipe_List Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <a href="https://www.javaguides.net" class="navbar-brand">Recipe Management</a>
            </div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Recipe</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container">
            <h3 class="text-center">List of Recipes</h3>
            <hr>
            <div class="container text-left">
                <a href="http://localhost:8080/signup/recipe-form.jsp" class="btn btn-success">Add New Recipe</a>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Recipe Name</th>
                        <th>Ingredients</th>
                        <th>Procedures</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="recipe" items="${listRecipe}">
                        <tr>
                            <td><c:out value="${recipe.id}" /></td>
                            <td><c:out value="${recipe.recipeName}" /></td>
                            <td><c:out value="${recipe.ingredients}" /></td>
                            <td><c:out value="${recipe.procedures}" /></td>
                            <td>
                                <a href="edit?id=<c:out value='${recipe.id}' />">Edit</a>
                                &nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="delete?id=<c:out value='${recipe.id}' />">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
