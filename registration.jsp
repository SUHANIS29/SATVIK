<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Satvik: Sign Up</title>
    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">
    <style>
        body {
            background-color: #046B02; /* Apply background color */
        }

        /* Custom select dropdown */
        .choose_state {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .choose_state select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-color: white;
            background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%20width%3D%2218px%22%20height%3D%2218px%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M7%209.5l5%205%205-5z%22/%3E%3C/svg%3E');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 18px;
            cursor: pointer;
        }

        .choose_state select:focus {
            border-color: #76b7e9;
            outline: none;
        }

        /* To fix the dropdown arrow overlapping with text */
        .choose_state select::-ms-expand {
            display: none;
        }
     .form-submit {
    background-color: #046B02;
    color: white; /* Set the text color to white initially */
    border: none; /* Optional: removes the default button border */
}

.form-submit:hover {
    background-color: #fff; /* Change the background color to white */
    color: #fff; /* Change the text color to green to make it readable */
    border: 1px solid #046B02; /* Optional: Add a green border for better visibility */
}
.signup-form h2{
color:#046B02
}
    </style>
</head>
<body>

<!-- Hidden input to pass the registration status -->
<input type="hidden" id="status" value="<%= request.getAttribute("status") != null ? request.getAttribute("status") : "" %>">

<div class="main">
    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>
                    <form method="post" action="Register" class="register-form" id="register-form">
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="name" id="name" placeholder="Your Name" required/>
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label>
                            <input type="email" name="email" id="email" placeholder="Your Email" required/>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="Password" pattern="^[a-zA-Z0-9]{1,8}$" title="Password must be alphanumeric and up to 8 characters long." maxlength="8" required/>
                        </div>
                        <div class="form-group">
                            <label for="contact"><i class="zmdi zmdi-phone"></i></label>
                            <input type="text" name="contact" id="contact" required placeholder="Contact no" />
                        </div>
                        <div class="choose_state">
                            <select id="state" name="state" required>
                                <option value="" disabled selected>Select your state</option>
                                <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands (AN)</option>
                                <option value="Andhra Pradesh">Andhra Pradesh (AP)</option>
                                <option value="Arunachal Pradesh">Arunachal Pradesh (AR)</option>
                                <option value="Assam">Assam (AS)</option>
                                <option value="Bihar">Bihar (BR)</option>
                                <option value="Chandigarh">Chandigarh (CH)</option>
                                <option value="Chhattisgarh">Chhattisgarh (CT)</option>
                                <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu (DN)</option>
                                <option value="Delhi">Delhi (DL)</option>
                                <option value="Goa">Goa (GA)</option>
                                <option value="Gujarat">Gujarat (GJ)</option>
                                <option value="Haryana">Haryana (HR)</option>
                                <option value="Himachal Pradesh">Himachal Pradesh (HP)</option>
                                <option value="Jammu and Kashmir">Jammu and Kashmir (JK)</option>
                                <option value="Jharkhand">Jharkhand (JH)</option>
                                <option value="Karnataka">Karnataka (KA)</option>
                                <option value="Kerala">Kerala (KL)</option>
                                <option value="Ladakh">Ladakh (LA)</option>
                                <option value="Lakshadweep">Lakshadweep (LD)</option>
                                <option value="Madhya Pradesh">Madhya Pradesh (MP)</option>
                                <option value="Maharashtra">Maharashtra (MH)</option>
                                <option value="Manipur">Manipur (MN)</option>
                                <option value="Meghalaya">Meghalaya (ML)</option>
                                <option value="Mizoram">Mizoram (MZ)</option>
                                <option value="Nagaland">Nagaland (NL)</option>
                                <option value="Odisha">Odisha (OR)</option>
                                <option value="Puducherry">Puducherry (PY)</option>
                                <option value="Punjab">Punjab (PB)</option>
                                <option value="Rajasthan">Rajasthan (RJ)</option>
                                <option value="Sikkim">Sikkim (SK)</option>
                                <option value="Tamil Nadu">Tamil Nadu (TN)</option>
                                <option value="Telangana">Telangana (TG)</option>
                                <option value="Tripura">Tripura (TR)</option>
                                <option value="Uttar Pradesh">Uttar Pradesh (UP)</option>
                                <option value="Uttarakhand">Uttarakhand (UT)</option>
                                <option value="West Bengal">West Bengal (WB)</option>
                            </select>
                        </div>
                       <!--   <div class="form-group form-button">
                            <button type="submit" name="signin" id="signin" class="form-submit">Register</button>
                        </div>-->
                        <div class="form-group form-button">
    <button type="submit" name="signin" id="signin" class="form-submit" style="background-color: #046B02;">Register</button>
</div>
                        
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="images/signup.png" alt="sign up image">
                    </figure>
                    <a href="login.jsp" class="signup-image-link">I am already a member</a>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
    var status = document.getElementById("status").value;

    if (status === "success") {
        swal({
            title: "Success!",
            text: "Account created successfully!",
            icon: "success"
        }).then(() => {
            window.location.href = "login.jsp";
        });
    } else if (status === "failed") {
        swal("Error!", "You are already a member. Please login.", "error");
    }
</script>

</body>
</html>
