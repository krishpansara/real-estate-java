<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Real Estate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@300;400;500;600&family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/contact_us.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">
   
        
</head>
<body>

   <!-- Header -->
   <jsp:include page="/WEB-INF/views/Auth_component/auth_header.jsp" />
    
    <!-- Page Header -->
    <div class="page-header">
        <div class="container">
            <div class="page-header-content">
                <h1>Get In Touch</h1>
                <p>Have questions? We'd love to hear from you. Send us a message and we'll respond as soon as possible.</p>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="container">
        
        <!-- Contact Cards -->
        <div class="row g-4 contact-cards">
            <div class="col-md-4">
                <div class="contact-card">
                    <div class="contact-card-icon">
                        ☎
                    </div>
                    <h3>Call Us</h3>
                    <p>Mon-Fri from 8am to 5pm</p>
                    <a href="tel:+916356503668">+91 63565 03668</a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="contact-card">
                    <div class="contact-card-icon">
                        ✉
                    </div>
                    <h3>Email Us</h3>
                    <p>We'll reply within 24 hours</p>
                    <a href="mailto:info@realestate.com">info@realestate.com</a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="contact-card">
                    <div class="contact-card-icon">
                        📍
                    </div>
                    <h3>Visit Us</h3>
                    <p>Come say hello at our office</p>
                    <a href="#map">Barcelona, Spain</a>
                </div>
            </div>
        </div>
        
        <!-- Contact Form and Info -->
        <div class="row g-4">
            <div class="col-lg-7">
                <div class="contact-form-section">                    
                    <h2 class="section-title">Send us a Message</h2>
                    <p class="section-subtitle">Fill out the form below and we'll get in touch with you shortly</p>
                    
                    <form id="contactForm">
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">
                                    First Name <span class="required">*</span>
                                </label>
                                <input type="text" class="form-control" name="firstName" required placeholder="Aditya">
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">
                                    Last Name <span class="required">*</span>
                                </label>
                                <input type="text" class="form-control" name="lastName" required placeholder="Dodiya">
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">
                                    Email Address <span class="required">*</span>
                                </label>
                                <input type="email" class="form-control" name="email" required placeholder="aditya@example.com">
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">
                                    Phone Number
                                </label>
                                <input type="tel" class="form-control" name="phone" placeholder="9876543210">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">
                                Subject <span class="required">*</span>
                            </label>
                            <select class="form-control" name="subject" required>
                                <option value="">Select a subject</option>
                                <option value="general">General Inquiry</option>
                                <option value="property">Property Information</option>
                                <option value="viewing">Schedule a Viewing</option>
                                <option value="selling">Selling Property</option>
                                <option value="partnership">Partnership Opportunity</option>
                                <option value="support">Customer Support</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">
                                Message <span class="required">*</span>
                            </label>
                            <textarea class="form-control textarea" name="message" required placeholder="Tell us more about your inquiry..."></textarea>
                        </div>
                        
                        <button type="submit" class="submit-btn">
                            Send Message ✈
                        </button>
                    </form>
                </div>
            </div>
            
            <div class="col-lg-5">
                <div class="info-section">
                    <div class="info-card">
                        <h3>Contact Information</h3>
                        
                        <div class="info-item">
                            <div class="info-icon">
                                📍
                            </div>
                            <div class="info-content">
                                <h4>Address</h4>
                                <p>
                                    Rajkot-Bhavnagar Highway, Gadhaka Rd,<br>
                                    Tramba, Gujarat 360020
                                </p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">
                                ☎
                            </div>
                            <div class="info-content">
                                <h4>Phone</h4>
                                <p>
                                    Main: <a href="tel:+34912345678">+34 912 345 678</a><br>
                                    Mobile: <a href="tel:+34623456789">+34 623 456 789</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">
                                ✉
                            </div>
                            <div class="info-content">
                                <h4>Email</h4>
                                <p>
                                    Info: <a href="mailto:info@realestate.com">info@realestate.com</a><br>
                                    Support: <a href="mailto:support@realeestate.com">support@realestate.com</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">
                                🕐
                            </div>
                            <div class="info-content">
                                <h4>Business Hours</h4>
                                <p>
                                    Monday - Friday: 8:00 AM - 5:00 PM<br>
                                    Saturday: 9:00 AM - 2:00 PM<br>
                                    Sunday: Closed
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Map Section -->
        <div class="map-section" id="map">
            <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30409.04726850998!2d70.92161970376449!3d22.243112440475088!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1770898838242!5m2!1sen!2sin" 
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                     referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
        
    </div>
    
    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/component/footer.jsp" />
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Font Awesome - Load at END of body for better reliability -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
</body>
</html>
