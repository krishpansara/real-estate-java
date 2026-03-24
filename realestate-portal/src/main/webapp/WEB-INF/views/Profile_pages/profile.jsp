<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Real Estate</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">    
    
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
        
        /* Profile Header */
        .profile-header {
            background: linear-gradient(135deg, #1dd1a1 0%, #10ac84 100%);
            color: white;
            padding: 3rem 0 6rem 0;
            margin-bottom: -3rem;
            position: relative;
            overflow: hidden;
        }
        
        .profile-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 500px;
            height: 500px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .profile-header::after {
            content: '';
            position: absolute;
            bottom: -30%;
            left: -5%;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 50%;
        }
        
        .profile-container {
            position: relative;
            z-index: 1;
        }
        
        .profile-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2.5rem;
            margin-top: 2rem;
        }
        
        .profile-avatar {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1dd1a1, #10ac84);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3.5rem;
            color: white;
            margin: 0 auto 1.5rem;
            box-shadow: 0 8px 25px rgba(29, 209, 161, 0.3);
            position: relative;
        }
        
        .profile-avatar img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .profile-info h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #2d3436;
        }
        
        .profile-info p {
            color: #636e72;
            font-size: 1.1rem;
            margin-bottom: 0.3rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .profile-info .icon {
            font-size: 1rem;
            color: #1dd1a1;
        }
        
        .profile-stats {
            display: flex;
            justify-content: center;
            gap: 3rem;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid #f0f0f0;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-item .number {
            font-size: 2rem;
            font-weight: 700;
            color: #1dd1a1;
            display: block;
        }
        
        .stat-item .label {
            color: #636e72;
            font-size: 0.9rem;
            margin-top: 0.3rem;
        }
        
        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
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
            text-decoration: none;
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(29, 209, 161, 0.4);
            background: linear-gradient(135deg, #10ac84, #1dd1a1);
            color: white;
        }
        
        .btn-outline-custom {
            background: transparent;
            border: 2px solid #1dd1a1;
            color: #1dd1a1;
            padding: 0.9rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
        }
        
        .btn-outline-custom:hover {
            background: #1dd1a1;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(29, 209, 161, 0.3);
        }
        
        .btn-logout {
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
        }
        
        .btn-logout:hover {
            background: #ff6b6b;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }
        
        /* Properties Section */
        .properties-section {
            padding: 4rem 0;
        }
        
        .section-title {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3436;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #1dd1a1, #10ac84);
            border-radius: 2px;
        }
        
        .section-subtitle {
            color: #636e72;
            font-size: 1.1rem;
            margin-bottom: 3rem;
        }
        
        .property-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            margin-bottom: 2rem;
            height: 100%;
        }
        
        .property-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        }
        
        .property-image {
            position: relative;
            height: 240px;
            overflow: hidden;
        }
        
        .property-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .property-card:hover .property-image img {
            transform: scale(1.05);
        }
        
        .property-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(29, 209, 161, 0.95);
            color: white;
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        
        .property-badge.sold {
            background: rgba(255, 107, 107, 0.95);
        }
        
        .property-content {
            padding: 1.5rem;
        }
        
        .property-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }
        
        .property-location {
            color: #636e72;
            font-size: 0.95rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .property-location .icon {
            color: #1dd1a1;
            font-size: 1rem;
        }
        
        .property-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1dd1a1;
            margin-bottom: 1rem;
        }
        
        .property-actions {
            display: flex;
            gap: 0.5rem;
            padding-top: 1rem;
            border-top: 1px solid #f0f0f0;
        }
        
        .btn-action {
            flex: 1;
            padding: 0.6rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.4rem;
        }
        
        .btn-edit {
            background: #e8f8f5;
            color: #1dd1a1;
        }
        
        .btn-edit:hover {
            background: #1dd1a1;
            color: white;
        }
        
        .btn-delete {
            background: #ffe8e8;
            color: #ff6b6b;
        }
        
        .btn-delete:hover {
            background: #ff6b6b;
            color: white;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }
        
        .empty-state .icon {
            font-size: 5rem;
            color: #dfe6e9;
            margin-bottom: 1.5rem;
        }
        
        .empty-state h3 {
            font-size: 1.5rem;
            color: #636e72;
            margin-bottom: 1rem;
        }
        
        .empty-state p {
            color: #b2bec3;
            margin-bottom: 2rem;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .profile-stats {
                gap: 1.5rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-primary-custom,
            .btn-outline-custom,
            .btn-logout {
                width: 100%;
                justify-content: center;
            }
            
            .property-actions {
                flex-direction: column;
            }
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
        
        .profile-card {
            animation: fadeInUp 0.6s ease;
        }
        
        .property-card {
            animation: fadeInUp 0.6s ease;
        }
        
        .property-card:nth-child(1) { animation-delay: 0.1s; }
        .property-card:nth-child(2) { animation-delay: 0.2s; }
        .property-card:nth-child(3) { animation-delay: 0.3s; }
    </style>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="/WEB-INF/views/component/header.jsp" />

    <!-- Profile Header -->
    <section class="profile-header">
        <div class="container profile-container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="profile-card text-center">
                        <div class="profile-avatar">
                            <!-- User Icon -->
                            👤
                        </div>
                        <div class="profile-info">
                            <h2 id="userName">John Doe</h2>
                            <p><span class="icon">✉</span> <span id="userEmail">john.doe@example.com</span></p>
                            <p><span class="icon">📞</span> <span id="userPhone">+1 234 567 8900</span></p>
                            <p><span class="icon">📅</span> Member since <span id="memberSince">January 2024</span></p>
                        </div>
                        
                        <div class="profile-stats">
                            <div class="stat-item">
                                <span class="number" id="totalProperties">12</span>
                                <span class="label">Properties Listed</span>
                            </div>
                            <div class="stat-item">
                                <span class="number" id="activeProperties">8</span>
                                <span class="label">Active</span>
                            </div>
                            <div class="stat-item">
                                <span class="number" id="soldProperties">4</span>
                                <span class="label">Sold</span>
                            </div>
                        </div>
                        
                        <div class="action-buttons">
                            <a href="${pageContext.request.contextPath}/page?name=property_listing" class="btn-outline-custom">
                                <span>➕</span> Add Property
                            </a>
                            <a href="${pageContext.request.contextPath}/page?name=edit_profile" class="btn-outline-custom">
                                <span>✏</span> Edit Profile
                            </a>
                            <form method="post" action="${pageContext.request.contextPath}/logout">
	                            <button class="btn-logout">
	                                <span>🚪</span> Logout
	                            </button>
	                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- My Properties Section -->
    <section class="properties-section">
        <div class="container">
            <div class="mb-4">
                <h2 class="section-title">My Properties</h2>
                <p class="section-subtitle">Manage all your listed properties</p>
            </div>
            
            <div id="propertiesContainer" class="row">
                <!-- Property Card 1 -->
                <div class="col-lg-4 col-md-6">
                    <div class="property-card">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600" alt="Property">
                            <span class="property-badge">Active</span>
                        </div>
                        <div class="property-content">
                            <h3 class="property-title">Large 4-room apartment with a beautiful terrace</h3>
                            <div class="property-location">
                                <span class="icon">📍</span>
                                Barcelona IV
                            </div>
                            <div class="property-price">320 000₹</div>
                            <div class="property-actions">
                                <button class="btn-action btn-edit" onclick="editProperty(1)">
                                    <span>✏</span> Edit
                                </button>
                                <button class="btn-action btn-delete" onclick="deleteProperty(1)">
                                    <span>🗑</span> Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Property Card 2 -->
                <div class="col-lg-4 col-md-6">
                    <div class="property-card">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=600" alt="Property">
                            <span class="property-badge">Active</span>
                        </div>
                        <div class="property-content">
                            <h3 class="property-title">Magnificent duplex in a private villa</h3>
                            <div class="property-location">
                                <span class="icon">📍</span>
                                Barcelona II
                            </div>
                            <div class="property-price">315 000₹</div>
                            <div class="property-actions">
                                <button class="btn-action btn-edit" onclick="editProperty(2)">
                                    <span>✏</span> Edit
                                </button>
                                <button class="btn-action btn-delete" onclick="deleteProperty(2)">
                                    <span>🗑</span> Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Property Card 3 -->
                <div class="col-lg-4 col-md-6">
                    <div class="property-card">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=600" alt="Property">
                            <span class="property-badge sold">Sold</span>
                        </div>
                        <div class="property-content">
                            <h3 class="property-title">51 large design apartment with terrace</h3>
                            <div class="property-location">
                                <span class="icon">📍</span>
                                Madrid VI
                            </div>
                            <div class="property-price">280 000₹</div>
                            <div class="property-actions">
                                <button class="btn-action btn-edit" onclick="viewDetails(3)">
                                    <span>👁</span> View Details
                                </button>
                                <button class="btn-action btn-delete" onclick="deleteProperty(3)">
                                    <span>🗑</span> Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/component/footer.jsp" />
	
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function editProperty(id) {
            window.location.href = '${pageContext.request.contextPath}/page?name=edit_property&id=' + id;
        }
        
        function deleteProperty(id) {
            if(confirm('Are you sure you want to delete this property?')) {
                // Add delete logic here
                console.log('Deleting property:', id);
            }
        }
        
        function viewDetails(id) {
            window.location.href = '${pageContext.request.contextPath}/page?name=detailed_view&id=' + id;
        }

    </script>
    
</body>
</html>
