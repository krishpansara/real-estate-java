<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Real Estate</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Reuse login CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login_style.css">

    <style>
        .back-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
        }
    </style>
</head>

<body>

<!-- Back Button -->
<button class="btn btn-outline-secondary back-btn"
        onclick="window.location.href='${pageContext.request.contextPath}/page?name=login'">
    <i class="fas fa-arrow-left"></i> Back
</button>

<!-- Main Forgot Password Section -->
<main class="login-page">
    <div class="login-container">

        <!-- Left Section -->
        <section class="login-form-section">
            <h1 class="login-title">Forgot Your Password?</h1>

            <p style="margin-bottom:20px;color:#666;">
                Enter your email and we’ll send a reset link.
            </p>

            <form class="login-form" action="${pageContext.request.contextPath}/forgot-password" method="post">

                <div class="form-group">
                    <div class="form-input-wrapper">
                        <i class="fas fa-envelope form-input-icon"></i>
                        <input type="email"
                               class="form-input"
                               name="email"
                               placeholder="Enter your registered email"
                               required>
                    </div>
                </div>

                <button type="submit" class="login-btn">
                    Send Reset Link
                </button>

                <p class="signup-link">
                    Remember your password?
                    <a href="${pageContext.request.contextPath}/page?name=login">
                        Back to Login
                    </a>
                </p>

            </form>
        </section>

        <!-- Right Section - Different Image -->
        <aside class="login-image-section">
            <div class="pattern-overlay"></div>
            <img src="${pageContext.request.contextPath}/assets/images/auth_img/building.png"
                 alt="Password recovery"
                 class="login-image">
        </aside>

    </div>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>