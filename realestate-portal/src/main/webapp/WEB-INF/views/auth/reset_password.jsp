<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - Real Estate</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login_style.css">

    <style>
        .error-message {
            color: #ff0000;
            font-size: 0.85rem;
            margin-top: 5px;
            display: none;
        }
        .input-error {
            border-color: #ff0000 !important;
        }
        .alert {
            border-radius: 8px;
            font-size: 0.9rem;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<main class="login-page">
    <div class="login-container">

        <!-- Left Section -->
        <section class="login-form-section">

            <!-- CASE 1: Token expired or invalid -->
            <% if(Boolean.TRUE.equals(request.getAttribute("tokenExpired"))) { %>

                <h1 class="login-title">Link Expired</h1>

                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <%= request.getAttribute("error") %>
                </div>

                <p style="color:#666; margin-top:15px;">
                    Please go back and request a new password reset link.
                </p>

                <a href="${pageContext.request.contextPath}/page?name=forgot_password"
                   class="login-btn"
                   style="display:block; text-align:center; text-decoration:none; margin-top:20px;">
                    <i class="fas fa-redo me-2"></i>Request New Link
                </a>

                <p class="signup-link" style="margin-top:15px;">
                    <a href="${pageContext.request.contextPath}/page?name=login">Back to Login</a>
                </p>

            <% } else { %>

                <!-- CASE 2: Valid token — show reset form -->
                <h1 class="login-title">Set New Password</h1>

                <p style="margin-bottom:20px; color:#666;">
                    Enter your new password below.
                </p>

                <!-- Server-side error -->
                <% if(request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <form class="login-form"
                      action="${pageContext.request.contextPath}/reset-password"
                      method="post"
                      novalidate>

                    <!-- Hidden token -->
                    <input type="hidden" name="token" value="${token}">

                    <!-- New Password -->
                    <div class="form-group">
                        <div class="form-input-wrapper">
                            <i class="fas fa-lock form-input-icon"></i>
                            <input type="password"
                                   class="form-input"
                                   id="password"
                                   name="password"
                                   placeholder="Enter new password">
                        </div>
                        <div class="error-message" id="passwordError"></div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group" style="margin-top:15px;">
                        <div class="form-input-wrapper">
                            <i class="fas fa-lock form-input-icon"></i>
                            <input type="password"
                                   class="form-input"
                                   id="confirmPassword"
                                   name="confirmPassword"
                                   placeholder="Confirm new password">
                        </div>
                        <div class="error-message" id="confirmError"></div>
                    </div>

                    <button type="submit" class="login-btn" style="margin-top:20px;">
                        <i class="fas fa-key me-2"></i>Reset Password
                    </button>

                    <p class="signup-link">
                        <a href="${pageContext.request.contextPath}/page?name=login">Back to Login</a>
                    </p>

                </form>

            <% } %>

        </section>

        <!-- Right Section -->
        <aside class="login-image-section">
            <div class="pattern-overlay"></div>
            <img src="${pageContext.request.contextPath}/assets/images/auth_img/building.png"
                 alt="Reset Password"
                 class="login-image">
        </aside>

    </div>
</main>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        const form = document.querySelector(".login-form");
        if (!form) return;

        const passwordInput = document.getElementById("password");
        const confirmInput = document.getElementById("confirmPassword");

        // Real-time confirm password check
        confirmInput.addEventListener("input", function () {
            const error = document.getElementById("confirmError");
            if (this.value !== passwordInput.value) {
                error.innerText = "Passwords do not match";
                error.style.display = "block";
                this.classList.add("input-error");
            } else {
                error.style.display = "none";
                this.classList.remove("input-error");
            }
        });

        // Form submit validation
        form.addEventListener("submit", function (e) {
            let valid = true;

            const password = passwordInput.value.trim();
            const confirm = confirmInput.value.trim();

            const pError = document.getElementById("passwordError");
            const cError = document.getElementById("confirmError");

            // Clear errors
            pError.style.display = "none";
            cError.style.display = "none";
            passwordInput.classList.remove("input-error");
            confirmInput.classList.remove("input-error");

            if (password === "") {
                pError.innerText = "Password is required";
                pError.style.display = "block";
                passwordInput.classList.add("input-error");
                valid = false;
            } else if (password.length < 6) {
                pError.innerText = "Password must be at least 6 characters";
                pError.style.display = "block";
                passwordInput.classList.add("input-error");
                valid = false;
            }

            if (confirm === "") {
                cError.innerText = "Please confirm your password";
                cError.style.display = "block";
                confirmInput.classList.add("input-error");
                valid = false;
            } else if (confirm !== password) {
                cError.innerText = "Passwords do not match";
                cError.style.display = "block";
                confirmInput.classList.add("input-error");
                valid = false;
            }

            if (!valid) e.preventDefault();
        });

    });
</script>

</body>
</html>