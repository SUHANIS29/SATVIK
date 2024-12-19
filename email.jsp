<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h2 {
            color: #333;
        }

        .input-box {
            margin: 20px 0;
        }

        input[type="email"], input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #046B02;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #046b02d9;
        }

        p {
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Email Verification</h2>

    <!-- Email Input Form -->
    <form action="SendOTP" method="post" id="emailForm">
        <div class="input-box">
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>
        <button type="submit">Send OTP</button>
    </form>

    <form action="VerifyOTP" method="post" id="otpForm" style="display: none;">
        <div class="input-box">
            <input type="text" name="otp" placeholder="Enter OTP" required>
        </div>
        <button type="submit">Verify OTP</button>
    </form>

    <p id="message"></p>
</div>

<script>
    // Show OTP form after email is submitted
    document.getElementById('emailForm').onsubmit = function() {
        document.getElementById('emailForm').style.display = 'none';
        document.getElementById('otpForm').style.display = 'block';
        return false; // For demonstration, prevents form submission in frontend
    };
</script>

</body>
</html>
