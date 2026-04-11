<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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



<!-- Main Forgot Password Section -->
<main class="login-page">
    <div class="login-container">

        <!-- Left Section -->
        <section class="login-form-section">
            <h1 class="login-title">Forgot Your Password?</h1>

            <p style="margin-bottom:20px;color:#666;">
                Enter your email and we’ll send a reset link.
            </p>

            <form class="login-form" 
			      action="${pageContext.request.contextPath}/forgot-password" 
			      method="post"
			      novalidate>
			
			    <!-- Email Field -->	
			    <div class="form-group">
				    <div class="form-input-wrapper">
				        <i class="fas fa-envelope form-input-icon"></i>
				        <input type="email"
					       class="form-input"
					       id="email"
					       name="email"
					       placeholder="Enter your registered email">
				    </div>
				
				    <!-- Error Message -->
				    <div class="error-message" id="emailError"></div>
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
			<% if(request.getAttribute("error") != null) { %>
			    <div class="alert alert-danger">
			        <%= request.getAttribute("error") %>
			    </div>
			<% } %>
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
	<script>
		document.addEventListener("DOMContentLoaded", function(){
		
		    const form = document.querySelector(".login-form");
		    const emailInput = document.getElementById("email");
		
		    form.addEventListener("submit", function(e){
		
		        let valid = true;
		
		        function showError(message){
		            const error = document.getElementById("emailError");
		            error.innerText = message;
		            error.style.display = "block";
		            emailInput.classList.add("input-error");
		            valid = false;
		        }
		
		        function clearError(){
		            const error = document.getElementById("emailError");
		            error.innerText = "";
		            error.style.display = "none";
		            emailInput.classList.remove("input-error");
		        }
		
		        const email = emailInput.value.trim();
		        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		        clearError();
		
		        // 🔥 ALL VALIDATIONS
		        if(email === ""){
		            showError("Email is required");
		        }
		        else if(email.length < 5){
		            showError("Email is too short");
		        }
		        else if(email.length > 50){
		            showError("Email is too long");
		        }
		        else if(!emailPattern.test(email)){
		            showError("Enter valid email address (example@gmail.com)");
		        }
		
		        if(!valid){
		            e.preventDefault();
		        }
		    });
		
		    // ✅ Real-time validation
		    emailInput.addEventListener("input", function(){
		        const email = this.value.trim();
		        const error = document.getElementById("emailError");
		        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		        if(email === ""){
		            error.style.display = "none";
		            this.classList.remove("input-error");
		        }
		        else if(!emailPattern.test(email)){
		            error.innerText = "Invalid email format";
		            error.style.display = "block";
		            this.classList.add("input-error");
		        }
		        else{
		            error.style.display = "none";
		            this.classList.remove("input-error");
		        }
		    });
		
		});
		</script>	

</body>
</html>