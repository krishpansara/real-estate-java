<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    // Prevent caching
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
    response.setDateHeader("Expires", 0);
    
    // Check if user is logged in - if not, redirect to login
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/page?name=login");
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
    <title>Favorite Properties - Real Estate</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">

    <!-- Prevent Back Navigation Script -->
    <script>
        window.onload = function() {
            // Prevent back button after successful login
            window.history.pushState(null, null, window.location.href);
            window.addEventListener('popstate', function() {
                window.history.pushState(null, null, window.location.href);
            });
            
            // Block Alt+Left/Right arrow keys
            document.addEventListener('keydown', function(e) {
                if ((e.altKey && e.code === 'ArrowLeft') || (e.altKey && e.code === 'ArrowRight')) {
                    e.preventDefault();
                    return false;
                }
            });
        };
    </script>

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
            animation: fadeInUp 0.6s ease;
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
            left: 50%;
            transform: translateX(-50%);
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

        .property-location i { color: #1dd1a1; }

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
        }

        .btn-view {
            background: #e8f8f5;
            color: #1dd1a1;
        }

        .btn-view:hover {
            background: #1dd1a1;
            color: white;
        }

        .btn-remove {
            background: #ffe8e8;
            color: #ff6b6b;
        }

        .btn-remove:hover {
            background: #ff6b6b;
            color: white;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }

        .empty-state i {
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

        @media (max-width: 768px) {
            .profile-stats { gap: 1.5rem; }
            .property-actions { flex-direction: column; }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .property-card:nth-child(1) { animation: fadeInUp 0.6s ease 0.1s both; }
        .property-card:nth-child(2) { animation: fadeInUp 0.6s ease 0.2s both; }
        .property-card:nth-child(3) { animation: fadeInUp 0.6s ease 0.3s both; }
    </style>
</head>
<body>

    <!-- Navbar -->
    <jsp:include page="/WEB-INF/views/component/header.jsp" />

    <!-- Favorite Properties Section -->
    <section class="properties-section">
        <div class="container">
            <div class="mb-4 text-center">
                <h2 class="section-title">My Favorites</h2>
                <p class="section-subtitle">All the properties you have marked as favorite</p>
            </div>

            <div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="property-card">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600" alt="Property">
                            <span class="property-badge">For Sale</span>
                        </div>
                        <div class="property-content">
                            <h3 class="property-title">Large 4-room apartment with a beautiful terrace</h3>
                            <div class="property-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Barcelona IV
                            </div>
                            <div class="property-price">320 000₹</div>
                            <div class="property-actions">
                                <button class="btn-action btn-view" onclick="viewProperty(1)">
                                    <i class="fas fa-eye"></i> View
                                </button>
                                <button class="btn-action btn-remove" onclick="removeFavorite(1)">
                                    <i class="fas fa-heart-broken"></i> Remove
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="property-card">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=600" alt="Property">
                            <span class="property-badge">For Sale</span>
                        </div>
                        <div class="property-content">
                            <h3 class="property-title">Magnificent duplex in a private villa</h3>
                            <div class="property-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Barcelona II
                            </div>
                            <div class="property-price">315 000₹</div>
                            <div class="property-actions">
                                <button class="btn-action btn-view" onclick="viewProperty(2)">
                                    <i class="fas fa-eye"></i> View
                                </button>
                                <button class="btn-action btn-remove" onclick="removeFavorite(2)">
                                    <i class="fas fa-heart-broken"></i> Remove
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="property-card">
                        <div class="property-image">
                            <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=600" alt="Property">
                            <span class="property-badge">For Rent</span>
                        </div>
                        <div class="property-content">
                            <h3 class="property-title">51 large design apartment with terrace</h3>
                            <div class="property-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Madrid VI
                            </div>
                            <div class="property-price">1 800₹/mo</div>
                            <div class="property-actions">
                                <button class="btn-action btn-view" onclick="viewProperty(3)">
                                    <i class="fas fa-eye"></i> View
                                </button>
                                <button class="btn-action btn-remove" onclick="removeFavorite(3)">
                                    <i class="fas fa-heart-broken"></i> Remove
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
        function viewProperty(id) {
            window.location.href = "<%=request.getContextPath()%>/page?name=property_detail&id=" + id;
        }

        function removeFavorite(id) {
            // TODO: wire up to backend
        }
    </script>

</body>
</html>