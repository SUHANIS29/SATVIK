<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Add Recipe</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
    background-color: #B3E4B2;
    border-radius: 10px;
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

#myhub{
width: 15%;
 background-color: #B3E4B2;
border-radius: 10px;
}

.headline{
color:  #0a5e0a;
margin-left: 40%;
 
}

#save{

margin-top: 10px;
width: 90px;
}
</style>

	<header>
        <img src="ogo.jpeg" class="logo" alt="Logo" height="70" width="230">
        
        <div class="head">
           
            <div class="nav-button" id="myhub" onclick="http://localhost:8080/signup/data.jsp">My Recipe Hub</div>
            <button class="login" onclick="document.location='http://localhost:8080/signup/h.html'">
   
                Log Out
            </button>
        </div>
    </header>
	<br>
	<h3 class="headline">Add Recipe Details</h3>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				
					<form action="addRecipe" method="post">
    <label for="recipe_name">Recipe Name</label>
    <input type="text" name="recipe_name" id="recipe_name" class="form-control" required>

    <label for="ingredients">Ingredients</label>
    <textarea name="ingredients" id="ingredients" class="form-control" required></textarea>

    <label for="procedures">Procedures</label>
    <textarea name="procedures" id="procedures" class="form-control"required></textarea>
    <button type="submit" id="save" class="btn btn-success" onclick="document.location='http://localhost:8080/signup/data.jsp'">Save</button>
</form>
					
			</div>
		</div>
	</div>
</body>
</html>