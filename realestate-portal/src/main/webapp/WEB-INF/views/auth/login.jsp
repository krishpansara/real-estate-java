<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Real Estate</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom CSS -->
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

<!-- Main Login Section -->
<main class="login-page">
    <div class="login-container">

        <!-- Left Section - Login Form -->
        <section class="login-form-section">
            <h1 class="login-title">Login to Your Account</h1>

            <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">

                <div class="form-group">
                    <div class="form-input-wrapper">
                        <i class="fas fa-envelope form-input-icon"></i>
                        <input type="email" class="form-input"
                               name="email"
                               placeholder="Enter Your E-mail Address"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-input-wrapper">
                        <i class="fas fa-lock form-input-icon"></i>
                        <input type="password" class="form-input"
                               name="password"
                               placeholder="Enter Your Password"
                               required>
                    </div>
                </div>

                <div class="forgot-password-wrapper">
                    <a href="${pageContext.request.contextPath}/page?name=forgot_password" class="forgot-password">Forgot Password?</a>
                </div>

                <button type="submit" class="login-btn">Login</button>

                <p class="signup-link">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/page?name=sign_up">
                        Sign up for free
                    </a>
                </p>

            </form>
        </section>

        <!-- Right Section - Image -->
        <aside class="login-image-section">
            <div class="pattern-overlay"></div>
            <img src="${pageContext.request.contextPath}/assets/images/auth_img/building.png"
                 alt="Modern building"
                 class="login-image">
        </aside>

    </div>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
