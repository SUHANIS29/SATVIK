package com.satvik.registration;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

@WebServlet("/SendOTP")
public class SendOTPServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Generate a random 6-digit OTP
        Random rand = new Random();
        int otp = 100000 + rand.nextInt(900000);

        // Save OTP in session
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);

        // Send OTP to the entered email
        try {
            sendOTPEmail(email, otp);
            session.setAttribute("message", "OTP sent to your email.");
            response.sendRedirect("verify.jsp"); 
        } catch (MessagingException e) {
            e.printStackTrace();
            session.setAttribute("message", "Failed to send OTP. Please try again.");
            response.sendRedirect("index.jsp");
        }
    }

    private void sendOTPEmail(String email, int otp) throws MessagingException {
        String host = "smtp.gmail.com";
        final String username = "your-email@gmail.com"; // Your Gmail email
        final String password = "your-email-password"; // Your Gmail password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("your-email@gmail.com"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("Your OTP for Email Verification");
        message.setText("Your OTP is: " + otp);

        Transport.send(message);
    }
}
