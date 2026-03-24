<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Real Estate</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome - Multiple CDN Options for Reliability -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <!-- Fallback Font Awesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">
    
    <!-- Alternative Fallback -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #2d3436;
        }
        
        /* Ensure icons are displayed properly */
        i.fas, i.fa, i.far, i.fab {
            font-family: "Font Awesome 6 Free", "Font Awesome 5 Free", "FontAwesome" !important;
            font-weight: 900 !important;
            font-style: normal !important;
            display: inline-block !important;
        }
        
        /* Page Header */
        .page-header {
            background: linear-gradient(135deg, #1dd1a1 0%, #10ac84 100%);
            color: white;
            padding: 3rem 0;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 500px;
            height: 500px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .page-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }
        
        .page-header p {
            font-size: 1.1rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }
        
        .breadcrumb {
            background: transparent;
            padding: 0;
            margin: 0;
            position: relative;
            z-index: 1;
        }
        
        .breadcrumb-item {
            color: rgba(255, 255, 255, 0.8);
        }
        
        .breadcrumb-item a {
            color: white;
            text-decoration: none;
        }
        
        .breadcrumb-item.active {
            color: white;
        }
        
        .breadcrumb-item + .breadcrumb-item::before {
            color: rgba(255, 255, 255, 0.6);
        }
        
        /* Form Container */
        .form-container {
            max-width: 900px;
            margin: 0 auto 4rem;
        }
        
        .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            padding: 3rem;
            margin-bottom: 2rem;
        }
        
        .form-section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .form-section-title i {
            color: #1dd1a1;
            font-size: 1.3rem;
        }
        
        .form-section-subtitle {
            color: #636e72;
            font-size: 0.95rem;
            margin-bottom: 2rem;
            padding-left: 2.1rem;
        }
        
        .form-divider {
            height: 2px;
            background: linear-gradient(90deg, #1dd1a1, transparent);
            margin: 2.5rem 0;
            border-radius: 2px;
        }
        
        /* Profile Picture Section */
        .profile-picture-section {
            text-align: center;
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 15px;
            margin-bottom: 2.5rem;
        }
        
        .profile-avatar-large {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1dd1a1, #10ac84);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: white;
            margin: 0 auto 1.5rem;
            box-shadow: 0 8px 25px rgba(29, 209, 161, 0.3);
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        
        .profile-avatar-large img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .profile-avatar-large input[type="file"] {
            display: none;
        }
        
        .avatar-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
            cursor: pointer;
        }
        
        .profile-avatar-large:hover .avatar-overlay {
            opacity: 1;
        }
        
        .avatar-overlay i {
            font-size: 2rem;
            color: white;
        }
        
        /* Form Elements */
        .form-label {
            font-weight: 500;
            color: #2d3436;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-label .required {
            color: #ff6b6b;
            margin-left: 0.2rem;
        }
        
        .form-control, .form-select {
            padding: 0.75rem 1rem;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #1dd1a1;
            box-shadow: 0 0 0 0.2rem rgba(29, 209, 161, 0.15);
            outline: none;
        }
        
        .form-control:hover, .form-select:hover {
            border-color: #1dd1a1;
        }
        
        .input-group-text {
            background: #f8f9fa;
            border: 2px solid #e9ecef;
            border-radius: 10px 0 0 10px;
            color: #636e72;
        }
        
        .input-group .form-control {
            border-radius: 0 10px 10px 0;
        }
        
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        
        /* Buttons */
        .btn-primary-custom {
            background: linear-gradient(135deg, #1dd1a1, #10ac84);
            border: none;
            color: white;
            padding: 0.9rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(29, 209, 161, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(29, 209, 161, 0.4);
            background: linear-gradient(135deg, #10ac84, #1dd1a1);
        }
        
        .btn-secondary-custom {
            background: transparent;
            border: 2px solid #dfe6e9;
            color: #636e72;
            padding: 0.9rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }
        
        .btn-secondary-custom:hover {
            background: #f8f9fa;
            border-color: #b2bec3;
            transform: translateY(-2px);
        }
        
        .btn-danger-custom {
            background: transparent;
            border: 2px solid #ff6b6b;
            color: #ff6b6b;
            padding: 0.9rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }
        
        .btn-danger-custom:hover {
            background: #ff6b6b;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }
        
        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2.5rem;
            flex-wrap: wrap;
        }
        
        /* Alert Messages */
        .alert-custom {
            border-radius: 10px;
            border: none;
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .alert-custom i {
            font-size: 1.5rem;
        }
        
        .alert-success-custom {
            background: #e8f8f5;
            color: #10ac84;
        }
        
        .alert-danger-custom {
            background: #ffe8e8;
            color: #ff6b6b;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .form-card {
                padding: 2rem 1.5rem;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn-primary-custom,
            .btn-secondary-custom,
            .btn-danger-custom {
                width: 100%;
                justify-content: center;
            }
            
            .page-header h1 {
                font-size: 2rem;
            }
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
        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .form-card {
            animation: fadeInUp 0.6s ease;
        }
    </style>
</head>
<body>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/page?name=profile">Profile</a></li>
                    <li class="breadcrumb-item active">Edit Profile</li>
                </ol>
            </nav>
            <h1>Edit Profile</h1>
            <p>Update your personal information and preferences</p>
        </div>
    </section>

    <!-- Edit Profile Form -->
    <section class="form-section">
        <div class="container">
            <div class="form-container">
                <!-- Success/Error Messages -->
                <!-- 
                <div class="alert-custom alert-success-custom">
                    <i class="fas fa-check-circle"></i>
                    <span>Profile updated successfully!</span>
                </div>
                -->
                
                <form id="editProfileForm" action="updateProfile.jsp" method="POST" enctype="multipart/form-data" novalidate>
                    <!-- Profile Picture Section -->
                    <div class="form-card">
                        <div class="profile-picture-section">
                            <div class="profile-avatar-large" onclick="document.getElementById('profilePicture').click()">
                                <i class="fas fa-user" id="avatarIcon"></i>
                                <img id="avatarPreview" src="" alt="Profile" style="display: none;">
                                <div class="avatar-overlay">
                                    <i class="fas fa-camera"></i>
                                </div>
                                <input type="file" id="profilePicture" name="profilePicture" accept="image/*" onchange="previewImage(event)">
                            </div>
                            <h5>Profile Picture</h5>
                            <p class="text-muted">Click to upload a new photo</p>
                        </div>
                    </div>
                    
                    <!-- Personal Information -->
                    <div class="form-card">
                        <h3 class="form-section-title">
                            <i class="fas fa-user-circle"></i>
                            Personal Information
                        </h3>
                        <p class="form-section-subtitle">Update your personal details</p>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">First Name <span class="required">*</span></label>
                                <input type="text" class="form-control" id="firstName" name="firstName" value="John" required>
								<div class="error-message" id="firstNameError"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName" class="form-label">Last Name <span class="required">*</span></label>
                                <input type="text" class="form-control" id="lastName" name="lastName" value="Doe" required>
								<div class="error-message" id="lastNameError"></div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
								<label for="email" class="form-label">Email Address <span class="required">*</span></label>
								
								<div class="input-group">
								<span class="input-group-text"><i class="fas fa-envelope"></i></span>
								<input type="email" class="form-control" id="email" name="email" required>
								</div>
								
								<div class="error-message" id="emailError"></div>
								
								</div>
                            <div class="col-md-6 mb-3">
                                <label for="phone" class="form-label">Phone Number <span class="required">*</span></label>
                                <div class="input-group">
									<span class="input-group-text"><i class="fas fa-phone"></i></span>
									<input type="tel" class="form-control" id="phone" name="phone" maxlength="10">
									</div>
									
									<div class="error-message" id="phoneError"></div>
                            </div>
                        </div>
                        
                        <div class="row">
							    <div class="col-md-12 mb-3">
							        <label for="aadhar" class="form-label">
							            Aadhaar Number <span class="required">*</span>
							        </label>
							
							        <div class="input-group">
							            <span class="input-group-text">
							                <i class="fas fa-id-card"></i>
							            </span>
							
							            <input type="text"
							                   class="form-control"
							                   id="aadhar"
							                   name="aadhar"
							                   maxlength="12"
							                   placeholder="Enter 12-digit Aadhaar Number"
							                   oninput="this.value=this.value.replace(/[^0-9]/g,'')">
							        </div>
							
							        <div class="error-message" id="aadharError"></div>
							    </div>
							</div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="dateOfBirth" class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth">
								<div class="error-message" id="dobError"></div>
                            </div>
                            <div class="col-md-6 mb-3">
							    <label for="gender" class="form-label">Gender</label>
							
							    <select class="form-select" id="gender" name="gender">
							        <option value="">Select Gender</option>
							        <option value="male">Male</option>
							        <option value="female">Female</option>
							        <option value="other">Other</option>
							        <option value="prefer_not_to_say">Prefer not to say</option>
							    </select>
							
							    <div class="error-message" id="genderError"></div>
							</div>
                        </div>
                    </div>
                    
                    <!-- Address Information -->
                    <div class="form-card">
                        <h3 class="form-section-title">
                            <i class="fas fa-map-marker-alt"></i>
                            Address Information
                        </h3>
                        <p class="form-section-subtitle">Update your location details</p>
                        
                        <div class="mb-3">
                            <label for="address" class="form-label">Street Address</label>
                            <input type="text" class="form-control" id="address" name="address">
							<div class="error-message" id="addressError"></div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="city" class="form-label">City</label>
                                <input type="text" class="form-control" id="city" name="city">
								<div class="error-message" id="cityError"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="state" class="form-label">State/Province</label>
                                <input type="text" class="form-control" id="state" name="state">
								<div class="error-message" id="stateError"></div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="zipCode" class="form-label">Zip/Postal Code</label>
                                <input type="text" class="form-control" id="zipCode" name="zipCode">
								<div class="error-message" id="zipError"></div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="country" class="form-label">Country</label>
                                <input type="text" class="form-control" id="country" name="country">
								<div class="error-message" id="countryError"></div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Change Password -->
                    <div class="form-card">
                        <h3 class="form-section-title">
                            <i class="fas fa-lock"></i>
                            Change Password
                        </h3>
                        <p class="form-section-subtitle">Leave blank to keep current password</p>
                        
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Current Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                                <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Enter current password">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password" oninput="checkPasswordStrength()">
                            </div>
                            <div class="password-strength" id="passwordStrength" style="margin-top: 10px;"></div>
                        </div>
                        
                        <div class="mb-3">
    
							<label for="confirmPassword" class="form-label">
							Confirm New Password
							</label>
							
							<div class="input-group">
							<span class="input-group-text">
							<i class="fas fa-lock"></i>
							</span>
							
							<input type="password"
							class="form-control"
							id="confirmPassword"
							name="confirmPassword"
							placeholder="Confirm new password">
							
							</div>
							
							<div class="error-message" id="confirmPasswordError"></div>
							
							</div>
                    </div>
                    
                    <!-- Action Buttons -->
                    <div class="button-group">
                        <button type="submit" class="btn-primary-custom">
                            <i class="fas fa-save"></i> Save Changes
                        </button>
                        <button type="button" class="btn-secondary-custom" onclick="window.location.href='profile.jsp'">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                        <button type="button" class="btn-danger-custom" onclick="confirmDelete()">
                            <i class="fas fa-trash-alt"></i> Delete Account
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Check if Font Awesome is loaded
        window.addEventListener('load', function() {
            setTimeout(function() {
                const testIcon = document.querySelector('.fas');
                if (testIcon) {
                    const computedStyle = window.getComputedStyle(testIcon, ':before');
                    if (computedStyle.content === 'none' || computedStyle.content === '') {
                        console.warn('Font Awesome might not be loaded properly. Using fallback...');
                        // Add a local fallback or text alternatives here if needed
                    }
                }
            }, 500);
        });
        
        // Image preview function
        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const avatarPreview = document.getElementById('avatarPreview');
                    const avatarIcon = document.getElementById('avatarIcon');
                    avatarPreview.src = e.target.result;
                    avatarPreview.style.display = 'block';
                    avatarIcon.style.display = 'none';
                }
                reader.readAsDataURL(file);
            }
        }
        
        // Password strength checker
        function checkPasswordStrength() {
            const password = document.getElementById('newPassword').value;
            const strengthDiv = document.getElementById('passwordStrength');
            
            if (password.length === 0) {
                strengthDiv.innerHTML = '';
                return;
            }
            
            let strength = 0;
            if (password.length >= 8) strength++;
            if (password.match(/[a-z]+/)) strength++;
            if (password.match(/[A-Z]+/)) strength++;
            if (password.match(/[0-9]+/)) strength++;
            if (password.match(/[$@#&!]+/)) strength++;
            
            let strengthText = '';
            let strengthColor = '';
            
            switch(strength) {
                case 0:
                case 1:
                    strengthText = 'Very Weak';
                    strengthColor = '#ff6b6b';
                    break;
                case 2:
                    strengthText = 'Weak';
                    strengthColor = '#ffa502';
                    break;
                case 3:
                    strengthText = 'Medium';
                    strengthColor = '#f9ca24';
                    break;
                case 4:
                    strengthText = 'Strong';
                    strengthColor = '#6ab04c';
                    break;
                case 5:
                    strengthText = 'Very Strong';
                    strengthColor = '#1dd1a1';
                    break;
            }
            
            strengthDiv.innerHTML = `
                <div style="height: 4px; background: ${strengthColor}; width: ${strength * 20}%; transition: all 0.3s; border-radius: 2px;"></div>
                <small style="color: ${strengthColor}; margin-top: 5px; display: block; font-size: 0.85rem;">${strengthText}</small>
            `;
        }
        
        // Confirm delete account
        function confirmDelete() {
            if (confirm('Are you sure you want to delete your account? This action cannot be undone.')) {
                // Add your delete account logic here
                alert('Account deletion functionality would be implemented here.');
            }
        }
        
        // Form validation
     document.getElementById('editProfileForm').addEventListener('submit', function(e) {

				let valid = true;
				
				function showError(id,message){

					const error=document.getElementById(id);
					error.innerText=message;
					error.style.display="block";

					/* Find input/select inside same container */

					const container=error.closest(".mb-3, .col-md-6");
					if(container){
					const field=container.querySelector("input, select");
					if(field){
					field.classList.add("input-error");
					}
					}

					valid=false;

					}

				function clearError(id){

					const error=document.getElementById(id);
					error.innerText="";
					error.style.display="none";

					const container=error.closest(".mb-3, .col-md-6");
					if(container){
					const field=container.querySelector("input, select");
					if(field){
					field.classList.remove("input-error");
					}
					}
					}
				const firstName=document.getElementById("firstName").value.trim();
				const lastName=document.getElementById("lastName").value.trim();
				const email=document.getElementById("email").value.trim();
				const phone=document.getElementById("phone").value.trim();
				const dob=document.getElementById("dateOfBirth").value;
				const address=document.getElementById("address").value.trim();
				const city=document.getElementById("city").value.trim();
				const state=document.getElementById("state").value.trim();
				const zip=document.getElementById("zipCode").value.trim();
				const country=document.getElementById("country").value.trim();
				const gender = document.getElementById("gender").value;
				const aadhar = document.getElementById("aadhar").value.trim();
				
				const emailPattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				const phonePattern=/^[0-9]{10}$/;
				const zipPattern=/^[0-9]{5,6}$/;
			    const aadharPattern = /^[2-9]{1}[0-9]{11}$/;
				
				clearError("firstNameError");
				clearError("lastNameError");
				clearError("emailError");
				clearError("phoneError");
				clearError("dobError");
				clearError("addressError");
				clearError("cityError");
				clearError("stateError");
				clearError("zipError");
				clearError("countryError");
				clearError("confirmPasswordError");
				clearError("genderError");
				clearError("aadharError");
				
				if(firstName===""){
				showError("firstNameError","First name is required");
				}
				
				if(lastName===""){
				showError("lastNameError","Last name is required");
				}
				
				if(email===""){
				showError("emailError","Email is required");
				}
				else if(!emailPattern.test(email)){
				showError("emailError","Enter valid email address");
				}
				
				if(phone===""){
				showError("phoneError","Phone number is required");
				}
				else if(!phonePattern.test(phone)){
				showError("phoneError","Phone must be 10 digits");
				}
				
				if(dob===""){
				showError("dobError","Date of birth required");
				}
				
				if(address===""){
				showError("addressError","Address required");
				}
				
				if(city===""){
				showError("cityError","City required");
				}
				
				if(state===""){
				showError("stateError","State required");
				}
				
				if(zip===""){
				showError("zipError","Zip code required");
				}
				else if(!zipPattern.test(zip)){
				showError("zipError","Invalid zip code");
				}
				
				if(country===""){
				showError("countryError","Country required");
				}
				if(gender === ""){
				    showError("genderError","Please select your gender");
				}
				  if(aadhar === ""){
				        showError("aadharError","Aadhaar required");
				    } else if(!aadharPattern.test(aadhar)){
				        showError("aadharError","Enter valid 12-digit Aadhaar");
				    }
				
				if(!valid){
				e.preventDefault();
				return false;
				}
				
				/* YOUR ORIGINAL PASSWORD VALIDATION */
				
				const newPassword=document.getElementById("newPassword").value;
				const confirmPassword=document.getElementById("confirmPassword").value;
				
				if(newPassword && newPassword!==confirmPassword){
				e.preventDefault();
				showError("confirmPasswordError","Passwords do not match");
				return false;
				}
				
				});
    </script>
</body>
</html>

