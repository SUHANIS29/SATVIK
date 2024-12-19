package com.satvik.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/VerifyOTP")
public class VerifyOTPServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String enteredOtp = request.getParameter("otp");

        // Retrieve the actual OTP from the session
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        if (enteredOtp != null && Integer.parseInt(enteredOtp) == otp) {
            session.setAttribute("message", "Email verified successfully!");
        } else {
            session.setAttribute("message", "Invalid OTP. Please try again.");
        }

        response.sendRedirect("result.jsp");
    }
}
