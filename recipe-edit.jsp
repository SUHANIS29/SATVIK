<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Recipe</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Edit Recipe</h2>
    <form action="update" method="post">
        <input type="hidden" name="id" value="${recipe.id}" />
        <div class="form-group">
            <label for="recipeName">Recipe Name</label>
            <input type="text" class="form-control" id="recipeName" name="recipe_name" value="${recipe.recipeName}" required>
        </div>
        <div class="form-group">
            <label for="ingredients">Ingredients</label>
            <textarea class="form-control" id="ingredients" name="ingredients" required>${recipe.ingredients}</textarea>
        </div>
        <div class="form-group">
            <label for="procedures">Procedures</label>
            <textarea class="form-control" id="procedures" name="procedures" required>${recipe.procedures}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Recipe</button>
    </form>
</div>
</body>
</html>
