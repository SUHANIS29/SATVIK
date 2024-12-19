<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Satvik</title>
    <link rel="stylesheet" href="secondhome.css"> <!-- Update path -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&family=Sacramento&display=swap" rel="stylesheet">
    <style>
        .category-box {
            position: relative; /* Ensures absolute positioning works if needed */
            cursor: pointer; 
            /* Changes cursor to pointer on hover */
        }
        
        .home{
        background-color:  #B3E4B2;
        border-radius: 10px;}

        .category-title {
            cursor: pointer; /* Ensures cursor is pointer on category title buttons */
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="ogo.jpeg" height="70" width="180" alt="Satvik Logo"> <!-- Update path -->
        </div>
        <div class="head">
            <div class="home" onclick="document.location='http://localhost:8080/signup/home.html'">Home</div>
            <button class="login" onClick="document.location='http://localhost:8080/signup/h.html'">
                Log out 
            </button>
        </div>
    </header>

    <main>
        <section class="intro">
            <h2>Something Healthy<br>Something Tasty</h2>
            <p>
               Embrace sustainable living with our food guide, featuring eco-friendly recipes and seasonal produce tailored to your region.
                Discover delicious meals and local ingredients for mindful eating.
            </p>
        </section>
        
        <section class="categories">
            <div class="category-box">
                <img src="healthy-recipes.png" alt="Healthy Recipes" height="120"> <!-- Update path -->
                <button onclick="document.location='http://localhost:8080/signup/r1.html'" class="category-title">
                    Healthy Recipes <span class="arrow"><i class="fa-solid fa-arrow-right"></i></span>
                </button>
            </div>
            
            <div class="category-box">
                <img src="cook - Copy.jpeg" alt="Healthy Recipes" height="120"> <!-- Update path -->
                <button onclick="document.location='http://localhost:8080/signup/data.jsp'" class="category-title">
                    My Recipe Hub<span class="arrow"><i class="fa-solid fa-arrow-right"></i></span>
                </button>
            </div>
            
            <div class="category-box">
                <img src="Designer (1).jpg" alt="Seasonal Food" height="120"> <!-- Update path -->
                <button onclick="document.location='http://localhost:8080/signup/newregion.jsp'" class="category-title">
                    Seasonal Food <span class="arrow"><i class="fa-solid fa-arrow-right"></i></span>
                </button>
            </div>
        </section>
    </main>
</body>
</html>
