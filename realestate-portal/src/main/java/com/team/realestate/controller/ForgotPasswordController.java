package com.team.realestate.controller;

import java.sql.Timestamp;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.realestate.dao.UserDAO;
import com.team.realestate.model.User;
import com.team.realestate.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ForgotPasswordController {

    @Autowired
    private EmailService emailService;

    private UserDAO userDao = new UserDAO();

    // ─────────────────────────────────────────
    // FORGOT PASSWORD — POST
    // User submits email → send reset link
    // ─────────────────────────────────────────
    @PostMapping("/forgot-password")
    public String handleForgotPassword(@RequestParam("email") String email,
                                       HttpServletRequest request,
                                       Model model) {

        email = email != null ? email.trim() : "";

        if (email.isEmpty()) {
            model.addAttribute("error", "Please enter your email address.");
            return "auth/forgot_password";
        }

        User user = userDao.getUserByEmail(email);

        // Always show success message even if email not found (security best practice)
        // This prevents user enumeration attacks
        if (user == null) {
            model.addAttribute("success", "If this email is registered, you will receive a reset link shortly.");
            return "auth/forgot_password";
        }

        // Generate unique token
        String token = UUID.randomUUID().toString();

        // Set expiry to 30 minutes from now
        long expiryTime = System.currentTimeMillis() + (30 * 60 * 1000);
        Timestamp expiry = new Timestamp(expiryTime);

        // Save token to DB
        userDao.saveResetToken(email, token, expiry);

        // Build reset link
        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        String resetLink = baseUrl + "/reset-password?token=" + token;

        // Send email
        emailService.sendResetEmail(email, resetLink);

        model.addAttribute("success", "A password reset link has been sent to your email. It expires in 30 minutes.");
        return "auth/forgot_password";
    }

    // ─────────────────────────────────────────
    // RESET PASSWORD — GET
    // User clicks link in email → show reset form
    // ─────────────────────────────────────────
    @GetMapping("/reset-password")
    public String showResetForm(@RequestParam("token") String token, Model model) {

        if (token == null || token.trim().isEmpty()) {
            model.addAttribute("error", "Invalid or missing reset token.");
            return "auth/reset_password";
        }

        User user = userDao.getUserByResetToken(token);

        if (user == null) {
            // Token not found or expired
            model.addAttribute("tokenExpired", true);
            model.addAttribute("error", "This reset link has expired or is invalid. Please request a new one.");
            return "auth/reset_password";
        }

        // Token is valid — show the form
        model.addAttribute("token", token);
        return "auth/reset_password";
    }

    // ─────────────────────────────────────────
    // RESET PASSWORD — POST
    // User submits new password
    // ─────────────────────────────────────────
    @PostMapping("/reset-password")
    public String handleResetPassword(@RequestParam("token") String token,
                                      @RequestParam("password") String password,
                                      @RequestParam("confirmPassword") String confirmPassword,
                                      Model model) {

        // Re-validate token
        User user = userDao.getUserByResetToken(token);

        if (user == null) {
            model.addAttribute("tokenExpired", true);
            model.addAttribute("error", "This reset link has expired. Please request a new one.");
            return "auth/reset_password";
        }

        // Validate passwords
        if (password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
            model.addAttribute("token", token);
            model.addAttribute("error", "Both password fields are required.");
            return "auth/reset_password";
        }

        if (password.length() < 6) {
            model.addAttribute("token", token);
            model.addAttribute("error", "Password must be at least 6 characters long.");
            return "auth/reset_password";
        }

        if (!password.equals(confirmPassword)) {
            model.addAttribute("token", token);
            model.addAttribute("error", "Passwords do not match.");
            return "auth/reset_password";
        }

        // Hash new password and update DB
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        userDao.updatePasswordAndClearToken(user.getEmail(), hashedPassword);

        // Redirect to login with success message
        return "redirect:/page?name=login&passwordReset=success";
    }
}