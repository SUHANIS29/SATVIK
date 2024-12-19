<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify OTP</title>
</head>
<body>
    <h2>OTP Verification</h2>
    <form action="VerifyOTP" method="post">
        <label for="otp">Enter OTP:</label>
        <input type="text" name="otp" required>
        <button type="submit">Verify</button>
    </form>

    <p>${sessionScope.message}</p>
</body>
</html>
