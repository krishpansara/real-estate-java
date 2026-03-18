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
		.error-message{
		    color:#ff0000;
		    font-size:0.85rem;
		    margin-top:5px;
		    display:none;
		    width: 100%;
		}
		
		.input-error{
		    border-color:#ff0000 !important;
		}
		.input-box{
		    display: flex;
		    flex-direction: column;
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

            <form class="signup-form" 
      			action="${pageContext.request.contextPath}/sign_up" 
			      method="post"
			      novalidate>
                <div >
	                <div class="form-group row-inputs">

					    <!-- First Name -->
					    <div class="input-box">
					        <div class="form-input-wrapper">
					            <i class="fas fa-user form-input-icon"></i>
					            <input type="text" class="form-input" id="fname" name="fname" placeholder="First Name">
					        </div>
					        <div class="error-message" id="fnameError"></div>
					    </div>
					
					    <!-- Last Name -->
					    <div class="input-box">
					        <div class="form-input-wrapper">
					            <i class="fas fa-user form-input-icon"></i>
					            <input type="text" class="form-input" id="lname" name="lname" placeholder="Last Name">
					        </div>
					        <div class="error-message" id="lnameError"></div>
					    </div>
					
					</div>
                </div>
                
                <div class="form-group">
				    <div class="form-input-wrapper">
				        <i class="fas fa-envelope form-input-icon"></i>
				        <input type="email" class="form-input" id="email" name="email" placeholder="Enter Your E-mail Address">
				    </div>
				    <div class="error-message" id="emailError"></div>
				</div>

                <div class="form-group">
				    <div class="form-input-wrapper">
				        <i class="fas fa-lock form-input-icon"></i>
				        <input type="password" class="form-input" id="password" name="password" placeholder="Enter Your Password">
				    </div>
				    <div class="error-message" id="passwordError"></div>
				</div>

                <div class="form-group">
				    <div class="form-input-wrapper">
				        <i class="fas fa-lock form-input-icon"></i>
				        <input type="password" class="form-input" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
				    </div>
				    <div class="error-message" id="confirmPasswordError"></div>
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

		<script>
		document.addEventListener("DOMContentLoaded", function(){
		
		    const form = document.querySelector(".signup-form");
		
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
		
		        const fname = document.getElementById("fname").value.trim();
		        const lname = document.getElementById("lname").value.trim();
		        const email = document.getElementById("email").value.trim();
		        const password = document.getElementById("password").value;
		        const confirmPassword = document.getElementById("confirmPassword").value;
		
		        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		        // Clear all errors
		        clearError("fnameError");
		        clearError("lnameError");
		        clearError("emailError");
		        clearError("passwordError");
		        clearError("confirmPasswordError");
		
		        // Validation
		        if(fname === ""){
		            showError("fnameError","First name is required");
		        }
		
		        if(lname === ""){
		            showError("lnameError","Last name is required");
		        }
		
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
		
		        if(confirmPassword === ""){
		            showError("confirmPasswordError","Confirm your password");
		        }
		        else if(password !== confirmPassword){
		            showError("confirmPasswordError","Passwords do not match");
		        }
		
		        if(!valid){
		            e.preventDefault();
		        }
		    });
		
		});
		</script>

</body>
</html>