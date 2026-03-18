<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Real Estate</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signup_style.css">

    <style>
        .back-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
        }
        .row-inputs {
		    display: flex;
		    gap: 15px;
	        flex-direction: row !important;
		}
		
		.row-inputs .form-input-wrapper {
		    flex: 1;
		}
    </style>
</head>

<body>

<!-- Main Signup Section -->
<main class="signup-page">
    <div class="signup-container">

        <!-- Left Section - Signup Form -->
        <section class="signup-form-section">
            <h1 class="signup-title">Don't Have an Account?</h1>

            <form class="signup-form" action="${pageContext.request.contextPath}/sign_up" method="post">
                <div >
	                <div class="form-group row-inputs">
	                    <div class="form-input-wrapper">
	                        <i class="fas fa-user form-input-icon"></i>
	                        <input type="text" class="form-input"
	                               name="fname"
	                               placeholder="First Name"
	                               required>
	                    </div>
	                    <div class="form-input-wrapper">
	                        <i class="fas fa-user form-input-icon"></i>
	                        <input type="text" class="form-input"
	                               name="lname"
	                               placeholder="Last Name"
	                               required>
	                    </div>
	                </div>
                </div>
                
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

                <div class="form-group">
                    <div class="form-input-wrapper">
                        <i class="fas fa-lock form-input-icon"></i>
                        <input type="password" class="form-input"
                               name="confirmPassword"
                               placeholder="Confirm Password"
                               required>
                    </div>
                </div>

                <button type="submit" class="signup-btn">
                    Create an account
                </button>

                <p class="login-link">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/page?name=login">
                        Login
                    </a>
                </p>

            </form>
        </section>

        <!-- Right Section - Image -->
        <aside class="signup-image-section">
            <div class="pattern-overlay"></div>
            <img src="${pageContext.request.contextPath}/assets/images/auth_img/building.png"
                 alt="Modern building"
                 class="signup-image">
        </aside>

    </div>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>