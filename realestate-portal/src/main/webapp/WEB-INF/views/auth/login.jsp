<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Add this in your login.jsp where you show error messages -->
<% if("success".equals(request.getParameter("passwordReset"))) { %>
    <div class="alert alert-success">
        <i class="fas fa-check-circle me-2"></i>
        Password reset successfully! Please login with your new password.
    </div>
<% } %>

<%
    // Prevent caching
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
    response.setDateHeader("Expires", 0);
    
    // Check if already logged in - redirect to home
    if (session.getAttribute("userId") != null) {
        response.sendRedirect(request.getContextPath() + "/page?name=home");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="pragma" content="no-cache">
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
        .error-message{
		    color:#ff0000;
		    font-size:0.85rem;
		    margin-top:5px;
		    display:none;
		}
		.input-error{
		    border-color:#ff0000 !important;
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
			<div class="server-error">			

				<c:if test="${param.error == 'empty_fields'}">
				    <p style="color:red;">All fields are required.</p>
				</c:if>

			</div>
            <form class="login-form" 
			      action="${pageContext.request.contextPath}/login" 
			      method="post"
			      novalidate>

                <!-- Email -->
				<div class="form-group">
				    <div class="form-input-wrapper">
				        <i class="fas fa-envelope form-input-icon"></i>
				        <input type="email" class="form-input"
				               id="email"
				               name="email"
				               placeholder="Enter Your E-mail Address">
				    </div>
				    <div class="error-message" id="emailError"></div>
				</div>
				
				<!-- Password -->
				<div class="form-group">
				    <div class="form-input-wrapper">
				        <i class="fas fa-lock form-input-icon"></i>
				        <input type="password" class="form-input"
				               id="password"
				               name="password"
				               placeholder="Enter Your Password">
				    </div>
				    <div class="error-message" id="passwordError"></div>
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
            <% if(request.getAttribute("error") != null) { %>
			    <div class="alert alert-danger">
			        <%= request.getAttribute("error") %>
			    </div>
			<% } %>
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


		<script>
		document.addEventListener("DOMContentLoaded", function(){
		
		    const form = document.querySelector(".login-form");
		
		    form.addEventListener("submit", function(e){
		
		        let valid = true;
		
		        function showError(id, message){
		            const error = document.getElementById(id);
		            const field = error.previousElementSibling.querySelector("input");
		
		            error.innerText = message;
		            error.style.display = "block";
		            field.classList.add("input-error");
		            valid = false;
		        }
		
		        function clearError(id){
		            const error = document.getElementById(id);
		            const field = error.previousElementSibling.querySelector("input");
		
		            error.innerText = "";
		            error.style.display = "none";
		            field.classList.remove("input-error");
		        }
		
		        const email = document.getElementById("email").value.trim();
		        const password = document.getElementById("password").value.trim();
		
		        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		        clearError("emailError");
		        clearError("passwordError");
		
		        if(email === ""){
		            showError("emailError","Email is required");
		        }
		        else if(!emailPattern.test(email)){
		            showError("emailError","Invalid email format");
		        }
		
		        if(password === ""){
		            showError("passwordError","Password is required");
		        }
		        else if(password.length < 6){
		            showError("passwordError","Password must be at least 6 characters");
		        }
		
		        if(!valid){
		            e.preventDefault();
		        }
		    });
		
		});
		</script>

</body>
</html>