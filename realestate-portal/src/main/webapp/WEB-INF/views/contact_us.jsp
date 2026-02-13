<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Real Estate</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@300;400;500;600&family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #00CED1;
            --primary-dark: #00A8AA;
            --text-dark: #2C3E50;
            --text-light: #6C757D;
            --border-color: #E5E7EB;
            --card-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            --card-hover-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);

            --font-heading: 'Merriweather', serif;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-dark);
            background-color: #F9FAFB;
            overflow-x: hidden;
        }

        h2, h3, h4, h5, h6 {
            font-family: var(--font-heading);
        }
        
        /* Navigation */
        .navbar {
            background-color: #fff;
            padding: 1.2rem 0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
            animation: slideDown 0.5s ease;
        }
        
        .navbar-brand {
            font-family: 'Poppins', serif;
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
        }
        
        .navbar-brand i {
            color: var(--primary-color);
            font-size: 1.8rem;
        }
        
        .nav-link {
            color: var(--text-dark);
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: var(--transition);
            position: relative;
        }
        
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: var(--primary-color);
            transition: var(--transition);
            transform: translateX(-50%);
        }
        
        .nav-link:hover {
            color: var(--primary-color);
        }
        
        .nav-link:hover::after {
            width: 80%;
        }
        
        .nav-link.active {
            color: var(--primary-color);
        }
        
        /* Page Header */
        .page-header {
            background: linear-gradient(135deg, #00CED1 0%, #00A8AA 100%);
            padding: 5rem 0 3rem;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        
        .page-header-content {
            position: relative;
            z-index: 1;
            text-align: center;
        }
        
        .page-header h1 {
            font-family: var(--font-heading);
            color: #fff;
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            animation: fadeInUp 0.6s ease 0.2s both;
        }
        
        .page-header p {
            color: rgba(255, 255, 255, 0.95);
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
            animation: fadeInUp 0.6s ease 0.3s both;
        }
        
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
        
        /* Contact Cards Section */
        .contact-cards {
            margin-bottom: 3rem;
        }
        
        .contact-card {
            background: #fff;
            border-radius: 12px;
            padding: 2.5rem 2rem;
            box-shadow: var(--card-shadow);
            transition: var(--transition);
            height: 100%;
            text-align: center;
            animation: fadeInUp 0.6s ease both;
        }
        
        .contact-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--card-hover-shadow);
        }
        
        .contact-card-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, rgba(0, 206, 209, 0.1) 0%, rgba(0, 168, 170, 0.1) 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            transition: var(--transition);
        }
        
        .contact-card-icon i {
            font-size: 2rem;
            color: var(--primary-color);
            transition: var(--transition);
        }
        
        
        .contact-card h3 {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.8rem;
        }
        
        .contact-card p {
            color: var(--text-light);
            margin-bottom: 1rem;
            line-height: 1.6;
        }
        
        .contact-card a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
        }
        
        .contact-card a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }
        
        /* Contact Form Section */
        .contact-form-section {
            background: #fff;
            border-radius: 16px;
            box-shadow: var(--card-shadow);
            padding: 3rem;
            margin-bottom: 3rem;
            animation: fadeInUp 0.6s ease 0.4s both;
        }
        
        .section-title {
            font-family: 'Merriweather', serif;
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.8rem;
        }
        
        .section-subtitle {
            color: var(--text-light);
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            display: block;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-label .required {
            color: #EF4444;
        }
        
        .form-control {
            width: 100%;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 0.9rem 1.2rem;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: var(--transition);
            background: #fff;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 206, 209, 0.1);
            outline: none;
        }
        
        .form-control.textarea {
            min-height: 150px;
            resize: vertical;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }
        
        .submit-btn {
            background: var(--primary-color);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 1rem 3rem;
            font-weight: 600;
            font-size: 1rem;
            transition: var(--transition);
            cursor: pointer;
            margin-top: 1rem;
        }
        
        .submit-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 206, 209, 0.3);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .submit-btn i {
            margin-left: 0.5rem;
        }
        
        /* Map Section */
        .map-section {
            margin-bottom: 3rem;
            animation: fadeInUp 0.6s ease 0.5s both;
        }
        
        .map-container {
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            height: 450px;
            position: relative;
        }
        
        .map-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        /* Info Section */
        .info-section {
            animation: fadeInUp 0.6s ease 0.6s both;
        }
        
        .info-card {
            background: linear-gradient(135deg, rgba(0, 206, 209, 0.05) 0%, rgba(0, 168, 170, 0.05) 100%);
            border-radius: 12px;
            padding: 2.5rem;
            border: 2px solid rgba(0, 206, 209, 0.1);
        }
        
        .info-card h3 {
            font-family: var(--font-heading);
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 1.5rem;
        }
        
        .info-item {
            display: flex;
            align-items: start;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .info-item:last-child {
            margin-bottom: 0;
        }
        
        .info-icon {
            width: 45px;
            height: 45px;
            background: var(--primary-color);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        
        .info-icon i {
            color: #fff;
            font-size: 1.2rem;
        }
        
        .info-content h4 {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.3rem;
            font-size: 1.05rem;
        }
        
        .info-content p {
            color: var(--text-light);
            margin: 0;
            line-height: 1.6;
        }
        
        .info-content a {
            color: var(--primary-color);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .info-content a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }
        
        /* Social Links */
        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .social-link {
            width: 45px;
            height: 45px;
            background: #fff;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-dark);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .social-link:hover {
            background: var(--primary-color);
            border-color: var(--primary-color);
            color: #fff;
            transform: translateY(-3px);
        }
        
        /* Success Message */
        .success-message {
            display: none;
            background: #10B981;
            color: #fff;
            padding: 1rem 1.5rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            animation: slideInDown 0.3s ease;
        }
        
        .success-message.show {
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .success-message i {
            font-size: 1.5rem;
        }
        
        /* Footer */
        .footer {
            background: var(--primary-color);
            color: #fff;
            padding: 2rem 0;
            margin-top: 4rem;
        }
        
        .footer-brand {
            font-family: 'Poppins', serif;
            font-weight: 700;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        
        .footer-links {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            align-items: center;
        }
        
        .footer-links a {
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            transition: var(--transition);
            font-weight: 500;
        }
        
        .footer-links a:hover {
            color: #fff;
            transform: translateX(3px);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .page-header h1 {
                font-size: 2rem;
            }
            
            .page-header p {
                font-size: 1rem;
            }
            
            .contact-form-section {
                padding: 2rem 1.5rem;
            }
            
            .section-title {
                font-size: 1.8rem;
            }
            
            .form-row {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
            
            .submit-btn {
                width: 100%;
            }
            
            .info-card {
                padding: 1.5rem;
            }
            
            .footer-links {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.8rem;
            }
        }
    </style>
</head>
<body>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-home"></i>
                Real Estate
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="top-offers.jsp">Top offers</a>
                    </li>
					<li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/page?name=explore">Explore</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/page?name=contact_us">Contact us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
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
                        <i class="fas fa-phone"></i>
                    </div>
                    <h3>Call Us</h3>
                    <p>Mon-Fri from 8am to 5pm</p>
                    <a href="tel:+916356503668">+91 63565 03668</a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="contact-card">
                    <div class="contact-card-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h3>Email Us</h3>
                    <p>We'll reply within 24 hours</p>
                    <a href="mailto:info@realestate.com">info@realestate.com</a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="contact-card">
                    <div class="contact-card-icon">
                        <i class="fas fa-map-marker-alt"></i>
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
                    
                    <form id="contactForm" onsubmit="submitContactForm(event)">
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
                            Send Message
                            <i class="fas fa-paper-plane"></i>
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
                                <i class="fas fa-map-marker-alt"></i>
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
                                <i class="fas fa-phone"></i>
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
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="info-content">
                                <h4>Email</h4>
                                <p>
                                    Info: <a href="mailto:info@realestate.com">info@realestate.com</a><br>
                                    Support: <a href="mailto:support@realestate.com">support@realestate.com</a>
                                </p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-clock"></i>
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
                <!-- Replace with your actual Google Maps embed or custom map -->
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30409.04726850998!2d70.92161970376449!3d22.243112440475088!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University%20Main%20Campus!5e0!3m2!1sen!2sin!4v1770898838242!5m2!1sen!2sin" 
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                     referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
        
    </div>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4">
                    <div class="footer-brand">
                        <i class="fas fa-home"></i>
                        Real Estate
                    </div>
                </div>
                <div class="col-md-8">
                    <ul class="footer-links">
                        <li><a href="top-offers.jsp">Top offers</a></li>
                        <li><a href="search-results.jsp">Search in offers</a></li>
                        <li><a href="references.jsp">References</a></li>
                        <li><a href="about.jsp">About us</a></li>
                        <li><a href="team.jsp">Our team</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
