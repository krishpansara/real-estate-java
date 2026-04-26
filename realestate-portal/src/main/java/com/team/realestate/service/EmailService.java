package com.team.realestate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendResetEmail(String toEmail, String resetLink) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(toEmail);
            helper.setSubject("Reset Your Password - Real Estate Portal");
            helper.setFrom("saniya.bloch10@gmail.com");

            String htmlContent = "<!DOCTYPE html>" +
                "<html>" +
                "<body style='font-family: Open Sans, sans-serif; background:#f4f4f4; padding:30px;'>" +
                "<div style='max-width:500px; margin:auto; background:#fff; border-radius:10px; padding:30px; box-shadow:0 2px 8px rgba(0,0,0,0.1);'>" +
                "<h2 style='color:#2c3e50;'>Password Reset Request</h2>" +
                "<p style='color:#555;'>Hello,</p>" +
                "<p style='color:#555;'>We received a request to reset your password. Click the button below to reset it.</p>" +
                "<p style='color:#555;'>This link will expire in <strong>30 minutes</strong>.</p>" +
                "<div style='text-align:center; margin:30px 0;'>" +
                "<a href='" + resetLink + "' " +
                "style='background:#2c3e50; color:#fff; padding:12px 30px; border-radius:6px; text-decoration:none; font-weight:bold;'>" +
                "Reset Password</a>" +
                "</div>" +
                "<p style='color:#999; font-size:12px;'>If you didn't request this, you can safely ignore this email.</p>" +
                "<hr style='border:none; border-top:1px solid #eee;'/>" +
                "<p style='color:#ccc; font-size:11px; text-align:center;'>Real Estate Portal &copy; 2025</p>" +
                "</div>" +
                "</body>" +
                "</html>";

            helper.setText(htmlContent, true); // true = HTML

            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}